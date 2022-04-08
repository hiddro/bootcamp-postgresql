DROP TABLE IF EXISTS infoestudiante 

--creando la tabla infoestudiante
CREATE  TABLE infoestudiante(
id_estudiante INTEGER,
ciudad VARCHAR(45),
telefono VARCHAR(12),
CONSTRAINT FK_id_estudiante FOREIGN KEY (id_estudiante)
REFERENCES estudiantes(idestudiante)

);

INSERT INTO infoestudiante(id_estudiante,ciudad,telefono)
VALUES(1,'Guadalajara','1242222299'),(2,'Monterrey','7742222299'),
(3,'Hermosillo','7878434323'),(4,'Obregon','8842222299'),
(5,'Guadalajara','8999222299'),(1,'Cd. de Mexico','1242222299');

-- despues del alter esto dara error
SELECT * FROM infoestudiante i 

-- cambiar el nombre de la tabla
ALTER TABLE infoestudiante RENAME TO informacionalumnos

-- seleccionamos informacionalumnos
SELECT * FROM informacionalumnos i 

-- añadiendo columna
-- se usa ADD o ADD COLUMN
ALTER TABLE informacionalumnos ADD columnaprueba VARCHAR(45) 
ALTER TABLE informacionalumnos ADD COLUMN columnaprueba2 VARCHAR(45) 

-- borrar columnas
ALTER TABLE informacionalumnos DROP COLUMN columnaprueba, DROP COLUMN columnaprueba2

-- se puede repetir registros
INSERT INTO informacionalumnos VALUES(1, 'Mochis', '123123123')
INSERT INTO informacionalumnos VALUES(6, 'Mochis', '123123123')

-- agregar primary key, para esto tendriamos que borrar los id duplicados
ALTER TABLE informacionalumnos ADD PRIMARY KEY(id_estudiante)

DELETE FROM informacionalumnos WHERE id_estudiante = 1 AND ciudad = 'Cd. de Mexico';
DELETE FROM informacionalumnos WHERE id_estudiante = 1 AND ciudad = 'Mochis';

-- añadiendo una foreign key fk
ALTER TABLE informacionalumnos ADD FOREIGN KEY(id_estudiante) REFERENCES estudiantes(idestudiante)

-- mostrando la tabla estudiante
SELECT * FROM estudiantes e 

-- al agregar un campo que no existe en la tabla estudiantes despues de crear fk nos impide la creacion
INSERT INTO informacionalumnos VALUES(100, 'Mochis', '123123123')

-- join con group by
SELECT * FROM libros l 

-- agregando mas registros en libros
INSERT INTO libros(codigolibro,titulo, autor,codigoeditorial,precio,cantidad)
VALUES(10018,'Los sueños de Andrea','Borges',238,450,5),
(10019,'Antonieta','Flors',239,200.5,2),
(10020,'Cocinando sueños','De la Rosa',240,100.5,3),
(10021,'El perdedor','Juan Galileo',241,400,4),
(10022,'Doña Juana','Flors',232,500.5,1),
(10023,'Caperuza busa','Camilo Rosas',228,100,1),
(10024,'Es resplandor','Anastacia Arco',226,200.5,1),
(10025,'Volver a comenzar','Cristina Tomás',225,100.5,2),
(10026,'La sonrisa de Amalia','Ana Camello',228,99.9,2),
(10027,'El piano de Jose','Andrés Camareno',229,238.5,4),
(10028,'El huerto del terror','Anastacia Arco',221,200.5,1),
(10029,'El payaso de las tinieblas','María Booleana',221,85.9,null),
(10030,'El bals de la esperanza','Gise Esmeralda',220,600.5,null),
(10031,'Buscando a Hyun',',Marcos Marcos',226,200.5,2),
(10032,'El arcoiris II','Antonio Town',221,800.5,null),
(10033,'Programación en Java a fondo','Mauricio Pérez',227,100.5,null),
(10034,'Calculo I','Lorena Garza',232,200.5,null),
(10035,'Aprender CSS con Flor','Gise Esmeralda',220,600.5,null),
(10036,'MySQL a fondo',',Marcos Marcos',226,200.5,2),
(10037,'Calculo II','Antonio Town',221,800.5,null),
(10038,'Programación en Java a fondo II','Mauricio Pérez',227,100.5,null),
(10039,'Calculo III','Lorena Garza',232,200.5,null);

SELECT * FROM libros ORDER BY codigoeditorial ASC 
SELECT * FROM editorial e 

-- cambiando columna nombre a editorial
ALTER TABLE editorial RENAME COLUMN nombre TO nombreeditorial

-- cuantos libros hay por editorial con nombres join mas group by
-- usando join
SELECT e.nombreeditorial, COUNT(*) AS cantidadporeditorial
FROM editorial e 
JOIN libros l 
ON e.codigo_editorial = l.codigoeditorial 
GROUP BY e.nombreeditorial

-- insertando mas registros en editorial
INSERT INTO editorial VALUES(800,'Los ojos del lector','Tijuana','Baja California'),
(801,'El puerto','Celaya','Guanajuato'),
(802,'El intelectual','Leon','Guanajuato'),
(803,'Cartoons','Mazatlan','Sinaloa'),
(804,'Renacer','Hermosillo','Sonora'),
(805,'La casita del lector','Navojoa','Sonora'),
(806,'La hermosa','Monterrey','Nuevo Leon');

SELECT * FROM libros l WHERE codigoeditorial = 800 OR codigoeditorial = 801

-- usando left join con group by
SELECT l.titulo, l.autor, l.codigoeditorial, e.nombreeditorial 
FROM libros l
JOIN editorial e 
ON l.codigoeditorial = e.codigo_editorial 

-- left join
SELECT l.titulo, l.autor, l.codigoeditorial, e.codigo_editorial, e.nombreeditorial 
FROM editorial e
LEFT JOIN libros l 
ON l.codigoeditorial = e.codigo_editorial 
ORDER BY e.codigo_editorial ASC 

-- DROP TABLE editorial 
-- ver cuantos libros hay por editorial left join y group by
SELECT codigoeditorial, COUNT(codigoeditorial) 
FROM libros l 
GROUP BY codigoeditorial 
ORDER BY codigoeditorial 

SELECT * FROM libros l2 
SELECT * FROM editorial e 

SELECT e.nombreeditorial, COUNT(*)
FROM editorial e 
LEFT JOIN libros l 
ON l.codigoeditorial = e.codigo_editorial 
GROUP BY e.nombreeditorial 

-- left join  editoriales que no tienen libro
SELECT e.codigo_editorial , COUNT(l.codigoeditorial)
FROM editorial e 
LEFT JOIN libros l 
ON l.codigoeditorial = e.codigo_editorial 
GROUP BY e.codigo_editorial 
ORDER BY codigo_editorial 

-- editoriales que tienen libro con JOIN 
SELECT e.codigo_editorial , COUNT(l.codigoeditorial)
FROM editorial e 
JOIN libros l 
ON l.codigoeditorial = e.codigo_editorial 
GROUP BY e.codigo_editorial 
ORDER BY codigo_editorial 

-- drop tabla empleados
SELECT * FROM empleados e 
DROP TABLE empleados  

-- crear tabla empleados migrando datos de excel
CREATE TABLE empleados(
empleadoid INTEGER,
nombre VARCHAR(45),
apellidopaterno VARCHAR(45),
apellidomaterno VARCHAR(45),
edad INTEGER,
telefono BIGINT,
sueldo DECIMAL(8,2),
puesto VARCHAR(45)
);

-- copiar registros de una tabla excel csv a una tabla en postgresql
COPY empleados FROM 'C:/registros/employees.csv' HEADER CSV DELIMITER ','

-- next intro 6