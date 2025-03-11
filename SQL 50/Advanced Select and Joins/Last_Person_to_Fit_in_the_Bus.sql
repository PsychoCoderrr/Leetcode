WITH sorted_table AS 
(
    SELECT 
        person_name,
        turn,
        SUM(weight) OVER (ORDER BY turn)
    FROM Queue
)
SELECT 
    person_name
FROM sorted_table
WHERE sum <= 1000
ORDER BY turn DESC
LIMIT 1;
