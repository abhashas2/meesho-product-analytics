-- Customer value and order-frequency segmentation
-- Proxy dataset: Olist Brazilian E-Commerce Public Dataset

WITH customer_value AS (
    SELECT
        c.customer_unique_id,
        COUNT(DISTINCT o.order_id) AS orders,
        SUM(oi.price) AS product_value,
        SUM(oi.freight_value) AS freight_value
    FROM olist_customers_dataset c
    JOIN olist_orders_dataset o
      ON c.customer_id = o.customer_id
    JOIN olist_order_items_dataset oi
      ON o.order_id = oi.order_id
    WHERE o.order_status NOT IN ('canceled', 'unavailable')
    GROUP BY c.customer_unique_id
)
SELECT
    CASE
        WHEN orders = 1 THEN 'One-time'
        WHEN orders BETWEEN 2 AND 3 THEN 'Repeat'
        ELSE 'Frequent'
    END AS customer_segment,
    COUNT(*) AS customers,
    ROUND(AVG(orders), 2) AS avg_orders,
    ROUND(AVG(product_value), 2) AS avg_product_value,
    ROUND(AVG(freight_value), 2) AS avg_freight_value
FROM customer_value
GROUP BY
    CASE
        WHEN orders = 1 THEN 'One-time'
        WHEN orders BETWEEN 2 AND 3 THEN 'Repeat'
        ELSE 'Frequent'
    END
ORDER BY avg_orders DESC;

-- Use observed segment differences to inform product hypotheses; do not infer causality from this descriptive analysis.
