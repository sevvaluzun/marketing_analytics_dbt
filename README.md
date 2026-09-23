
# Marketing Analytics dbt Project

A dbt analytics engineering project that transforms multi-source advertising data into a clean and tested marketing performance mart.

The project uses DuckDB as the local analytical database and demonstrates core dbt concepts including staging models, intermediate models, marts, incremental models, macros, data tests, documentation, and lineage.

## Architecture

```mermaid
flowchart LR
    A[Meta Ads Seed] --> B[stg_meta_ads]
    C[AppLovin Ads Seed] --> D[stg_applovin_ads]

    B --> E[int_ad_platforms_unioned]
    D --> E

    E --> F[fct_marketing_performance]

