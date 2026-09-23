with meta as (

    select
        day,
        platform,
        country,
        campaign,
        cost,
        impressions,
        clicks,
        installs,
        'meta' as source
    from {{ ref('stg_meta_ads') }}

),

applovin as (

    select
        day,
        platform,
        country,
        campaign,
        cost,
        impressions,
        clicks,
        installs,
        'applovin' as source
    from {{ ref('stg_applovin_ads') }}

)

select * from meta

union all

select * from applovin