-- Write your PostgreSQL query statement below
WITH help_table_1 AS
(
    SELECT 
        user_id,
        COUNT(*) AS count1
    FROM Signups s
    FULL JOIN Confirmations USING(user_id)
    GROUP BY user_id
),
help_table_2 AS 
(
    SELECT
        user_id,
        COUNT(*) AS count2
    FROM Signups s
    FULL JOIN Confirmations USING(user_id)
    WHERE action = 'confirmed'
    GROUP BY user_id
),
help_table_3 AS
(
SELECT *
FROM help_table_2
FULL JOIN help_table_1 USING(user_id)
)
SELECT
    user_id,
    CASE
    WHEN count2 IS NULL
    THEN 0.00
    ELSE ROUND((count2::numeric/count1), 2) END  AS confirmation_rate
FROM help_table_3;
