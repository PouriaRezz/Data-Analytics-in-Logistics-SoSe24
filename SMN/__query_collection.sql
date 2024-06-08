-- this is a collection of interesting queries that helped develop the queries that were actually asked for.

-- all routes ordered by the number of integrity violations that occurred
SELECT
    SMN.ROUTE,
    SUM(SORTER_JOB_COMPLETE_INCON_SRC) AS num_errors
FROM SMN
GROUP BY ROUTE
ORDER BY num_errors DESC;

-- start and end time, first and last operation of the route with the most integrity violations 'CJL'.
-- As comparison the start and end time of the window given in the data is also queried
SELECT
    min(TIME_STAMP_UTC),
    max(TIME_STAMP_UTC),
    min(OPERATION),
    max(OPERATION),
    (SELECT MIN(TIME_STAMP_UTC) FROM SMN),
    (SELECT MAX(TIME_STAMP_UTC) FROM SMN)
FROM SMN WHERE ROUTE = 'CJL';
-- 2022-09-22 12:39:25  2023-09-22 12:46:00     1   55  2022-09-22 12:39:16     2023-09-22 12:50:31
-- --> This route probably spans over the whole time our data covers


-- All operations of a route, the number of lots that passed these operations and the type of the operation
SELECT
    OPERATION,
    COUNT(LOT),
    EQUIPMENT,
    iif(EQUIPMENT = 'AUTP', 'SORTING', iif(EQUIPMENT = 'MESP', 'MEASURING', NULL)) AS step_type
FROM SMN
WHERE ROUTE = 'CJL'
GROUP BY OPERATION
ORDER BY OPERATION;


-- For each lot:
--      time of first/last operation (start & end)
--      number of operations
--      duration between start and end (in seconds)
--      list of all operations
SELECT
    LOT,
    MIN(TIME_STAMP_UTC) as start,
    MAX(TIME_STAMP_UTC) as end,
    COUNT(OPERATION) as number_of_steps,
    UNIXEPOCH(MAX(TIME_STAMP_UTC)) - UNIXEPOCH(MIN(TIME_STAMP_UTC)) as duration_seconds,
    GROUP_CONCAT(OPERATION)
FROM SMN
GROUP BY LOT
ORDER BY start;

-- calculates the gaps between two consecutive sorter jobs of one route and counts the number of these sized gaps in all lots that took that route
WITH lot_route_operation_pairs AS (
    SELECT
        LOT,
        ROUTE,
        OPERATION,
        LAG(OPERATION) OVER (PARTITION BY ROUTE, LOT) AS prev
    FROM SMN
    WHERE EQUIPMENT = 'AUTP'
) SELECT
    ROUTE,
    OPERATION - prev AS gap,
    COUNT(OPERATION - prev) AS count
FROM lot_route_operation_pairs
WHERE prev IS NOT NULL
GROUP BY ROUTE, gap
ORDER BY ROUTE, gap;
