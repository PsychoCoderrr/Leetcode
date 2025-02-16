WITH help_table AS 
(
    SELECT 
        id,
        recordDate,
        temperature,
        LAG(temperature) OVER (ORDER BY recordDate) AS lag_temperature,
        LAG(recordDate) OVER (ORDER BY recordDate) AS lag_date
    FROM Weather
)
SELECT 
    id
FROM help_table
WHERE help_table.lag_temperature < help_table.temperature AND help_table.lag_temperature IS NOT NULL AND recordDate - lag_date = 1;
