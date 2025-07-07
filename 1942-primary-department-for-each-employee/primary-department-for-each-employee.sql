# Write your MySQL query statement below
WITH PRIMARYDEPT AS (
    SELECT EMPLOYEE_ID , DEPARTMENT_ID 
    FROM EMPLOYEE 
    GROUP BY EMPLOYEE_ID 
    HAVING COUNT(*) = 1
),
MULTIDEPT AS (
    SELECT EMPLOYEE_ID , DEPARTMENT_ID 
    FROM EMPLOYEE 
    WHERE PRIMARY_FLAG = 'Y'
)
SELECT * FROM PRIMARYDEPT 
UNION
SELECT * FROM MULTIDEPT ;

-- WITHOUT CTE 
-- SELECT employee_id, department_id
-- FROM Employee
-- WHERE primary_flag = 'Y'
-- OR (primary_flag = 'N' 
-- AND employee_id NOT IN
-- (SELECT employee_id FROM Employee WHERE primary_flag = 'Y'));