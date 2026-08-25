CREATE TABLE IF NOT EXISTS dep (
    id   INTEGER,
    name TEXT
);

CREATE TABLE IF NOT EXISTS emp (
    id      INTEGER,
    name    TEXT,
    dep_id  INTEGER,
    age     INTEGER,
    salary  INTEGER
);

CREATE TABLE IF NOT EXISTS fin (
    month       INTEGER,
    emp_id      INTEGER,
    salary      INTEGER,
    sum_salary  INTEGER
);

CREATE TABLE IF NOT EXISTS dep2 (
    id   INTEGER,
    name TEXT
);

TRUNCATE TABLE emp, dep, fin, dep2 RESTART IDENTITY;

INSERT INTO dep VALUES (1, 'Бухгалтерия'), (2, 'Кадры');

INSERT INTO emp VALUES
(1, 'Иванов',  1, 45, 100),
(2, 'Петров',  1, 34, 86),
(3, 'Петров',  1, 18, 75),
(4, 'Петров',  1, 56, 92),
(5, 'Сидоров', 1, 28, 101),
(6, 'Сидоров', 1, 37, 79),
(7, 'Сидоров', 2, 31, 55),
(8, 'Сидоров', 2, 30, 67),
(9, 'Федотов', 2, 18, 43);

INSERT INTO fin (month, emp_id, salary) VALUES
(1, 1, 50),
(2, 1, 50),
(3, 1, 50),
(1, 2, 60),
(2, 2, 60),
(3, 2, 60);

INSERT INTO dep2 VALUES
(1, 'Бухгалтерия'), 
(1, 'Бухгалтерия'),
(1, 'Бухгалтерия'),
(1, 'Бухгалтерия'),
(1, 'Бухгалтерия'),
(2, 'Кадры'),
(2, 'Кадры'),
(2, 'Кадры');
