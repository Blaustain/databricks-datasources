select

    sales_order_detail_id

from {{ ref('fct_vendas') }}

where sales_order_id is null