with product as (

    select *
    from {{ ref('int_product') }}

),

final as (

    select

        {{ dbt_utils.generate_surrogate_key([
            'product_id'
        ]) }} as product_sk,

        product_id,

        product_name,

        product_number,

        product_category_name,

        product_subcategory_name,

        color,

        product_line,

        product_class,

        style,

        standard_cost,

        list_price

    from product

)

select *
from final