with customer as (

    select *
    from {{ ref('stg_customer') }}

),

person as (

    select *
    from {{ ref('stg_person') }}

)

select

    customer.customer_id,

    person.business_entity_id,

    person.first_name,

    person.middle_name,

    person.last_name,

    concat_ws(
        ' ',
        person.first_name,
        person.middle_name,
        person.last_name
    ) as customer_name,

    person.person_type,

    customer.store_id,

    customer.territory_id

from customer

left join person

on customer.person_id = person.business_entity_id