-- Active: 1779136923954@@localhost@5435
--import
with source as (
    select 
        "date",
        "symbol",
        "action",
        "quantity"
    from {{source ('databasesales_8qy0', 'movimentacao_commodities')}}
),
-- renamed
renamed as (
    select
        cast(date as date) as data,
        symbol as simbolo,
        action as acao,
        quantity as quantidade
    from source
)
-- select from

select * from renamed