select query_name, round(avg(rating * 1 /position),2) as quality ,
  ROUND(SUM(CASE WHEN rating < 3 THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) as poor_query_percentage
from queries
group by query_name;