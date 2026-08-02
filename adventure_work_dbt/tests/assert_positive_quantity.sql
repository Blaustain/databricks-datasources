select *

from {{ ref('fct_vendas') }}

where order_quantity <= 0