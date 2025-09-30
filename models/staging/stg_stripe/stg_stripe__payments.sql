select 
    id as customer_id,
    orderid as order_id,
    paymentmethod as payment_method,
    status as payment_status,
    amount as payment_amount,
    created as payment_created_at,
    _batched_at as payment_batched_at

from {{ source('stripe', 'payment') }}

order by 1,2