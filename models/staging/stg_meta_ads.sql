select
    cast(day as date) as day,
    lower(platform) as platform,
    upper(country) as country,
    campaign,
    cast(cost as double) as cost,
    cast(impressions as bigint) as impressions,
    cast(clicks as bigint) as clicks,
    cast(installs as bigint) as installs

from {{ source('raw_marketing', 'meta_ads') }}