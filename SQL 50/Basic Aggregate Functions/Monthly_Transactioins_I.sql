SELECT 
    p.product_id,
    CASE 
    WHEN COUNT(units) <> 0 
    THEN ROUND(SUM(price * units)::numeric / SUM(units), 2) 
    ELSE 0 END AS average_price
FROM Prices p
LEFT JOIN UnitsSold us ON p.product_id = us.product_id AND purchase_date BETWEEN start_date AND end_date
GROUP BY p.product_id;
