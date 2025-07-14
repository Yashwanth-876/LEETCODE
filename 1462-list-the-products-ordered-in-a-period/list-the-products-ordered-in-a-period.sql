# Write your MySQL query statement below

-- WITH NAME AS(
--     SELECT PRODUCT_NAME , PRODUCT_ID 
--     FROM PRODUCTS 
-- ),
-- CATEGORY AS (
--     SELECT PRODUCT_ID ,ORDER_DATE, SUM(UNIT) AS UNIT
--     FROM ORDERS 
--     WHERE ORDER_DATE BETWEEN '2020-02-01' AND '2020-02-27' 
--     GROUP BY PRODUCT_ID
--     HAVING SUM(UNIT) >= 100
-- )
-- SELECT N.PRODUCT_NAME  , C.UNIT 
-- FROM NAME N JOIN CATEGORY C ON N.PRODUCT_ID = C.PRODUCT_ID 


-- WITHOUT CTE 
SELECT p.product_name, SUM(o.unit) AS unit
FROM Products p
JOIN Orders o ON p.product_id = o.product_id
WHERE o.order_date BETWEEN '2020-02-01' AND '2020-02-29'
GROUP BY p.product_id, p.product_name
HAVING SUM(o.unit) >= 100;
