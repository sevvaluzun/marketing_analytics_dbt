select distinct
    md5(platform) as platform_key,
    platform
from {{ ref('int_ad_platforms_unioned') }}