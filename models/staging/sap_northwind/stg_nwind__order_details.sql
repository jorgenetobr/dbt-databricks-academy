with
    source_orders as (
        select *
        from {{ source('nwind', 'order_details') }}
    )

    , renamed as (
        select
            cast(order_id as int) as order_detail_pk
            , cast(product_id as int) as product_fk
            , cast(discount as float) as discount_pct
            , cast(unit_price as float) as unit_price
            , cast(quantity as int) as quantity
        from source_orders
    )

select * from renamed