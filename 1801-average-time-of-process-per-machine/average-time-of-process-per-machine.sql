select 
    m.machine_id,
    round(avg(p.timestamp - m.timestamp)
    ,3) as processing_time
from activity m join activity p on 
m.machine_id = p.machine_id
and 
m.activity_type = 'start'
and 
p.activity_type = 'end'
and 
m.process_id = p.process_id 
group by m.machine_id
