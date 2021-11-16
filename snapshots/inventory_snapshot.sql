{% snapshot inventory_snapshot %}

{{
    config(
	unique_key='id',
	strategy='timestamp',
	updated_at='updated_at',
    )
}}

select * from {{ ref('raw_inventory') }}

{% endsnapshot %}
