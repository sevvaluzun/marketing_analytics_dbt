
# Marketing Analytics dbt Project

A dbt analytics engineering project that transforms multi-source advertising data into a clean and tested marketing performance mart.

The project uses DuckDB as the local analytical database and demonstrates core dbt concepts including staging models, intermediate models, marts, incremental models, macros, data tests, documentation, and lineage.

## Architecture

```text
Meta Ads Seed
      |
      v
stg_meta_ads
      \
       \
        ---> int_ad_platforms_unioned
       /                |
      /                 v
stg_applovin_ads   fct_marketing_performance
      ^
      |
AppLovin Ads Seed
