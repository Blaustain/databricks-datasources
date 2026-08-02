{{ config(
    materialized='view'
) }}

with source as (

    select *
    from {{ source('adventure_works', 'sales_creditcard') }}

),

renamed as (

    select

        cast(creditcardid as bigint)              as credit_card_id,
        cast(cardtype as string)                  as card_type,
        cast(cardnumber as string)                as card_number,
        cast(expmonth as int)                     as expiration_month,
        cast(expyear as int)                      as expiration_year,
        cast(modifieddate as timestamp)           as modified_date

    from source

)

select *
from renamed