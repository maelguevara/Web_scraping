USE bho_peliculas_3;

### PELICULAS 
-- Eliminamos id duplicadas 
-- ------------------------- 
DELETE FROM peliculas
WHERE id_pelicula IN (SELECT id_pelicula
					  FROM (SELECT * FROM peliculas) AS p
					  GROUP BY id_pelicula
				      HAVING count(*) > 1);
                      
-- Eliminamos nombres duplicados 
-- -------------------------                      
DELETE FROM peliculas
WHERE nombre_pelicula IN (SELECT nombre_pelicula 
						  FROM (SELECT * FROM peliculas) AS p
						  GROUP BY nombre_pelicula
					      HAVING count(*) > 1);
                      
-- Creamos PRIMARY KEY  
-- -------------------------------                       
ALTER TABLE peliculas
ADD PRIMARY KEY (id_pelicula);

### INTERPRETES 
-- Creamos PRIMARY KEY  
-- -------------------                  
ALTER TABLE datos_interpretes
ADD PRIMARY KEY (nombre_interprete);

### OSCASR 
-- Creamos PRIMARY KEY
-- --------------------
ALTER TABLE oscars
ADD PRIMARY KEY (nombre_pelicula);


### Puntuaciones
-- Creamos PRIMARY KEY 
-- --------------------             
ALTER TABLE puntuaciones
ADD PRIMARY KEY (id_pelicula);




