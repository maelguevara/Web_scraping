CREATE SCHEMA `bho_peliculas_3`;
USE `bho_peliculas_3`;

CREATE TABLE `peliculas` (
    `id_pelicula` VARCHAR(500),
    `nombre_pelicula` VARCHAR(500),
    `tipo` VARCHAR(500),
    `genero` VARCHAR(500),
    `año_estreno` VARCHAR(500),
    `mes_estreno` VARCHAR(500),
    `direccion` VARCHAR(500),
    `argumento` MEDIUMTEXT,
    `duracion` VARCHAR(500)
    );

CREATE TABLE `datos_interpretes` (
    `nombre_interprete` VARCHAR(500),
    `año_nacimiento`VARCHAR(500),
    `se_conoce_por` VARCHAR(500),
    `que_hace` VARCHAR(500),
    `premios` VARCHAR(500)
);

CREATE TABLE `oscars` (
    `fecha_ceremonia` VARCHAR(500),
    `nombre_pelicula` VARCHAR(500),
    `direccion` VARCHAR(500),
    `nombre_actor` VARCHAR(500),
    `nombre_actriz` VARCHAR(500)
    );
   

CREATE TABLE `puntuaciones` (
    `id_pelicula` VARCHAR(500),
    `nombre_pelicula`VARCHAR(500),
    `puntos_imdb` VARCHAR(500),
    `puntos_rotten` VARCHAR(500)
);

CREATE TABLE `interpretes_peliculas` (
	`id_interpretes_peliculas` INT NOT NULL AUTO_INCREMENT,
    `id_pelicula` VARCHAR(500),
    `nombre_interprete` VARCHAR(500),
    PRIMARY KEY (`id_interpretes_peliculas`)
);

CREATE TABLE `guionistas_peliculas` (
	`id_guionistas_peliculas` INT NOT NULL AUTO_INCREMENT,
    `id_pelicula` VARCHAR(500),
    `nombre_guionista` VARCHAR(500),
    PRIMARY KEY (`id_guionistas_peliculas`)
);
