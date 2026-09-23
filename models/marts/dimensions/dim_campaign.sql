select distinct
    md5(source || '|' || campaign) as campaign_key,
    source,
    campaign
from {{ ref('int_ad_platforms_unioned') }}