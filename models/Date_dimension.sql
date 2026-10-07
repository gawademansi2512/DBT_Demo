with cte1 as(
select 
to_timestamp(TIME) as Started_at,
date(to_timestamp(TIME)) as Date_STarted_at,
hour(to_timestamp(TIME)) as Hour_strated_at,
dayname(to_timestamp(TIME)) as Day_Name_started_at,
case when Day_Name_started_at in ('Sat','Sun') then 'weekend' else 'Busyday' end as Day_type,
case when month(to_timestamp(TIME)) in (12,1,2) then 'Winter'
    when month(to_timestamp(TIME)) in (3,4,5) then 'Spring'
    when month(to_timestamp(TIME)) in (6,7,8) then 'Summer'
    else 'Autumn' end as Station_of_year
from 
{{ source('Demo', 'WEATHER') }}
)
select * from cte1