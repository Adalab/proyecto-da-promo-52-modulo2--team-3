CREATE SCHEMA TrendySL;
USE TrendySL;

CREATE TABLE last_fm (
	id_artista INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nombre_artista VARCHAR(30) NOT NULL,
    reproducciones INT NOT NULL,
    canciones VARCHAR(45) NOT NULL,
    biografia TEXT NOT NULL,
    oyentes INT NOT NULL,
    artistas_similares VARCHAR(200) NOT NULL
);
    
CREATE TABLE spotify (
	id_cancion INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nombre_cancion VARCHAR(50) NOT NULL,
    genero_musical VARCHAR(10) NOT NULL,
    año_lanzamiento YEAR NOT NULL,
    nombre_album VARCHAR(100) NOT NULL,
    popularidad INT NOT NULL,
    id_artista INT,
    FOREIGN KEY (id_artista) REFERENCES artista(id_artista)
);

CREATE TABLE genero_musical (
	id_genero INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nombre_genero ENUM('rock', 'pop', 'reggaeton', 'bachata') NOT NULL,
    FOREIGN KEY (id_artista) REFERENCES artista(id_artista),
    FOREIGN KEY (id_cancion) REFERENCES canciones(id_cancion)
);
    