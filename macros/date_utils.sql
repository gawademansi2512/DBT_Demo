{% macro day_type(x) %}
case 
    when Dayname(to_timestamp({{x}})) in ('Sat','Sun') 
    then 'weekend' 
    else 'Busyday' 
    end
{% endmacro %}

{% macro get_season(x) %}
case 
    when month(to_timestamp({{x}})) in (12,1,2) then 'Winter'
    when month(to_timestamp({{x}})) in (3,4,5) then 'Spring'
    when month(to_timestamp({{x}})) in (6,7,8) then 'Summer'
    else 'Autumn' end
{% endmacro %}