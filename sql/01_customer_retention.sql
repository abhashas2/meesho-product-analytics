-- Meesho Product Analytics Case Study
-- Proxy dataset: Olist Brazilian E-Commerce Public Dataset
-- Purpose: establish customer-level retention metrics before product recommendations.

-- Assumed tables:
-- olist_orders_dataset
-- olist_customers_dataset

-- 1. Customer order history
WITH customer_orders AS (
    SELECT
        c.customer_unique_id,
        o.order_id,
        o.order_purchase_timestamp,
        o.order_status,
        ROW_NUMBER() OVER (
            PARTITION BY c.customer_unique_id
            ORDER BY o.order_purchase_timestamp
        ) AS order_number
    FROM olist_orders_dataset o
    JOIN olist_customers_dataset c
      ON o.customer_id = c.customer_id
    WHERE o.order_status NOT IN ('canceled', 'unavailable')
)

-- 2. Overall repeat purchase rate
SELECT
    COUNT(*) AS unique_customers,
    SUM(CASE WHEN order_count >= 2 THEN 1 ELSE 0 END) AS repeat_customers,
    ROUND(
        100.0 * SUM(CASE WHEN order_count >= 2 THEN 1 ELSE 0 END) / COUNT(*),
        2
    ) AS repeat_purchase_rate_pct
FROM (
    SELECT customer_unique_id, COUNT(*) AS order_count
    FROM customer_orders
    GROUP BY customer_unique_id
) x;

-- Next analysis: first-to-second purchase timing and 30/60/90-day retention.
