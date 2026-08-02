select

    year(order_date) as ano,

    sum(total_due) as total_vendas

from {{ ref('fct_vendas') }}

group by 1

order by 1