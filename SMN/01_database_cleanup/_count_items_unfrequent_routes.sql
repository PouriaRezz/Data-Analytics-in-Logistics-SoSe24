-- select bottom x% routes ordered by number of lots that take them
WITH selected_num_lots AS (
    SELECT
        ROUTE,
        COUNT(DISTINCT LOT) as num_lots
    FROM SMN
    GROUP BY ROUTE
    ORDER BY num_lots ASC
    LIMIT CAST(0.33*(SELECT COUNT(DISTINCT SMN.ROUTE) FROM SMN) AS INTEGER)
), lot_threshold AS (
    SELECT
        MAX(num_lots) threshold
    FROM selected_num_lots
), filtered_out_routes AS (
    SELECT
        ROUTE
    FROM SMN, lot_threshold
    GROUP BY ROUTE
    HAVING COUNT(DISTINCT LOT) < threshold
)
SELECT
    COUNT(*)
FROM SMN
WHERE ROUTE IN (SELECT ROUTE FROM filtered_out_routes);