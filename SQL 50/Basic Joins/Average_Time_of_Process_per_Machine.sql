SELECT 
    act1.machine_id,
    ROUND(AVG(act1.timestamp - act2.timestamp)::NUMERIC, 3) AS processing_time
FROM Activity act1
JOIN Activity act2 ON act1.machine_id = act2.machine_id AND
                      act1.process_id = act2.process_id AND
                      act1.activity_type = 'end' AND
                      act2.activity_type = 'start'
GROUP BY act1.machine_id; 
