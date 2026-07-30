with gross_sales as (

    select

        round(sum(line_total), 2) as gross_sales

    from {{ ref('fct_vendas') }}

    where year(order_date) = 2011

)

select *

from gross_sales

where gross_sales <> {{ var('gross_sales_2011_expected') }}