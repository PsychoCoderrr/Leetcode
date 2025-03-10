    -- Write your PostgreSQL query statement below
    SELECT
        activity_date AS day,
        COUNT(DISTINCT user_id) AS active_users
    FROM Activity
    WHERE activity_date + '30 days'::interval > '2019-07-27'::date AND activity_date <= '2019-07-27'::date
    GROUP BY activity_date;
