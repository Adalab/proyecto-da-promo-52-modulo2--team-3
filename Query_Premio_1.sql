USE trendysl;

-- Creamos la tabla limpia sin duplicados. 

CREATE TABLE Spotipy_sin_duplicados AS
SELECT name_artist, name_track,
       MIN(genre) AS genre,
       MIN(release_year) AS release_year
FROM spotipy
GROUP BY name_artist, name_track


-- 4 artistas más reproducidos por cada género y año. Posteriormente podemos comparar

-- VERSION 1 DE LA QUERY

SELECT S.name_artist, MAX(LFM.playcount) AS max_playcount
FROM Spotipy S
JOIN Last_FM LFM ON S.name_artist = LFM.name_artist
WHERE S.release_year = 2006
  AND S.genre = 'reggaeton'
GROUP BY S.name_artist
ORDER BY max_playcount DESC
LIMIT 4;


SELECT *
FROM spotipy_sin_duplicados;

SELECT *
from last_FM; 

-- QUERY FINAL PARA MEDIR POPULARIDAD: SE HARÁ UNA MEDIA SIMPLE ENTRE PLAYCOUNT Y LISTENERS

SELECT 
  S.name_artist, 
  (LFM.listeners + LFM.playcount) / 2 AS popularity_score
FROM Spotipy_sin_duplicados S
JOIN Last_FM LFM ON S.name_artist = LFM.name_artist
WHERE S.genre = 'reggaeton'
  AND S.release_year BETWEEN 2003 AND 2007
GROUP BY S.name_artist, LFM.listeners, LFM.playcount
ORDER BY popularity_score DESC
LIMIT 4; 

-- QUERY FINAL PARA MEDIR POPULARIDAD: SE HARÁ UNA MEDIA SIMPLE ENTRE PLAYCOUNT Y LISTENERS

SELECT 
  name_artist,
  listeners,
  playcount,
  simple_avg_popularity,
  ROUND((simple_avg_popularity / max_popularity) * 10, 2) AS popularity_score_1_to_10
FROM (
  SELECT 
    S.name_artist,
    LFM.listeners,
    LFM.playcount,
    (LFM.listeners + LFM.playcount) / 2 AS simple_avg_popularity
  FROM spotipy_sin_duplicados S
  JOIN Last_FM LFM ON S.name_artist = LFM.name_artist
  WHERE S.genre = 'bachata'
    AND S.release_year BETWEEN 2003 AND 2007
  GROUP BY S.name_artist, LFM.listeners, LFM.playcount
) AS sub
CROSS JOIN (
  SELECT 
    MAX((LFM.listeners + LFM.playcount) / 2) AS max_popularity
  FROM spotipy_sin_duplicados S
  JOIN Last_FM LFM ON S.name_artist = LFM.name_artist
  WHERE S.genre = 'bachata'
    AND S.release_year BETWEEN 2003 AND 2007
) AS max_val
ORDER BY popularity_score_1_to_10 DESC
LIMIT 4;

-- Para saber el GANADOR del premio:

SELECT 
  S.name_artist,
  S.genre,
  LFM.listeners,
  LFM.playcount,
  (LFM.listeners + LFM.playcount) / 2 AS simple_avg_popularity
FROM spotipy_sin_duplicados S
JOIN Last_FM LFM ON S.name_artist = LFM.name_artist
WHERE S.name_artist IN (
  'Daddy Yankee',
  'Coldplay',
  'Radiohead',
  'Aventura'
)
GROUP BY S.name_artist, S.genre, LFM.listeners, LFM.playcount
ORDER BY simple_avg_popularity DESC
LIMIT 1;

-- Para confirmar el resultado:

SELECT 
  S.name_artist,
  S.genre,
  LFM.listeners,
  LFM.playcount,
  (LFM.listeners + LFM.playcount) / 2 AS simple_avg_popularity
FROM spotipy_sin_duplicados S
JOIN Last_FM LFM ON S.name_artist = LFM.name_artist
WHERE S.name_artist IN ('Radiohead', 'Coldplay', 'Aventura', 'Daddy Yankee')
GROUP BY S.name_artist, S.genre, LFM.listeners, LFM.playcount
ORDER BY simple_avg_popularity DESC;

