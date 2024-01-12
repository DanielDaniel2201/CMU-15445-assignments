SELECT DISTINCT table1.artist_name AS artist_name, table1.release_name AS release_name, table1.release_year AS release_year
FROM (
    SELECT a.name
FROM artist AS a JOIN gender AS g ON a.gender = g.id
WHERE g.name = 'Male' AND a.begin_date_year = 1991
ORDER BY a.name
) male_artists(name), LATERAL (
    SELECT male_artists.name, r.name, ri.date_year
    FROM release AS r JOIN artist_credit AS ac ON r.artist_credit = ac.id JOIN release_info AS ri ON r.id = ri.release JOIN artist_credit_name AS acn ON ac.id = acn.artist_credit JOIN artist AS a ON a.id = acn.artist
    WHERE ac.artist_count = 4 AND male_artists.name = a.name
) table1(artist_name, release_name, release_year)
ORDER BY artist_name
LIMIT 3;