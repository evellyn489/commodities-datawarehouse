-- Active: 1779136923954@@localhost@5435
--import
with source as (
    select 
        "Date",
        "Close",
        "simbolo"
    from {{source ('databasesales_8qy0', 'commodities')}}
),
-- renamed
renamed as (
    select
        cast("Date" as date) as data,
        "Close" as valor_fechamento,
        simbolo
    from source
)
-- select from

select * from renamed