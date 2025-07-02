SELECT v.customer_id , count(*) as count_no_trans
FROM visits v left join transactions t on v.visit_id = t.visit_id
where t.transaction_id is null
group by v.customer_id;