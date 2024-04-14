SELECT
    format_date('%F', d)  as id,
    d                     as full_date,
    EXTRACT(YEAR FROM d)  as year,
    EXTRACT(WEEK FROM d)  as year_week,
    EXTRACT(DAY FROM d)   as year_day,
    EXTRACT(YEAR FROM d)  as fiscal_year,
    format_date('%Q', d)  as fiscal_qtr,
    EXTRACT(MONTH FROM d) as month,
    format_date('%B', d)  as month_name,
    format_date('%W', d)  as week_day,
    format_date('%A', d)  as day_name,
    (CASE WHEN format_date('%A', d) IN ('Sunday', 'Saturday') THEN 0 ELSE 1 END) as day_is_weekday
FROM (
    SELECT  
        *
    FROM
        UNNEST(GENERATE_DATE_ARRAY('2014-01-01', '2050-01-01', INTERVAL 1 DAY)) as d
    )

