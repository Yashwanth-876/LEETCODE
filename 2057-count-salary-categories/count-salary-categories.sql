# Write your MySQL query statement below
-- SELECT 
-- CASE WHEN INCOME < 20000 THEN "Low Salary"
--      WHEN INCOME >= 20000 AND INCOME <= 50000 THEN "Average Salary"
--      ELSE "High Salary"
-- END AS category , count(*) AS account_count 
-- FROM ACCOUNTS 
-- GROUP BY ACCOUNT_ID ;


SELECT 'High Salary' AS category, COUNT(*) AS accounts_count
FROM Accounts
WHERE income > 50000

UNION ALL

SELECT 'Low Salary', COUNT(*)
FROM Accounts
WHERE income < 20000

UNION ALL

SELECT 'Average Salary', COUNT(*)
FROM Accounts
WHERE income BETWEEN 20000 AND 50000;


-- WITH SalaryCategory AS (
--   SELECT 
--     CASE 
--       WHEN income < 20000 THEN 'Low Salary'
--       WHEN income BETWEEN 20000 AND 50000 THEN 'Average Salary'
--       ELSE 'High Salary'
--     END AS category
--   FROM Accounts
-- ),
-- AllCategories AS (
--   SELECT 'Low Salary' AS category
--   UNION ALL
--   SELECT 'Average Salary'
--   UNION ALL
--   SELECT 'High Salary'
-- )
-- SELECT 
--   a.category,
--   COUNT(s.category) AS accounts_count
-- FROM AllCategories a
-- LEFT JOIN SalaryCategory s
--   ON a.category = s.category
-- GROUP BY a.category;
