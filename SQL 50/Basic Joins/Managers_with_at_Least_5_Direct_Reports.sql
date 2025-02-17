WITH help_table AS
(
    SELECT 
        managerId
    FROM Employee
    WHERE managerId IS NOT NULL
    GROUP BY managerId
    HAVING COUNT(*) >= 5
)
SELECT 
    name
FROM Employee
WHERE id IN (SELECT * FROM help_table);
