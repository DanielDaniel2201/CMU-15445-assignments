WITH total1 AS (
    SELECT COUNT(*) AS total
    FROM release AS r JOIN release_info AS ri ON r.id = ri.release
    WHERE ri.date_year BETWEEN 1950 AND 1959
),
total2 AS (
    SELECT COUNT(*) AS total
    FROM release AS r JOIN release_info AS ri ON r.id = ri.release
    WHERE ri.date_year BETWEEN 2010 AND 2019
),
table1 AS (
    SELECT l.name AS language, COUNT(*) AS num_release, COUNT(*) / total1.total AS share
    FROM release AS r JOIN language AS l ON r.language = l.id JOIN release_info AS ri ON r.id = ri.release, total1
    WHERE ri.date_year BETWEEN 1950 AND 1959
    GROUP BY l.name, total1.total
),
table2 AS (
    SELECT l.name AS language, COUNT(*) AS num_release, COUNT(*) / total2.total AS share
    FROM release AS r JOIN language AS l ON r.language = l.id JOIN release_info AS ri ON r.id = ri.release, total2
    WHERE ri.date_year BETWEEN 2010 AND 2019
    GROUP BY l.name, total2.total
)
SELECT table1.language, table1.num_release AS num_in_1950s, table2.num_release AS num_in_2010s, ROUND(table2.share - table1.share, 3) AS increase
FROM table1 JOIN table2 ON table1.language = table2.language
WHERE table1.num_release < table2.num_release AND increase > 0
ORDER BY increase DESC;