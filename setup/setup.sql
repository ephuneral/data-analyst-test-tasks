CREATE TABLE dep (
    id   INTEGER PRIMARY KEY,
    name TEXT
);

CREATE TABLE emp (
    id      INTEGER PRIMARY KEY,
    name    TEXT,
    dep_id  INTEGER,
    age     INTEGER,
    salary  INTEGER
);

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