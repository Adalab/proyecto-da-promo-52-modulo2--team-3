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

/*Después de quitar duplicados nos quedamos con 3307 canciones*/
SELECT COUNT(name_track)
FROM spotipy_sin_duplicados;

/*¿Que artista sacó más canciones por año?*/
/*2003*/
SELECT name_artist ARTISTA, COUNT(*) total_canciones, genre, release_year
FROM spotipy_sin_duplicados 
WHERE release_year = 2003
GROUP BY name_artist 
ORDER BY total_canciones DESC;

/*2004*/
SELECT name_artist ARTISTA, COUNT(*) total_canciones, genre, release_year
FROM spotipy_sin_duplicados 
WHERE release_year = 2004
GROUP BY name_artist 
ORDER BY total_canciones DESC;

/*2005*/
SELECT name_artist ARTISTA, COUNT(*) total_canciones, genre, release_year
FROM spotipy_sin_duplicados 
WHERE release_year = 2005
GROUP BY name_artist 
ORDER BY total_canciones DESC;

/*2006*/
SELECT name_artist ARTISTA, COUNT(*) total_canciones, genre, release_year
FROM spotipy_sin_duplicados 
WHERE release_year = 2006
GROUP BY name_artist 
ORDER BY total_canciones DESC;

/*2007*/
SELECT name_artist ARTISTA, COUNT(*) total_canciones, genre, release_year
FROM spotipy_sin_duplicados 
WHERE release_year = 2006 AND genre = 'rock'
GROUP BY name_artist 
ORDER BY total_canciones DESC;

/*CONCLUSION: 
2003 Luny Tunes 19 canciones, Tego calderon 19 y Don Omar 16
2004 Anthony Santos 29, zion & lennox 18, callejeros 17
2005 Anthony santos 28, raulin rodriguez 28, wisin & yandel 21
2006 Hector 'el father' 34, joe veras 33, don omar 30
2007 Monchi y Alexandra 36, Juan Luis Guerra 31, wisin & yandel 27
*/

/*Tabla con el ranking de los 4 artistas con más canciones publicadas*/
SELECT name_artist Artista, COUNT(*) AS Total_canciones, genre Género
FROM spotipy_sin_duplicados
WHERE release_year BETWEEN 2003 AND 2007
GROUP BY name_artist
ORDER BY total_canciones DESC
LIMIT 4;

/*Hacemos un JOIN para añadir a la tabla de los 4 artistas con más canciones el total de oyentes y su biografia:*/
SELECT s.name_artist Artista, COUNT(*) Total_canciones, s.genre Género, l.listeners Oyentes, l.biography Biografia
FROM spotipy_sin_duplicados s
JOIN last_fm l ON s.name_artist = l.name_artist
WHERE s.release_year BETWEEN 2003 AND 2007
GROUP BY s.name_artist, s.genre, l.listeners, l.biography
ORDER BY Total_canciones DESC
LIMIT 4;

