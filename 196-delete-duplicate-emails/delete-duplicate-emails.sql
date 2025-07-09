# Write your MySQL query statement below
Delete P from PERSON P
join PERSON P2
on p.email = p2.email
where p.id>p2.id