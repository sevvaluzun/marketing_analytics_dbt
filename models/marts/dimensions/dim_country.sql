select distinct
    md5(country) as country_key,
    country
from {{ ref('int_ad_platforms_unioned') }}