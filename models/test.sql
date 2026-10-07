select 
* 
from {{ source('Demo', 'WEATHER') }}

limit 10