with deduped_items as (
select *,
    row_number() over(partition by id order by update_date desc) dedup_id
 from {{source('explore_dbt_schema','items')}}
 )
 select id,name,category,update_date
 from deduped_items
 where dedup_id=1