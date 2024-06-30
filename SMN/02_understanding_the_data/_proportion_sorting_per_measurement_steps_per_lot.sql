WITH step_counts AS (
    SELECT
        lot,
        SUM(CASE WHEN equipment = 'MESP' THEN 1 ELSE 0 END) AS measurement_steps,
        SUM(CASE WHEN equipment = 'AUTP' THEN 1 ELSE 0 END) AS sorting_steps
    FROM
        SMN
    GROUP BY
        lot
)
SELECT
    lot,
    sorting_steps * 1.0 / NULLIF(measurement_steps, 0) AS sorting_per_measurement
FROM
    step_counts;

