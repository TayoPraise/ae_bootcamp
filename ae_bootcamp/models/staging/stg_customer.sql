WITH source as (

        SELECT * FROM {{ source('northwind', 'customers') }}

)
SELECT * FROM source