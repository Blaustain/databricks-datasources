with address as (

    select *
    from {{ ref('stg_address.sql') }}

),

state_province as (

    select *
    from {{ ref('stg_stateprovince.sql') }}

),

country_region as (

    select *
    from {{ ref('stg_countryregion.sql') }}

),

final as (

    select

        {{ dbt_utils.generate_surrogate_key([
            'address.address_id'
        ]) }} as location_sk,

        address.address_id,

        address.address_line_1,

        address.address_line_2,

        address.city,

        address.postal_code,

        state_province.state_province_id,

        state_province.state_name,

        state_province.state_province_code,

        country_region.country_region_code,

        country_region.country_name

    from address

    left join state_province

        on address.state_province_id = state_province.state_province_id

    left join country_region

        on state_province.country_region_code = country_region.country_region_code

)

select *
from final