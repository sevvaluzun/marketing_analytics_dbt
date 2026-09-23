{{ config(
    materialized='incremental',
    unique_key=['day', 'platform_key', 'country_key', 'campaign_key']
) }}

with base as (

    select
        ads.day,

        platform.platform_key,
        country.country_key,
        campaign.campaign_key,

        ads.cost,
        ads.impressions,
        ads.clicks,
        ads.installs

    from {{ ref('int_ad_platforms_unioned') }} as ads

    left join {{ ref('dim_platform') }} as platform
        on ads.platform = platform.platform

    left join {{ ref('dim_country') }} as country
        on ads.country = country.country

    left join {{ ref('dim_campaign') }} as campaign
        on ads.source = campaign.source
        and ads.campaign = campaign.campaign

    {% if is_incremental() %}

    where ads.day >= (
        select coalesce(max(day), date '1900-01-01')
        from {{ this }}
    )

    {% endif %}

)

select
    day,
    platform_key,
    country_key,
    campaign_key,

    sum(cost) as cost,
    sum(impressions) as impressions,
    sum(clicks) as clicks,
    sum(installs) as installs,

    {{ calculate_ratio('sum(clicks)', 'sum(impressions)', 4) }} as ctr,
    {{ calculate_ratio('sum(cost)', 'sum(clicks)', 2) }} as cpc,
    {{ calculate_ratio('sum(cost)', 'sum(installs)', 2) }} as cpi

from base

group by
    day,
    platform_key,
    country_key,
    campaign_key