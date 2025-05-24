USE trendySL;

/*Al darnos cuenta de que hay muchas canciones y artista duplicadas generamos una nueva tabla sin duplicados*/
SELECT name_artist, name_track, 
       MIN(genre) AS genre, 
       MIN(release_year) AS release_year
FROM spotipy
GROUP BY name_artist, name_track;

/*Creamos la tabla sin duplicados para trabajar sobre ella*/

CREATE TABLE Spotipy_sin_duplicados AS
SELECT name_artist, name_track, 
       MIN(genre) AS genre, 
       MIN(release_year) AS release_year
FROM spotipy
GROUP BY name_artist, name_track;


/* Consulta principal para encontrar a los 4 artistas con menos lanzamientos entre 2003 y 2006, y muchos oyentes en 2007*/ 

SELECT
    s07.name_artist,
    SUM(l.listeners) AS total_oyentes_2007,
    COUNT(DISTINCT s07.name_track) AS num_lanzamientos_2007,
    s07.genre
FROM Spotipy_sin_duplicados s07
JOIN Last_Fm l ON s07.name_artist = l.name_artist
WHERE s07.release_year = 2007 AND s07.name_artist NOT IN (                -- Subconsulta para excluir artistas con lanzamientos entre 2003 y 2006 --
        SELECT DISTINCT s_anterior.name_artist
        FROM Spotipy_sin_duplicados s_anterior
        WHERE s_anterior.release_year BETWEEN 2003 AND 2006)
GROUP BY s07.name_artist, s07.genre
ORDER BY total_oyentes_2007 DESC
LIMIT 4;

-- Ahacemos los mismo con los dos años anteriores --

SELECT
    s07.name_artist,
    SUM(l.listeners) AS total_oyentes_2007,
    COUNT(DISTINCT s07.name_track) AS num_lanzamientos_2007,
    s07.genre
FROM Spotipy_sin_duplicados s07
JOIN Last_Fm l ON s07.name_artist = l.name_artist
WHERE s07.release_year = 2006 AND s07.name_artist NOT IN (                -- Subconsulta para excluir artistas con lanzamientos entre 2003 y 2006 --
        SELECT DISTINCT s_anterior.name_artist
        FROM Spotipy_sin_duplicados s_anterior
        WHERE s_anterior.release_year BETWEEN 2003 AND 2005)
GROUP BY s07.name_artist, s07.genre
ORDER BY total_oyentes_2007 DESC
LIMIT 1;


SELECT
    s07.name_artist,
    SUM(l.listeners) AS total_oyentes_2007,
    COUNT(DISTINCT s07.name_track) AS num_lanzamientos_2007,
    s07.genre
FROM Spotipy_sin_duplicados s07
JOIN Last_Fm l ON s07.name_artist = l.name_artist
WHERE s07.release_year = 2005 AND s07.name_artist NOT IN (         -- Subconsulta para excluir artistas con lanzamientos entre 2003 y 2006 --
        SELECT DISTINCT s_anterior.name_artist
        FROM Spotipy_sin_duplicados s_anterior
        WHERE s_anterior.release_year BETWEEN 2003 AND 2004)
GROUP BY s07.name_artist, s07.genre
ORDER BY total_oyentes_2007 DESC
LIMIT 1;

/* Comprobamos que los 3 son del genero rock. Podemos concluir que en estos 
3 años el rock irrumpe con fuerza por delante del Pop*/




-- A pesar de tener menos artistas, el rock fue el género más reproducido entre 2004 y 2007.--
/* Primera parte de la consullta. El genero mas reproduciodo segun oyentes*/
SELECT
    s.genre,
    SUM(l.playcount) AS playcount_total_genero
FROM Spotipy_sin_duplicados s
JOIN Last_Fm l ON s.name_artist = l.name_artist
WHERE s.release_year BETWEEN 2004 AND 2007
GROUP BY s.genre
ORDER BY playcount_total_genero DESC
LIMIT 4;

/* Segunda parte. Numero de artistas por genero*/
SELECT
    s.genre,
    COUNT(DISTINCT s.name_artist) AS numero_de_artistas
FROM Spotipy_sin_duplicados s
WHERE s.release_year BETWEEN 2004 AND 2007
GROUP BY s.genre
ORDER BY numero_de_artistas DESC; -- Ordeno para ver qué género tiene más/menos artistas




-- DATO CURIOSO, Artista más versatil --
SELECT name_artist, COUNT(DISTINCT genre) AS num_generos_diferentes
FROM Spotipy_sin_duplicados
GROUP BY name_artist
ORDER BY num_generos_diferentes DESC
LIMIT 5; 


-- DATO CURIOSO, Genero con mas artistas nuevos --
SELECT
    s2007.genre,
    SUM(l.listeners) AS oyentes_nuevos_genero_2007,
    COUNT(DISTINCT s2007.name_artist) AS num_nuevos_artistas_genero_2007
FROM Spotipy_sin_duplicados s2007
JOIN Last_Fm l ON s2007.name_artist = l.name_artist
WHERE s2007.release_year = 2007 AND s2007.name_artist NOT IN (
        SELECT DISTINCT s_anterior.name_artist
        FROM Spotipy_sin_duplicados s_anterior
        WHERE s_anterior.release_year BETWEEN 2003 AND 2006
    )
GROUP BY s2007.genre
ORDER BY oyentes_nuevos_genero_2007 DESC, num_nuevos_artistas_genero_2007 DESC
LIMIT 4;

