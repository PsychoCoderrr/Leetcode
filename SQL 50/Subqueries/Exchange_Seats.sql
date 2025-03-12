SELECT 
    id,
    CASE 
        WHEN id % 2 = 1 
        THEN COALESCE(LEAD(student) OVER(), student)
        WHEN id % 2 = 0
        THEN LAG(student) OVER()
    END AS student
FROM Seat;
