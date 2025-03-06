WITH help_table AS 
(
    SELECT
        reports_to, 
        COUNT (reports_to),
        AVG(age)
    FROM Employees
    GROUP BY reports_to
    HAVING COUNT (reports_to) <> 0
)
SELECT 
    employee_id,
    name, 
    count AS reports_count,
    ROUND(avg) AS average_age
FROM (SELECT DISTINCT employee_id, name FROM Employees) AS ps
JOIN help_table AS ht ON ps.employee_id = ht.reports_to
ORDER BY employee_id;
