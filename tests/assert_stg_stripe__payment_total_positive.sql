select 
    order_id
from {{ ref('stg_stripe__payment') }}
group by 1
having sum(payment_amount) < 0