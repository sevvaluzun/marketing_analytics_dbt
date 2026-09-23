select
    cast(day as date) as day,
    lower(platform) as platform,
    upper(country) as country,
    campaign,
    cast(cost as double) as cost,
    cast(impressions as bigint) as impressions,
    cast(clicks as bigint) as clicks,
    cast(installs as bigint) as installs
from {{ ref('meta_ads') }}
