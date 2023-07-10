-- QUESTION: Find the number of employees inside the hospital

-- Table creation:

create table hospital ( emp_id int
, action varchar(10)
, time datetime);

-- Data insertion:

insert into hospital values ('1', 'in', '2019-12-22 09:00:00');
insert into hospital values ('1', 'out', '2019-12-22 09:15:00');
insert into hospital values ('2', 'in', '2019-12-22 09:00:00');
insert into hospital values ('2', 'out', '2019-12-22 09:15:00');
insert into hospital values ('2', 'in', '2019-12-22 09:30:00');
insert into hospital values ('3', 'out', '2019-12-22 09:00:00');
insert into hospital values ('3', 'in', '2019-12-22 09:15:00');
insert into hospital values ('3', 'out', '2019-12-22 09:30:00');
insert into hospital values ('3', 'in', '2019-12-22 09:45:00');
insert into hospital values ('4', 'in', '2019-12-22 09:45:00');
insert into hospital values ('5', 'out', '2019-12-22 09:40:00');

-- SOLUTION-1:

WITH CTE AS 
(
  select emp_id, 
  max(case when action='in' then time end) as intime,
  max(case when action='out' then time end) as outtime
  from hospital
  group by emp_id
)
SELECT emp_id
FROM CTE
WHERE intime > outtime OR outtime IS NULL

-- SOLUTION-2:

with latest_time as 
(
  select emp_id, max (time) as max_latest_time from hospital group by emp_id)
  ,latest_in_time as (select emp_id, max(time) as max_in_time from hospital
  WHERE action='in'
  group by emp_id
)
select lt.emp_id
from latest_time lt
Inner join latest_in_time lit 
on lt.emp_id = lit.emp_id 
AND max_latest_time=max_in_time
