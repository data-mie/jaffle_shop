with source as (
  {#-
  Normally we would select from the table here, but we are using seeds to load
  our data in this project
  #}
  select
    *
  from {{ ref('inventory_snapshot') }}
),

renamed as (
  select
    id as inventory_id,
    *
  from source
)

select
  *
from renamed