-- First-to-second purchase timing
-- Proxy dataset: Olist Brazilian E-Commerce Public Dataset
-- Goal: identify how quickly repeat customers return after their first order.

WITH orders AS (
    SELECT
        c.customer_unique_id,
        o.order_id,
        CAST(o.order_purchase_timestamp AS TIMESTAMP) AS purchase_ts,
        ROW_NUMBER() OVER (
            PARTITION BY c.customer_unique_id
            ORDER BY o.order_purchase_timestamp
        ) AS order_number
    FROM olist_orders_dataset o
    JOIN olist_customers_dataset c
      ON o.customer_id = c.customer_id
    WHERE o.order_status NOT IN ('canceled', 'unavailable')
),
first_second AS (
    SELECT
        customer_unique_id,
        MAX(CASE WHEN order_number = 1 THEN purchase_ts END) AS first_order_ts,
        MAX(CASE WHEN order_number = 2 THEN purchase_ts END) AS second_order_ts
    FROM orders
    GROUP BY customer_unique_id
)
SELECT
    COUNT(*) AS customers_with_2_orders,
    ROUND(AVG(DATEDIFF(day, first_order_ts, second_order_ts)), 1) AS avg_days_to_second_order,
    PERCENTILE_CONT(0.5) WITHIN GROUP (
        ORDER BY DATEDIFF(day, first_order_ts, second_order_ts)
    ) AS median_days_to_second_order
FROM first_second
WHERE second_order_ts IS NOT NULL;

-- Dialect note: DATEDIFF/PERCENTILE_CONT syntax may require adaptation for MySQL/PostgreSQL.
