-- Delivery experience vs. customer satisfaction
-- Proxy dataset: Olist Brazilian E-Commerce Public Dataset

WITH delivery AS (
    SELECT
        order_id,
        order_purchase_timestamp,
        order_delivered_customer_date,
        order_estimated_delivery_date,
        CASE
            WHEN order_delivered_customer_date > order_estimated_delivery_date
            THEN 1 ELSE 0
        END AS late_delivery
    FROM olist_orders_dataset
    WHERE order_delivered_customer_date IS NOT NULL
),
reviews AS (
    SELECT
        order_id,
        AVG(review_score) AS review_score
    FROM olist_order_reviews_dataset
    GROUP BY order_id
)
SELECT
    d.late_delivery,
    COUNT(*) AS orders,
    ROUND(AVG(r.review_score), 2) AS avg_review_score
FROM delivery d
LEFT JOIN reviews r
  ON d.order_id = r.order_id
GROUP BY d.late_delivery
ORDER BY d.late_delivery;

-- Use this as a diagnostic, not proof of causality.
-- Follow-up: control for category, order value and customer geography.
