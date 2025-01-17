WITH source as (
    SELECT
        p.id as product_id,
        p.product_code,
        p.product_name,
        p.description,
        s.company as supplier_company,
        p.standard_cost,
        p.list_price,
        p.reorder_level,
        p.target_level,
        p.quantity_per_unit,
        p.discontinued,
        p.minimum_reorder_quantity,
        p.category,
        p.attachments,
        current_timestamp() as insertion_timestamp
    FROM {{ ref('stg_products')}} p 
    LEFT JOIN {{ ref('stg_suppliers')}} s 
    ON s.id = p.supplier_ids
),
unique_source as (

    SELECT  
        *,
        ROW_NUMBER() OVER (PARTITION BY product_id) as row_number
    FROM source
)

SELECT *
EXCEPT
    (row_number)
FROM unique_source
WHERE row_number = 1