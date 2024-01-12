SELECT table1.art_name, COUNT(*), STRING_AGG(table1.art_alias, ',') AS alias
FROM (
    SELECT a.name AS art_name, aa.name AS art_alias
    FROM artist AS a JOIN artist_alias AS aa ON a.id = aa.artist
    WHERE a.name LIKE '%John' AND LOWER(aa.name) NOT LIKE '%john%'
    ORDER BY aa.name
) AS table1
GROUP BY table1.art_name
ORDER BY table1.art_name;