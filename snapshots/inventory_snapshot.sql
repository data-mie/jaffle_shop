{% snapshot inventory_snapshot %}

{{
    config(
        unique_key='id',
        strategy='timestamp',
        updated_at='updated_at',
        target_schema='snapshots'
    )
}}

select * from {{ ref('raw_inventory') }}

{% endsnapshot %}
