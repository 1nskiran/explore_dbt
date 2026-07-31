{{config(materialized='view')}}
select * from {{source('explore_dbt_schema','fact_sales')}}