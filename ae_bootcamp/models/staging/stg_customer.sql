WITH source as (

        SELECT * FROM {{ source('northwind', 'customers') }}

)
SELECT 
    *,
    current_timestamp() as ingestion_timestamp
FROM source