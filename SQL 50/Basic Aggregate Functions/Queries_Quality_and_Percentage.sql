SELECT
    query_name,
    ROUND(SUM(rating::numeric / position) / COUNT(*), 2) AS quality,
    ROUND(SUM(CASE WHEN rating < 3 THEN 1 ELSE 0 END) / COUNT(*)::numeric * 100, 2) AS poor_query_percentage
FROM Queries
GROUP BY query_name;
