SELECT DISTINCT a2.name
    FROM artist_credit_name AS a1, artist_credit_name AS a2
        WHERE a1.artist_credit = a2.artist_credit
            AND a1.name = 'Pittsburgh Symphony Orchestra'
            AND a2.name <> 'Pittsburgh Symphony Orchestra'
    ORDER BY a2.name;