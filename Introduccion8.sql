-- dejar en blanco la tabla historialcobranza
TRUNCATE historialcobranza 

SELECT * FROM historialcobranza h 
SELECT * FROM cobranza c 

-- modificar registros con tablas temporales
INSERT INTO historialcobranza(idcliente, nombre, apellidopaterno, apellidomaterno)
SELECT DISTINCT idcliente, nombre, apellidopaterno, apellidomaterno FROM cobranza 

-- creando tabla temporal
-- al poner 1 en el order by o group by referencia la primera columna
CREATE TEMPORARY TABLE temporal 
AS SELECT DISTINCT idcliente, COUNT(fechacobro::DATE) AS contador
FROM cobranza c 
GROUP BY 1
ORDER BY 1

SELECT * FROM temporal 
DROP TABLE temporal

-- modificacion historial cobranza columna cantidadllamadas
UPDATE historialcobranza h 
SET cantidadllamadas = t.contador
FROM temporal t
WHERE t.idcliente = h.idcliente 

-- operador like y not LIKE 
SELECT * FROM alumnos a 
SELECT * FROM alumnos a2 WHERE apellidopaterno LIKE 'Val%'
SELECT * FROM alumnos a2 WHERE apellidopaterno LIKE '%av%'
SELECT * FROM alumnos a2 WHERE apellidopaterno LIKE '%z' AND apellidomaterno LIKE '%z'

SELECT * FROM alumnos a2 WHERE apellidopaterno NOT LIKE 'V%'

-- tipos de datos
CREATE TABLE tiposdedatos(
	num1 SMALLINT,
	num2 INT2,
	num3 INT,
	num4 INT4,
	num5 BIGINT,
	num6 INT8,
	num7 DECIMAL(6,2),
	num8 FLOAT
);
-- en decimal si es 6 es la cantidad total tanto derecha e izquierda
-- el 2 es solo los decimales aunque tenga mas se redondea
SELECT * FROM tiposdedatos 
INSERT INTO tiposdedatos (num1, num2, num3, num4, num5, num6, num7, num8)
VALUES(0,0,0,0,0,0,5288.224,0)

ALTER TABLE tiposdedatos ADD COLUMN num9 SERIAL
INSERT INTO tiposdedatos (num1, num2, num3, num4, num5, num6, num7, num8, num9)
VALUES(0,0,0,0,0,0,0,0,0)

-- acabo el primer video