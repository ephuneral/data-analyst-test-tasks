UPDATE fin
SET sum_salary = sub.total
FROM (
    SELECT
        month,
        emp_id,
        SUM(salary) OVER (
            PARTITION BY emp_id
            ORDER BY month
        ) AS total
    FROM fin
) sub
WHERE fin.month = sub.month
    AND fin.emp_id = sub.emp_id;