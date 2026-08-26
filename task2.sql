-- 2 Задание. 
-- дана таблица fin с заполненными полями month, emp_id, salary. 
-- необходимо посчитать нарастающий итог по каждому сотруднику.
-- результат отобразить в поле sum_salary
-- fin: month, emp_id, salary, sum_salary
-- 1, 1, 50, 50 	
-- 2, 1, 50, 100 
-- 3, 1, 50, 150
-- 1, 2, 60, 60 
-- 2, 2, 60, 120 
-- 3, 2, 60, 180

SELECT
    month,
    emp_id,
    salary,
    SUM(salary) OVER (
        -- в оконной функции разделяем на группы по emp_id
        -- сортируем по month
        -- считаем сумму SUM(salary)
        PARTITION BY emp_id 
        ORDER BY month        
    ) AS sum_salary
FROM fin
ORDER BY emp_id, month;
