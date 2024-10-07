with orders as (
    select * from {{ ref('int_orders') }}
),

final as (
    select 
        order_id,
        location_id,
        customer_id,
        order_total,
        tax_paid,
        ordered_at,
        case when order_total > 100 then true else false end as high_order_value,
        customer_name,
        location_name,
        tax_rate,
        location_opened_at,
        date_part(month, ordered_at) as ordered_month,
        date_part(day, ordered_at) as ordered_day, 
        date_part(year, ordered_at) as ordered_year
    from orders
)

select * 
from final