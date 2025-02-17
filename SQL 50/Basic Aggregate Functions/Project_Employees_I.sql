SELECT 
    project_id,
    ROUND(AVG(experience_years)::numeric, 2) AS average_years
FROM Project
JOIN Employee USING(employee_id)
GROUP BY project_id;
