with cte1 as(
    select 
    date(Time) as date,
    weather,
    temp,
    pressure,
    humidity,
    clouds
from 
{{ source('Demo', 'WEATHER') }}
),
daily_wth_agg as(
    select 
    date,
    weather,
    round(avg(temp),2),
    round(avg(pressure),2),
    round(avg(humidity),2),
    round(avg(clouds),2)
    from cte1
    group by date, weather
    qualify row_number() over(partition by date order by count(weather) desc) =1 
 
)
select * from daily_wth_agg