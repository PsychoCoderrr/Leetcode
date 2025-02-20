-- Write your PostgreSQL query statement below
WITH help_table AS 
(
    SELECT
        product_id,
        MIN(year)
    FROM Sales 
    GROUP BY product_id
)
SELECT
    s.product_id,
    s.year AS first_year,
    quantity,
    price
FROM Sales s
JOIN help_table ht ON s.product_id = ht.product_id AND s.year = ht.min;
