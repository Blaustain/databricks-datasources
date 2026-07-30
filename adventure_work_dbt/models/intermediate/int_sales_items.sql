with items as (

    select *
    from {{ ref('stg_salesorderdetail') }}

)

select

    sales_order_detail_id,

    sales_order_id,

    product_id,

    special_offer_id,

    order_quantity,

    unit_price,

    unit_price_discount,

    line_total

from items