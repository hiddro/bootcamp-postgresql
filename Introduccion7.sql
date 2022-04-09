-- creando tabla alumnossobresalientes
CREATE TABLE alumnossobresalientes(
numcontrol BIGINT,
nombre VARCHAR(45),
apellidopaterno VARCHAR(45),
apellidomaterno VARCHAR(45),
fechaingreso TEXT,
carrera VARCHAR(45),
promedio DECIMAL(6,2)

);

-- creando tabla alumnos
CREATE TABLE alumnos(
numcontrol BIGINT,
nombre VARCHAR(45),
apellidopaterno VARCHAR(45),
apellidomaterno VARCHAR(45),
fechanacimiento DATE,
fechaingreso DATE,
telefono VARCHAR(12),
carrera VARCHAR(45),
promedio DECIMAL(6,2)
);

INSERT INTO alumnos(numcontrol,nombre,apellidopaterno,apellidomaterno,fechanacimiento,fechaingreso,telefono,carrera,promedio)
 VALUES(1000,'Juan','Vazquez','Perez','2016-05-08','1992-02-18',
'1234564343','Mercadotecnia',95.92),(1001,'Juan','Vazquez','Perez','2018-02-08','1991-05-12',
'1234564348','Ingenieria en Sistemas',85.2),(1002,'Carlos Miguel','Lopez','Perez','2017-03-15','1989-07-15',
'1234564349','Fisico Matematico',90),(1003,'Maria Carlota','SAnchez','Perez','2018-02-02','1995-08-17',
'1234564322','Psicologia',95.8),(1004,'Casandra','Gavilan','Gonzalez','2018-07-25','1995-06-18',
'1234564335','Matematicas puras',89.2),(1005,'Andrea','Davila','Antonios','2018-06-02','1996-06-21',
'1234564326','Biologia',99),(1006,'Joao','Aguiar','Garza','2015-03-15','1993-03-28',
'1234564327','Ingenieria Mecatronica',92.4),(1007,'Daniel','Zambrano','Espino','2015-07-18','1996-02-05',
'1234564328','Robotica',100),(1008,'Flor','Velazquez','Espinoza','2017-02-08','1995-05-07',
'1234564345','Contabilidad',100),(1009,'Celeste','Vazquez','De la O','2015-08-22','1995-01-31',
'1234564385','Bionica',99.9),(1010,'Abigail','Andrade','Beltran','2020-05-12','1999-01-17',
'1234564373','Fisico Matematico',85.2),(1011,'Juan Carlos','Espinoza','Campos','2020-05-15','1995-01-15',
'1234564399','Fisico Matematico',100),(1012,'Dionicio','Espino','Espinoza','2021-06-15','2003-05-12',
'1234564398','Ingenieria en Sistemas',85),(1013,'Jose Carlos','Flores','Garcia','2021-07-17','2003-08-12',
'1234564390','Contabilidad',82.9),(1014,'Jose Pedro','Valle','Perez','2021-08-01','2002-06-25',
'1234564312','Ingenieria Quimica',84.2),(1015,'Miguel Luis','Flores','Sanchez','2021-01-15','2002-05-28',
'1234564315','Fisico Matematico',92.5),(1016,'JoseMarcelo','Gonzalez','Miranda','2018-05-12','1998-06-25',
'1234564222','Mercadotecnia',75.9),(1017,'Flor Estela','Huerta','Espinosa','2018-07-09','1998-06-25',
'1234564555','Fisica',91.1),(1018,'Cristian Jesus','Kilberth','Perez','2018-01-08','1998-02-01',
'1234564532','Artes',94.2),(1019,'Maria Cecilia','Lopez','Lopez','2020-07-28','2003-05-25',
'1234564145','Psicologia',85.6),(1020,'Juan Alberto','Martinez','Vazquez','2016-07-22','1998-02-25',
'1234564142','Medicina',80.2),(1021,'Franchesco Daniel','Nunez','Perez','2017-07-15','1995-09-02',
'1234564248','Medicina',99.2),(1022,'Laura','Quinonez','Garcia','2020-02-08','2003-05-04',
'1234564788','Medicina',95.2);

-- se guardar en la tabla alumnossobresalientes solo los que tienen promedio mayor que 90 de alumnos
SELECT * FROM alumnossobresalientes a 
SELECT * FROM alumnos a2 

INSERT INTO alumnossobresalientes (numcontrol, nombre, apellidopaterno, apellidomaterno, fechaingreso, carrera, promedio)
SELECT DISTINCT (numcontrol), nombre, apellidopaterno, apellidomaterno , fechaingreso , carrera , promedio 
FROM alumnos 
WHERE promedio >= 90

-- actualizar datos de una tabla con valores de otra tabla update con join
SELECT * FROM vendedor v 
SELECT * FROM sucursales s 

-- agregando columnas a vendedor
ALTER TABLE vendedor ADD COLUMN municipio VARCHAR(45);
ALTER TABLE vendedor ADD COLUMN estado VARCHAR(45);

-- municipio ey estado
UPDATE vendedor v 
SET estado = s.estado 
FROM sucursales AS s
WHERE v.num_sucursal = s.numsucursal 

DROP TABLE sucursales 

-- borrar registros de una tabla consultando otra tabla
SELECT * FROM editorial e WHERE nombreeditorial = 'Mexico'

SELECT * FROM libros l
JOIN editorial e2 
ON l.codigoeditorial = e2.codigo_editorial 
WHERE e2.nombreeditorial = 'Mexico'

-- dos maneras de borrar de una tabla
-- manera 1
SELECT * FROM editorial e WHERE nombreeditorial = 'Mexico'
DELETE libros WHERE codigo_editorial = 220

-- manera 2
DELETE FROM libros l
USING editorial e
WHERE l.codigoeditorial = e.codigo_editorial
AND e.nombreeditorial = 'Mexico'

SELECT * FROM libros l WHERE codigoeditorial = 220

-- esto deja vacio la tabla libros
TRUNCATE libros 

-- subconsultas
SELECT * FROM empleados e 

--mostrar empleados cuyos sueldos sean mayor del promedio
-- 1 manera
SELECT AVG(sueldo) AS sueldopromedio FROM empleados e 
SELECT SUM(sueldo) AS sueldopromedio FROM empleados e 
SELECT COUNT(*) FROM empleados e 

SELECT nombre, apellidopaterno, apellidomaterno, sueldo 
FROM empleados e 
WHERE sueldo > 3879.3

-- con subconsulta
SELECT nombre, apellidopaterno, apellidomaterno, sueldo 
FROM empleados e 
WHERE sueldo > (SELECT AVG(sueldo) FROM empleados)

-- mismo puesto que juan lopez sanchez
SELECT * FROM empleados e 

SELECT nombre, apellidopaterno, apellidomaterno , puesto 
FROM empleados e2 
WHERE puesto = 'Limpieza'

SELECT nombre, apellidopaterno, apellidomaterno , puesto 
FROM empleados e2 
WHERE puesto = (SELECT puesto FROM empleados WHERE nombre LIKE '%Juan%' AND apellidopaterno LIKE '%Lopez%' AND apellidomaterno LIKE '%Sanchez%')

SELECT nombre, apellidopaterno, apellidomaterno , puesto 
FROM empleados e2 
WHERE puesto = (SELECT puesto FROM empleados WHERE empleadoid = 2234)

SELECT * FROM empleados e 

-- saber el precio de un libro determinado y diferencia de un libro de menor precio
SELECT * FROM libros 

-- libro de menor precio
SELECT MIN(precio) FROM libros l 
SELECT MAX(precio) FROM libros l 

SELECT titulo, autor, precio-(SELECT MIN(precio) FROM libros) AS minimo FROM libros l WHERE titulo LIKE '%El conejito'
SELECT titulo, autor, precio-(SELECT MAX(precio) FROM libros) AS maximo FROM libros l WHERE titulo LIKE '%El conejito'

-- mostrar diferencia de CONTROL alumno 1000 promedio 95.92
SELECT * FROM alumnos a 
SELECT MAX(promedio) FROM alumnos a 

SELECT nombre, apellidopaterno, apellidomaterno, promedio-(SELECT MAX(promedio) FROM alumnos) AS diferencia
FROM alumnos a WHERE numcontrol = 1000

-- creando tabla cobranza
CREATE TABLE cobranza(
idcliente INTEGER,
nombre VARCHAR(45),
apellidopaterno VARCHAR(45),
apellidomaterno VARCHAR(45),
fechacobro DATE,
totaldeuda DECIMAL(7,2),
cantidadabono DECIMAL(7,2)
);   

INSERT INTO cobranza(idcliente,nombre,apellidopaterno,apellidomaterno,fechacobro,totaldeuda,cantidadabono)
 VALUES(1000,'Juan','Vazquez','Perez','2021-08-01',4585.2,0),
 (1001,'Alberto','Gamez','Galvez','2021-08-01',2000.2,0),
 (1002,'Damaris','Gomez','Zaragoza','2021-08-01',2000,0),
 (1003,'Cristina','Lizarraga','Sanchez','2021-08-01',5000,0),
 (1004,'Jesus','Gonzalez','Gamez','2021-08-01',1000,0),
 (1005,'Eustaquio','Aranza','Mercado','2021-08-01',2000,0),
 (1005,'Eustaquio','Aranza','Mercado','2021-08-01',2000,0),
 (1005,'Eustaquio','Aranza','Mercado','2021-08-01',2000,0),
 (1005,'Eustaquio','Aranza','Mercado','2021-08-02',2000,0),
 (1001,'Alberto','Gamez','Galvez','2021-08-03',2000.2,0),
 (1006,'Ana Laura','Barrera','Galvez','2021-08-03',5000.2,0),
 (1007,'Azucena','Sanchez','Lopez','2021-08-03',5000.2,0),
 (1008,'Jose','Serrano','Esparza','2021-08-03',4000.2,0),
 (1009,'Adalberto','Gutierrez','Galvez','2021-08-03',1000.5,0),
 (1000,'Juan','Vazquez','Perez','2021-08-04',4585.2,0),
 (1001,'Alberto','Gamez','Galvez','2021-08-04',2000.2,0),
 (1002,'Damaris','Gomez','Zaragoza','2021-08-04',2000,0),
 (1003,'Cristina','Lizarraga','Sanchez','2021-08-05',5000,0),
 (1004,'Jesus','Gonzalez','Gamez','2021-08-05',1000,0),
 (1005,'Eustaquio','Aranza','Mercado','2021-08-06',2000,0),
 (1005,'Eustaquio','Aranza','Mercado','2021-08-07',2000,0),
 (1005,'Eustaquio','Aranza','Mercado','2021-08-08',2000,0),
 (1005,'Eustaquio','Aranza','Mercado','2021-08-08',2000,0),
 (1001,'Alberto','Gamez','Galvez','2021-08-09',2000.2,0),
 (1006,'Ana Laura','Barrera','Galvez','2021-08-09',5000.2,0),
 (1007,'Azucena','Sanchez','Lopez','2021-08-09',5000.2,0),
 (1008,'Jose','Serrano','Esparza','2021-08-09',4000.2,0),
 (1009,'Adalberto','Gutierrez','Galvez','2021-08-09',1000.5,0),
 (1001,'Alberto','Gamez','Galvez','2021-08-09',2000.2,0),
 (1002,'Damaris','Gomez','Zaragoza','2021-08-09',2000,0),
 (1003,'Cristina','Lizarraga','Sanchez','2021-08-10',5000,0),
 (1004,'Jesus','Gonzalez','Gamez','2021-08-10',1000,0),
 (1005,'Eustaquio','Aranza','Mercado','2021-08-10',2000,0),
 (1005,'Eustaquio','Aranza','Mercado','2021-08-10',2000,0),
 (1005,'Eustaquio','Aranza','Mercado','2021-08-10',2000,0),
 (1005,'Eustaquio','Aranza','Mercado','2021-08-10',2000,0),
 (1001,'Alberto','Gamez','Galvez','2021-08-11',2000.2,0),
 (1006,'Ana Laura','Barrera','Galvez','2021-08-11',5000.2,0),
 (1007,'Azucena','Sanchez','Lopez','2021-08-11',5000.2,0),
 (1008,'Jose','Serrano','Esparza','2021-08-11',4000.2,0),
 (1009,'Adalberto','Gutierrez','Galvez','2021-08-12',1000.5,0),
 (1000,'Juan','Vazquez','Perez','2021-08-12',4585.2,0),
 (1001,'Alberto','Gamez','Galvez','2021-08-12',2000.2,0),
 (1002,'Damaris','Gomez','Zaragoza','2021-08-12',2000,0),
 (1003,'Cristina','Lizarraga','Sanchez','2021-08-14',5000,0),
 (1004,'Jesus','Gonzalez','Gamez','2021-08-14',1000,0),
 (1005,'Eustaquio','Aranza','Mercado','2021-08-14',2000,0),
 (1005,'Eustaquio','Aranza','Mercado','2021-08-15',2000,0),
 (1005,'Eustaquio','Aranza','Mercado','2021-08-15',2000,0),
 (1005,'Eustaquio','Aranza','Mercado','2021-08-15',2000,0),
 (1001,'Alberto','Gamez','Galvez','2021-08-16',2000.2,0),
 (1006,'Ana Laura','Barrera','Galvez','2021-08-16',5000.2,0),
 (1007,'Azucena','Sanchez','Lopez','2021-08-16',5000.2,0),
 (1008,'Jose','Serrano','Esparza','2021-08-16',4000.2,0),
 (1009,'Adalberto','Gutierrez','Galvez','2021-08-16',1000.5,0),
 (1003,'Cristina','Lizarraga','Sanchez','2021-09-01',5000,0),
 (1004,'Jesus','Gonzalez','Gamez','2021-09-01',1000,0),
 (1005,'Eustaquio','Aranza','Mercado','2021-09-02',2000,0),
 (1005,'Eustaquio','Aranza','Mercado','2021-09-03',2000,0),
 (1005,'Eustaquio','Aranza','Mercado','2021-09-03',2000,0),
 (1005,'Eustaquio','Aranza','Mercado','2021-09-04',2000,0),
 (1001,'Alberto','Gamez','Galvez','2021-09-05',2000.2,0),
 (1006,'Ana Laura','Barrera','Galvez','2021-09-06',5000.2,0),
 (1007,'Azucena','Sanchez','Lopez','2021-09-07',5000.2,0),
 (1008,'Jose','Serrano','Esparza','2021-09-07',4000.2,0),
 (1009,'Adalberto','Gutierrez','Galvez','2021-09-08',1000.5,0);
 
-- seleccionando cobranza
SELECT * FROM cobranza c 
SELECT * FROM cobranza c WHERE idcliente = 1001

-- crear historial cobranza
CREATE TABLE historialcobranza(
idcliente INTEGER,
nombre VARCHAR(45),
apellidopaterno VARCHAR(45),
apellidomaterno VARCHAR(45),
cantidadllamadas INTEGER DEFAULT 0
);

 INSERT INTO historialcobranza (idcliente,nombre,apellidopaterno,apellidomaterno)
  SELECT DISTINCT idcliente,nombre,apellidopaterno,apellidomaterno FROM cobranza
  
  SELECT * FROM historialcobranza ORDER BY idcliente 
  
  UPDATE historialcobranza SET cantidadllamadas=subquery.contador 
	FROM (
		SELECT 
			idcliente,
			COUNT(fechacobro::date) AS contador 
		FROM cobranza GROUP BY 1) AS subquery
	WHERE historialcobranza.idcliente=subquery.idcliente;
	
-- next intro 8