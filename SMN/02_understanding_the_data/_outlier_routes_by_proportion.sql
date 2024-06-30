WITH step_counts AS (
    SELECT
        route,
        COUNT(*) AS total_steps,
        SUM(CASE WHEN equipment NOT IN ('AUTP', 'MESP') THEN 1 ELSE 0 END) AS productive_steps,
        SUM(CASE WHEN equipment = 'MESP' THEN 1 ELSE 0 END) AS measurement_steps,
        SUM(CASE WHEN equipment = 'AUTP' THEN 1 ELSE 0 END) AS sorting_steps
    FROM
        SMN
    GROUP BY
        route
),
proportions AS (
    SELECT
        route,
        productive_steps * 1.0 / total_steps AS productive_proportion,
        measurement_steps * 1.0 / total_steps AS measurement_proportion,
        sorting_steps * 1.0 / total_steps AS sorting_proportion,
        productive_steps,
        measurement_steps,
        sorting_steps
    FROM
        step_counts
),
avg_calc AS (
    SELECT
        AVG(productive_proportion) AS avg_prod
    FROM
        proportions
),
var_calc AS (
    SELECT
        AVG((productive_proportion - (SELECT avg_prod FROM avg_calc)) * (productive_proportion - (SELECT avg_prod FROM avg_calc))) AS var_prod
    FROM
        proportions
),
std_dev_calc AS (
    SELECT
        SQRT(var_prod) AS std_dev_prod
    FROM
        var_calc
)
SELECT
    p.route,
    p.productive_proportion,
    p.measurement_proportion,
    p.sorting_proportion,
    p.productive_steps,
    p.measurement_steps,
    p.sorting_steps
FROM
    proportions p,
    avg_calc a,
    std_dev_calc s
WHERE
    p.productive_proportion > a.avg_prod + 2 * s.std_dev_prod
    OR p.productive_proportion < a.avg_prod - 2 * s.std_dev_prod;
