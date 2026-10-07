with cte1 as(
select 
to_timestamp(TIME) as Started_at,
date(to_timestamp(TIME)) as Date_STarted_at,
hour(to_timestamp(TIME)) as Hour_strated_at,
{{day_type('TIME')}} as Day_type,
{{get_season('TIME')}} as Station_of_year
from 
{{ source('Demo', 'WEATHER') }}
)
select * from cte1