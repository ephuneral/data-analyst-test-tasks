-- 4 Задание. Оптимизация запросов в SQL

-- Имеется база, в которой есть столбец с датой и временем - они указаны по Гринвицу (-3 от МСК)
-- На столбец start_date есть индекс.
-- Как оптимизировать следующий запрос, если дата и время на выходе нам нужны уже по МСК:

-- Размышления:
-- start_date - UTC
-- start и end - UTC +3
-- Необходимо перевести start и end в UTC из UTC +3 и тогда вместо 
-- where dateadd(hour, 3, start_date) between @start and @end
-- будет 
-- where start_date between @start_utc and @end_utc
-- индекс начнет работать, а функция dateadd() будет 
-- выполняться только для отобранных с помощью where строк

DECLARE @start AS datetime = '2000-03-01 00:00:00';
DECLARE @end   AS datetime = '2000-03-31 23:59:59';

DECLARE @start_utc AS datetime = DATEADD(hour, -3, @start);
DECLARE @end_utc   AS datetime = DATEADD(hour, -3, @end); 

SELECT name,
       start_date AS time_utc,
       DATEADD(hour, 3, start_date) AS time_msk
FROM DQ.DB.employers
WHERE start_date BETWEEN @start_utc AND @end_utc;