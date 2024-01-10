SELECT r.name, ac.name, ri.date_year
    FROM release AS r, release_info AS ri, medium AS m, medium_format AS mf, artist_credit AS ac
    WHERE r.id = ri.release
        AND m.format = mf.id
        AND mf.name = 'Cassette'
        AND r.id = m.release
        AND r.artist_credit = ac.id
    ORDER BY ri.date_year DESC, ri.date_month DESC, ri.date_day DESC
    LIMIT 10;