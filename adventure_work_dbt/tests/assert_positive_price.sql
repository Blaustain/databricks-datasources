select *

from {{ ref('fct_vendas') }}

where unit_price < 0