WITH help_table1 AS 
(SELECT 
    requester_id,
    COALESCE(COUNT (*), 0) AS c1
FROM RequestAccepted
GROUP BY requester_id
),
help_table2 AS
(
    SELECT 
        accepter_id,
        COALESCE(COUNT(*), 0) AS c2
    FROM RequestAccepted
    GROUP BY accepter_id
)
SELECT 
    id,
    COALESCE(c1, 0) + COALESCE(c2, 0) AS num
FROM ((
    SELECT 
        DISTINCT requester_id AS id
    FROM RequestAccepted
)
UNION
(SELECT 
    DISTINCT accepter_id AS id
    FROM RequestAccepted)) ht
LEFT JOIN help_table2 ht2 ON ht.id = ht2.accepter_id
LEFT JOIN help_table1 ht1 ON ht.id = ht1.requester_id
ORDER BY num DESC
LIMIT 1;
