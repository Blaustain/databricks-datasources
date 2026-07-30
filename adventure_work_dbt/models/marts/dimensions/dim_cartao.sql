with credit_card as (

    select *
    from {{ ref('stg_creditcard') }}

),

final as (

    select

        {{ dbt_utils.generate_surrogate_key([
            'credit_card_id'
        ]) }} as credit_card_sk,

        credit_card_id,

        card_type,

        expiration_month,

        expiration_year,

        case
            when expiration_year < year(current_date()) then 'Expired'
            when expiration_year = year(current_date())
                 and expiration_month < month(current_date()) then 'Expired'
            else 'Active'
        end as card_status

    from credit_card

)

select *
from final