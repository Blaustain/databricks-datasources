with source as (

    select *
    from {{ source('adventure_works', 'production_productcategory') }}

),
renamed as (

    select

        productsubcategoryid    as product_subcategory_id,
        productcategoryid       as product_category_id,
        name                    as product_subcategory_name,
        rowguid,
        modifieddate            as modified_date

    from source

)

select *
from renamed