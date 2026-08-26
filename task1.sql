-- 1 Задание. 
-- даны таблицы emp и dep. 
-- необходимо посчитать количество однофамильцев в отделах.
-- итоговый результат:
-- Бухгалтерия, 5
-- Кадры, 2

WITH dup AS (
    -- подзапрос:
    -- ищем id отдела и фамилию сотрудника
    -- у которого есть однофамилец в отделе
    SELECT dep_id, name
    FROM emp
    GROUP BY dep_id, name
    HAVING COUNT(*) > 1
)
-- основной запрос:
-- после двух (INNER) JOIN остаются только те значения
-- для которых нашлись совпадения (в частности с подзапросом)
SELECT dep.name, COUNT(*)
FROM emp
JOIN dep ON emp.dep_id = dep.id
JOIN dup ON dup.dep_id = emp.dep_id 
    AND dup.name = emp.name
GROUP BY dep.name;