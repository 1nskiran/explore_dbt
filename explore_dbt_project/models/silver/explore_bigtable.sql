with sales as 
(
    select sales_id,product_sk,customer_sk,
            {{ multiply('unit_price','quantity') }} as derived_amount,
            gross_amount,payment_method
    from {{ref('bronze_sales')}}
),
products as
(
    select product_sk,category
    from {{ref('bronze_product')}}
),
customer as 
(
    select customer_sk,gender
    from {{ref('bronze_customer')}}
),
derived_sales_data as (
select
    s.sales_id,
    s.product_sk,
    s.customer_sk,
    s.gross_amount,
    s.payment_method,
    p.category,
    c.gender
    from sales s
    join products p
    on s.product_sk = p.product_sk  
    join customer c
    on s.customer_sk = c.customer_sk
)
select category,gender,sum(gross_amount) as gender_total_sales_amount
    from derived_sales_data
    group by category,gender
order by 3 desc