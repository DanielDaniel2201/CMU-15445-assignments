SELECT CONCAT(a.begin_date_year - (a.begin_date_year % 10), 's') AS decade, COUNT(*) AS num_groups
    FROM artist AS a JOIN artist_type AS att ON a.type = att.id, area
    WHERE att.name = 'Group'
        AND a.area = area.id
        AND area.name = 'United States'
        AND a.begin_date_year BETWEEN 1900 AND 2023
    GROUP BY decade
    ORDER BY decade;