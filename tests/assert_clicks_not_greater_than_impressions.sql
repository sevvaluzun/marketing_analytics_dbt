select *
from {{ ref('fct_marketing_performance') }}
where clicks > impressions