with sales_reason as (

    select *
    from {{ ref('stg_salesreason') }}

),

final as (

    select

        {{ dbt_utils.generate_surrogate_key([
            'sales_reason_id'
        ]) }} as sales_reason_sk,

        sales_reason_id,

        sales_reason,

        reason_type

    from sales_reason

)

select *
from final