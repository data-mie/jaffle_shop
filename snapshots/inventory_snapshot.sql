{% snapshot inventory_snapshot %}

{{
    config(
        unique_key='id',
        strategy='timestamp',
        updated_at='updated_at',
        target_schema='snapshots',
        invalidate_hard_deletes=True
    )
}}

select *, cast(date as timestamp) as updated_at from {{ ref('raw_inventory') }}

{% endsnapshot %}
