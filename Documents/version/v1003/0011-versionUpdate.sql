-- Actualiza la versión del módulo en la base de datos
UPDATE OB_DBVersion 
    SET version='1.0.0.3'
WHERE modulo='LAR'