select 
    id as supply_id,
    name as supply_name,
    cost as supply_cost,
    perishable,
    sku

from {{ source('mesh_shop', 'supplies') }}