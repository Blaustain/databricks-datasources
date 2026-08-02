select *

from {{ ref('fct_vendas') }}

where total_due < 0