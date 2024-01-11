WITH length_per_type(length, type) AS (
    SELECT MAX(LENGTH(w.comment)), w.type
        FROM work AS w
        WHERE LENGTH(w.comment) <> 0
        GROUP BY w.type
        ORDER BY w.type
)
SELECT wt.name, w.name, lpt.length, w.comment
    FROM length_per_type AS lpt JOIN work AS w ON lpt.type = w.type, work_type AS wt
    WHERE lpt.length = LENGTH(w.comment) AND lpt.type = wt.id
    ORDER BY wt.name, w.name;