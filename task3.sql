DELETE FROM dep2
WHERE ctid NOT IN (
    SELECT MIN(ctid)
    FROM dep2
    GROUP BY id, name
);