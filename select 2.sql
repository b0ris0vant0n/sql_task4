SELECT g.name, count(s.name)FROM singer s
JOIN singer_genre sg ON s.id = sg.singer_id
JOIN genre g ON sg.genre_id = g.id
GROUP BY g.name
ORDER BY count(s.name) DESC;


SELECT count(t.name) FROM album a
JOIN track t ON t.album_id = a.id
WHERE (a.release_year >= 2019) AND (a.release_year <= 2020)


SELECT a.name, AVG(t.duration) FROM album a 
JOIN track t ON t.album_id = a.id
GROUP BY a.name 


SELECT DISTINCT s.name FROM singer s 
WHERE s.name not in (SELECT DISTINCT s.name FROM singer s  
    JOIN album_singer als on s.id = als.singer_id
    JOIN album a on a.id = als.album_id
    WHERE a.release_year = 2020)
   

SELECT DISTINCT c.name FROM collections c
JOIN track_collections tc ON c.id = tc.collections_id 
JOIN  track t ON t.id = tc.track_id 
JOIN album a ON a.id  = t.album_id 
JOIN album_singer als ON als.album_id = a.id 
JOIN singer s ON s.id = als.singer_id 
WHERE s.name LIKE '%Elton%'


SELECT DISTINCT a.name FROM album a
JOIN album_singer als ON a.id = als.album_id 
JOIN singer s ON s.id = als.singer_id 
JOIN singer_genre sg ON s.id = sg.singer_id 
JOIN genre g ON g.id = sg.genre_id 
GROUP BY a.name 
HAVING count(DISTINCT g.name) > 1


SELECT t.name FROM track t 
LEFT JOIN track_collections tc ON t.id = tc.track_id 
WHERE tc.track_id IS NULL


SELECT s.name, t.duration FROM  track t
JOIN album a ON a.id = t.album_id
JOIN album_singer als ON als.album_id = a.id
JOIN singer s ON s.id = als.singer_id 
GROUP BY s.name, t.duration 
HAVING t.duration = (SELECT min(duration) FROM track)


SELECT DISTINCT a.name FROM album a
LEFT JOIN track ON t.album_id = a.id
WHERE t.album_id IN (
    SELECT album_id FROM track
    GROUP BY album_id HAVING count(id) = (
        SELECT count(id) FROM track
        GROUP BY album_id
        ORDER BY count
        LIMIT 1
    )
)
ORDER BY a.name



