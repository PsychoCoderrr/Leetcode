-- Write your PostgreSQL query statement below
WITH help_table AS 
(
    SELECT 
        player_id,
        MIN(event_date)
    FROM Activity
    GROUP BY player_id
),
help_table_2 AS
(
    SELECT *
    FROM Activity a
    JOIN help_table ht ON a.player_id = ht.player_id AND a.event_date = ht.min + '1 day'::interval
)
SELECT 
    ROUND(COUNT(*)::numeric / (SELECT COUNT(DISTINCT player_id) FROM Activity), 2) AS fraction
FROM help_table_2;
