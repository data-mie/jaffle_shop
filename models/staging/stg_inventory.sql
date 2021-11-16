with source as (
  {#-
  Normally we would select from the table here, but we are using seeds to load
  our data in this project
  #}
  select
    *
  from {{ ref('raw_inventory') }}
),

renamed as (
  select
    id as inventory_id,
    sku,
    inventory_on_hand,
    date(updated_at) as updated_at
  from source
)

select
  *
from renamed