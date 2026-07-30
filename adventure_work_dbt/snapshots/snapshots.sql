{% snapshot customer_snapshot %}

{{
config(

unique_key='customer_id',

strategy='timestamp',

updated_at='modified_date'

)

}}

select *

from {{ ref('dim_cliente') }}

{% endsnapshot %}