# Write your MySQL query statement below
-- SELECT PRODUCT_ID , NEW_PRICE AS PRICE 
-- FROM PRODUCTS 
-- WHERE ( PRODUCT_ID, change_date )IN (
--     SELECT PRODUCT_ID , MAX(CHANGE_DATE)
--     FROM PRODUCTS 
--     WHERE CHANGE_DATE <= '2019-08-16'
--     GROUP BY PRODUCT_ID
-- ) ;

Select product_id ,new_price as price
FROM Products
Where (product_id,change_date) IN
(
    SELECT product_id,max(change_date)
    From Products
    Where change_date <='2019-08-16'
    group by product_id
)
UNION
Select product_id ,10 as price
FROM Products
Where (product_id)  not IN
(
    SELECT product_id
    From Products
    Where change_date <='2019-08-16'
    group by product_id
)