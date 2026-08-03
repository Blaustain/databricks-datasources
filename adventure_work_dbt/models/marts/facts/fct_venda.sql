


with  int_sales_orders as (

    select *
    from {{ ref('int_sales_orders') }}

),

sales_items as (

    select *
    from {{ ref('int_sales_items') }}

),

customers as (

    select *
    from {{ ref('dim_cliente') }}

),

products as (

    select *
    from {{ ref('dim_produto') }}

),

dates as (

    select *
    from {{ ref('dim_data') }}

),

cards as (

    select *
    from {{ ref('dim_cartao') }}

),

locations as (

    select *
    from {{ ref('dim_localizacao') }}

),

sales_reasons as (

    select

        sr.sales_order_id,

        concat_ws(
            ', ',
            collect_set(r.sales_reason)
        ) as sales_reason

    from {{ ref('stg_salesorderheadersalesreason') }} sr

    inner join {{ ref('dim_motivo_venda') }} r

        on sr.sales_reason_id = r.sales_reason_id

    group by sr.sales_order_id

),

final as (
    {{ dbt_utils.generate_surrogate_key([
    'so.sales_order_id',
    'si.sales_order_detail_id'
]) }} as sales_sk

    select

        ----------------------------------------------------
        -- Chaves da Fato
        ----------------------------------------------------

        so.sales_order_id,

        si.sales_order_detail_id,

        c.customer_sk,

        p.product_sk,

        d.date_sk,

        ca.credit_card_sk,

        l.location_sk,

        ----------------------------------------------------
        -- Datas
        ----------------------------------------------------

        so.order_date,

        so.ship_date,

        so.due_date,

        ----------------------------------------------------
        -- Métricas
        ----------------------------------------------------

        si.order_quantity,

        si.unit_price,

        si.unit_price_discount,

        si.line_total,

        so.subtotal,

        so.tax_amount,

        so.freight,

        so.total_due,

        ----------------------------------------------------
        -- Dimensões Degeneradas
        ----------------------------------------------------

        so.sales_order_number,

        so.status,

        so.is_online_order,

        ----------------------------------------------------
        -- Motivos
        ----------------------------------------------------

        coalesce(sr.sales_reason, 'Not informed') as sales_reason

    from sales_orders so

    inner join sales_items si

        on so.sales_order_id = si.sales_order_id

    left join customers c

        on so.customer_id = c.customer_id

    left join products p

        on si.product_id = p.product_id

    left join dates d

        on cast(date_format(so.order_date,'yyyyMMdd') as bigint)=d.date_sk

    left join cards ca

        on so.credit_card_id = ca.credit_card_id

    left join locations l

        on so.bill_to_address_id = l.address_id

    left join sales_reasons sr

        on so.sales_order_id = sr.sales_order_id

)

select *
from final