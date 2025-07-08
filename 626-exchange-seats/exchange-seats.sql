# Write your MySQL query statement below
WITH Table1 AS
    (SELECT *,
    CASE
        WHEN id%2 !=0 THEN COALESCE(lead(id) over(),(SELECT COUNT(id) FROM Seat))
        ELSE lag(id) over()
        END AS fliping
    FROM Seat
    ORDER BY fliping)
SELECT row_number() over() AS id,student FROM Table1