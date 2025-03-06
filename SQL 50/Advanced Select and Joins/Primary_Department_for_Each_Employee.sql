WITH help_table AS 
(SELECT 
    employee_id,
    department_id,
    primary_flag,
    COUNT(*) OVER (PARTITION BY employee_id)
FROM Employee
)
SELECT 
    employee_id,
    department_id
FROM help_table
WHERE count = 1 OR (count > 1 AND primary_flag = 'Y');
