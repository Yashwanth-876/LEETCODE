# Write your MySQL query statement below
SELECT ROUND(COUNT(*) / (SELECT COUNT(DISTINCT(PLAYER_ID)) FROM ACTIVITY), 2)AS FRACTION
FROM (
    SELECT PLAYER_ID , MIN(EVENT_DATE) AS FIRST_DATE
    FROM ACTIVITY 
    GROUP BY PLAYER_ID
) A 
JOIN 
ACTIVITY B ON A.PLAYER_ID = B.PLAYER_ID AND DATEDIFF(B.EVENT_DATE , A.FIRST_DATE ) = 1 ;

-- USING CTE
-- WITH FirstLogin AS (
--     SELECT
--         player_id,
--         MIN(event_date) AS first_login
--     FROM Activity
--     GROUP BY player_id
-- ),
-- ConsecutiveLogin AS (
--     SELECT
--         a.player_id
--     FROM Activity a
--     JOIN FirstLogin fl
--     ON a.player_id = fl.player_id
--     AND a.event_date = DATE_ADD(fl.first_login, INTERVAL 1 DAY)
-- )
-- SELECT
--     ROUND(
--         COUNT(DISTINCT cl.player_id) * 1.0 / COUNT(DISTINCT fl.player_id),
--         2
--     ) AS fraction
-- FROM FirstLogin fl
-- LEFT JOIN ConsecutiveLogin cl
-- ON fl.player_id = cl.player_id;

