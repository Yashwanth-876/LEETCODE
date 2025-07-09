# Write your MySQL query statement below
with totalweight as (
    select person_name , turn ,
    sum(weight) over (order by turn) as total
    from queue 
)
select person_name
from totalweight
where total <= 1000
order by turn desc
limit 1