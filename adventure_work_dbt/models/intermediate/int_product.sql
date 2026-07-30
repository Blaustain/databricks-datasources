with product as (

    select *
    from {{ ref('stg_product') }}

),

subcategory as (

    select *
    from {{ ref('stg_productsubcategory') }}

),

category as (

    select *
    from {{ ref('stg_productcategory') }}

)

select

    product.product_id,

    product.product_name,

    product.product_number,

    product.color,

    product.standard_cost,

    product.list_price,

    product.product_line,

    product.product_class,

    product.style,

    subcategory.product_subcategory_name,

    category.product_category_name

from product

left join subcategory

on product.product_subcategory_id =
subcategory.product_subcategory_id

left join category

on subcategory.product_category_id =
category.product_category_id