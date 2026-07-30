with customer as (

    select *
    from {{ ref('int_customer') }}

),

final as (

    select

        {{ dbt_utils.generate_surrogate_key([
            'customer_id'
        ]) }} as customer_sk,

        customer_id,

        business_entity_id,

        customer_name,

        first_name,

        middle_name,

        last_name,

        person_type,

        territory_id,

        store_id,

        case
            when store_id is null then 'Pessoa Física'
            else 'Loja'
        end as customer_type

    from customer

)

select *
from final