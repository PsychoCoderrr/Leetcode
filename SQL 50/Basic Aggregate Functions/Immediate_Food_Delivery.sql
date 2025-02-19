-- Write your PostgreSQL query statement below
WITH help_table AS
(SELECT
    customer_id,
    MIN(order_date)
FROM Delivery
GROUP BY customer_id
)
SELECT
    ROUND(COUNT(d.customer_id) / (SELECT COUNT(DISTINCT customer_id) FROM Delivery)::NUMERIC * 100, 2) AS immediate_percentage
FROM Delivery d
JOIN help_table ht ON d.customer_id = ht.customer_id AND d.order_date = ht.min
WHERE d.order_date = d. customer_pref_delivery_date
