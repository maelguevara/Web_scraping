  ### PUNTUACIONES 
  -- Cambiar 'NO DATA' por string vacio
  -- ----------------------------------
  UPDATE puntuaciones
     SET puntos_imdb='' 
     WHERE puntos_imdb='NO DATA';
 UPDATE puntuaciones
     SET puntos_rotten='' 
     WHERE puntos_rotten='NO DATA';   
     
-- eliminar puntos rotten por denajo de 5 (no son puntos de rotten)
  -- --------------------------------------------------------------
UPDATE puntuaciones
     SET puntos_rotten='' 
     WHERE puntos_rotten < 5;     
 
 # SET sql_mode = "";    

  -- Cambiar puntos a int y float
  -- ----------------------------------
ALTER TABLE puntuaciones
MODIFY COLUMN puntos_rotten SMALLINT;

ALTER TABLE puntuaciones
MODIFY COLUMN puntos_imdb FLOAT;

/* ALTER TABLE puntuaciones
MODIFY COLUMN puntos_rotten VARCHAR(100);

ALTER TABLE puntuaciones
MODIFY COLUMN puntos_imdb VARCHAR(100);*/ 

### PELICULAS 
  -- Cambiar año y mes a SMALLINT
  -- ----------------------------------
ALTER TABLE peliculas
MODIFY COLUMN año_estreno SMALLINT;

ALTER TABLE peliculas
MODIFY COLUMN mes_estreno SMALLINT;

-- Cambiar 'NO DATA' Y 'Formato min incorrecto' por string vacio
-- ----------------------------------
  UPDATE peliculas
     SET duracion='' 
     WHERE duracion='NO DATA';

UPDATE peliculas
     SET duracion='' 
     WHERE duracion='Formato min incorrecto';   
     
ALTER TABLE peliculas
MODIFY COLUMN duracion SMALLINT;   

-- nombre peliculas más puntuadas
-- ----------------------------------
  


select * from peliculas;
select * from puntuaciones;
select * from datos_interpretes;
select * from oscars;
select * from interpretes_peliculas;
select * from guionistas_peliculas;




     