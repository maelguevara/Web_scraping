USE bho_peliculas_3;

-- Fase 7: Realización de Consultas para Obtener Información
-- Con los datos almacenados en la base de datos, debes realizar consultas SQL para recuperar
-- información específica. Las preguntas que deberás contestar son: podrán hacer consultas para
-- encontrar películas con ciertas calificaciones, encontrar películas dirigidas por un director en
-- particular o incluso obtener una lista de películas ganadoras de un premio Oscar en una categoría
-- específica.
-- ¿Qué personas han recibido más premios Óscar?

SELECT direccion AS nombre, COUNT(*) AS numero_oscars, 'direccion' AS categoria
	FROM oscars
	GROUP BY direccion
	HAVING COUNT(*) >1
UNION ALL
SELECT nombre_actor AS nombre, COUNT(*) AS numero_oscars, 'actor' AS categoria
	FROM oscars
	GROUP BY nombre_actor
	HAVING COUNT(*) >1
UNION ALL
	SELECT nombre_actriz  AS nombre, COUNT(*) AS numero_oscars, 'actriz' AS categoria
	FROM oscars
	GROUP BY nombre_actriz
	HAVING COUNT(*) >1;

-- ¿Qué género es el mejor valorado en IMDB?
# ¿Qué año es el mejor valorado en IMDB?
-- imdb + rotten
SELECT año_estreno, COUNT(DISTINCT id_pelicula) AS numero_peliculas, ROUND(AVG(puntos_imdb)) AS media_imdb, ROUND(AVG(puntos_rotten), 2) AS media_rotten
FROM (SELECT distinct puntuaciones.id_pelicula, puntuaciones.nombre_pelicula, año_estreno, puntos_imdb, puntos_rotten
	FROM puntuaciones LEFT JOIN (SELECT id_pelicula, nombre_pelicula, año_estreno
								 FROM peliculas) AS p
    ON puntuaciones.id_pelicula = p.id_pelicula                      
	WHERE puntos_imdb > 1 AND puntos_rotten > 10) pelis_puntos
GROUP BY año_estreno
HAVING año_estreno IS NOT NULL
ORDER BY media_imdb DESC, media_rotten DESC, numero_peliculas DESC;

-- imdb
SELECT año_estreno, COUNT(DISTINCT id_pelicula) AS numero_peliculas, ROUND(AVG(puntos_imdb)) AS media_imdb
FROM (SELECT distinct puntuaciones.id_pelicula, puntuaciones.nombre_pelicula, año_estreno, puntos_imdb
	FROM puntuaciones LEFT JOIN (SELECT id_pelicula, nombre_pelicula, año_estreno
								 FROM peliculas) AS p
    ON puntuaciones.id_pelicula = p.id_pelicula                      
	WHERE puntos_imdb > 1) pelis_puntos
GROUP BY año_estreno
HAVING año_estreno IS NOT NULL
ORDER BY media_imdb DESC, numero_peliculas DESC;

-- ¿En que año se estrenaron más películas?
SELECT COUNT(id_pelicula) AS numero_peliculas, año_estreno
FROM peliculas
WHERE tipo = 'Movie'
GROUP BY año_estreno
ORDER BY numero_peliculas DESC;

-- ¿En que año se estrenaron mas cortos?
SELECT COUNT(id_pelicula) AS numero_peliculas, año_estreno
FROM peliculas
WHERE tipo = 'Short'
GROUP BY año_estreno
ORDER BY numero_peliculas DESC;

-- ¿Cuál es la mejor pelicula valorada en IMDB?
SELECT peliculas.id_pelicula, peliculas.nombre_pelicula, puntos_imdb
FROM puntuaciones LEFT JOIN peliculas
ON puntuaciones.id_pelicula = peliculas.id_pelicula
WHERE tipo = 'Movie'
ORDER BY puntos_imdb DESC;

-- ¿Cuál es la corto mejor valorada en IMDB?
SELECT peliculas.id_pelicula, peliculas.nombre_pelicula, puntos_imdb
FROM puntuaciones LEFT JOIN peliculas
ON puntuaciones.id_pelicula = peliculas.id_pelicula
WHERE tipo = 'Short'
ORDER BY puntos_imdb DESC;

-- ¿Qué actor/actriz ha recibido más premios?
-- ¿Hay algun actor/actriz que haya recibido más de un premio Óscar?
SELECT nombre_interprete, premios
FROM datos_interpretes
WHERE premios LIKE 'Ganó%Óscar%'
ORDER BY premios DESC;

-- pelicula mejor valorada de en imdb y rotten
-- imdb + rotten
SELECT distinct puntuaciones.id_pelicula, puntuaciones.nombre_pelicula, puntos_imdb, puntos_rotten, ((puntos_imdb*10)+puntos_rotten)/2 AS media_puntos
	  FROM puntuaciones 
      LEFT JOIN (SELECT id_pelicula, nombre_pelicula, año_estreno
			     FROM peliculas) AS p
ON puntuaciones.id_pelicula = p.id_pelicula                      
WHERE puntos_imdb >= 9 AND puntos_rotten > 80 
ORDER BY puntos_imdb DESC, puntos_rotten DESC;



select * from peliculas;
select * from puntuaciones;
select * from datos_interpretes;
select * from oscars;
select * from interpretes_peliculas;
select * from guionistas_peliculas;
