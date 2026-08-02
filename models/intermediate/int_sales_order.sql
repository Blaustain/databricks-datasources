with order as (

    select *
    from {{ ref('stg_salesorderheader') }}

    

),
with order as (

    select *
    from {{ ref('stg_sales_order') }} 
    

),


customers as (

    select *
    from {{ ref('stg_customer') }}

),

credit_cards as (

    select *
    from {{ ref('stg_creditcard') }}

)

select

    orders.sales_order_id,

    orders.sales_order_number,

    orders.order_date,

    orders.due_date,

    orders.ship_date,

    orders.customer_id,

    customers.person_id,

    customers.store_id,

    orders.salesperson_id,

    orders.territory_id,

    orders.bill_to_address_id,

    orders.ship_to_address_id,

    orders.credit_card_id,

    credit_cards.card_type,

    orders.subtotal,

    orders.tax_amount,

    orders.freight,

    orders.total_due,

    orders.status,

    orders.is_online_order

from orders

left join customers

    on orders.customer_id = customers.customer_id

left join credit_cards

    on orders.credit_card_id = credit_cards.credit_card_id