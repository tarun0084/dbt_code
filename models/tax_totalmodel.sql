{{ config( materialized='table') }}


with
emp_data as (
    select id,
           name, 
           sal,
           tax,
           ({{tax_macro('sal','tax')}}) as total_amount
     from 
    {{source('datafeed_shared_schema','emp')}}
    )
select * from emp_data
