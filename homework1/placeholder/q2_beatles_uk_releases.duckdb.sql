WITH beatles_id AS (
    SELECT id
        FROM artist
        WHERE name = 'The Beatles'
),
medium_of_12Vinyl AS (
    SELECT m.release
        FROM medium AS m JOIN medium_format AS mf ON m.format = mf.id
        WHERE mf.name = '12" Vinyl'
),
release_with_info AS (
    SELECT r.name, ri.date_year, r.artist_credit
        FROM release AS r JOIN release_info AS ri ON r.id = ri.release, medium_of_12Vinyl AS m, area
        WHERE r.id = m.release AND area.name = 'United Kingdom' AND ri.area = area.id
),
Beatles_release AS (
    SELECT r.name, r.date_year
        FROM beatles_id AS a JOIN release_with_info AS r ON a.id = r.artist_credit
)
SELECT br.name AS release_name, br.date_year AS release_year
    FROM Beatles_release AS br, artist AS a
    WHERE a.name = 'The Beatles'
    AND br.date_year <= a.end_date_year
    ORDER BY br.date_year, br.name;