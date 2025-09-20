select 
    id as order_id,
    customer as customer_id,
    ordered_at,
    store_id,
    subtotal as order_subtotal,
    tax_paid as order_tax_paid,
    order_total

from {{ source('mesh_shop', 'orders') }}