{% set start_date = "cast('2010-01-01' as date)" %}
{% set end_date = "cast('2015-12-31' as date)" %}

with date_spine as (

    {{
        dbt_utils.date_spine(
            datepart="day",
            start_date=start_date,
            end_date=end_date
        )
    }}

),

final as (

    select

        cast(date_day as date) as full_date,

        cast(date_format(date_day, 'yyyyMMdd') as bigint) as date_sk,

        year(date_day) as year,

        quarter(date_day) as quarter,

        case
            when quarter(date_day) in (1,2) then 1
            else 2
        end as semester,

        month(date_day) as month,

        date_format(date_day, 'MMMM') as month_name,

        weekofyear(date_day) as week_of_year,

        day(date_day) as day_of_month,

        dayofweek(date_day) as day_of_week,

        date_format(date_day, 'EEEE') as day_name,

        case
            when dayofweek(date_day) in (1,7)
            then true
            else false
        end as is_weekend

    from date_spine

)

select *
from final