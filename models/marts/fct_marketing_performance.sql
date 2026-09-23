{{ config(
    materialized='incremental',
    unique_key=['day', 'platform', 'country', 'source']
) }}

select
    day,
    platform,
    country,
    source,

    sum(cost) as cost,
    sum(impressions) as impressions,
    sum(clicks) as clicks,
    sum(installs) as installs,

    {{ calculate_ratio('sum(clicks)', 'sum(impressions)', 4) }} as ctr,

{{ calculate_ratio('sum(cost)', 'sum(clicks)', 2) }} as cpc,

{{ calculate_ratio('sum(cost)', 'sum(installs)', 2) }} as cpi

from {{ ref('int_ad_platforms_unioned') }}

{% if is_incremental() %}

where day >= (
    select coalesce(max(day), date '1900-01-01')
    from {{ this }}
)

{% endif %}

group by
    day,
    platform,
    country,
    source