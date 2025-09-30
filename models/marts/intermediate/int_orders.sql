with 

orders as (

    select * from {{ ref('stg_jaffle_shop__orders_refactor') }}

),

payments as (

     select * from {{ ref('stg_stripe__payments_refactor') }}
     where payment_status != 'fail'

),

order_totals as (

    select
        order_id,
        payment_status,
        sum(payment_amount) as order_value_dollars
    from payments
    group by 1,2

),

order_values_joined as (

    select
        orders.order_id,
        orders.order_date,
        orders.customer_id,
        orders.order_status,
        orders.valid_order_date,  
        orders.user_order_seq,
        order_totals.payment_status,
        order_totals.order_value_dollars

    from orders
    left join order_totals
        on orders.order_id = order_totals.order_id

)

select * from order_values_joined