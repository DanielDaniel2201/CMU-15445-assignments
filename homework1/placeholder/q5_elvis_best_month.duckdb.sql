WITH Elvis AS (
    SELECT name, id
        FROM artist_credit
        WHERE name LIKE 'Elvis%'
            AND artist_count = 1
),
Elvises AS (
    SELECT a.name, e.id
        FROM Elvis AS e, artist AS a, artist_type AS att
        WHERE e.name = a.name
            AND a.type = att.id
            AND att.name = 'Person'
)
SELECT e.name, ri.date_month, COUNT(*) AS releases
    FROM release AS r JOIN release_info AS ri ON r.id = ri.release, Elvises AS e
    WHERE r.artist_credit = e.id AND ri.date_month IS NOT NULL
    GROUP BY e.name, ri.date_month
    ORDER BY releases DESC, e.name;
