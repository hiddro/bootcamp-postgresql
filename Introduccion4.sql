SELECT * FROM clientes c 
SELECT * FROM pedidos p 

-- join unimos dos tablas
SELECT * FROM clientes c 
JOIN pedidos p 
ON c.idcliente = p.idcliente 

-- otros tipos de JOIN para unir con libros
DROP TABLE IF EXISTS libros

-- creamos tabla libros
CREATE TABLE libros(
codigolibro INTEGER,
titulo VARCHAR(40),
autor VARCHAR(30),
codigoeditorial INTEGER,
precio DECIMAL(5,2),
cantidad SMALLINT,
			
PRIMARY KEY(codigolibro)
);
INSERT INTO libros(codigolibro,titulo, autor,codigoeditorial,precio,cantidad)
VALUES(10001,'el aleph','Borges',220,450,5),
(10002,'El conejito','Flors',221,200.5,2),
(10003,'El elefante','De la Rosa',222,100.5,3),
(10004,'Sor Juana','Juan Galileo',223,400,4),
(10005,'La Bella','Flors',224,500.5,1),
(10006,'Los zapatos de Juana','Camilo Rosas',225,100,1),
(10007,'Tasa de café','Anastacia Arco',226,200.5,1),
(10008,'Los pecesitos','Cristina Tomás',227,100.5,2),
(10009,'El sueño dorado','Ana Camello',228,99.9,2),
(10010,'Andrés','Andrés Camareno',229,200.5,4),
(10011,'Tasa de café 2','Anastacia Arco',230,200.5,1),
(10012,'LA tortuga','María Booleana',231,85.9,null),
(10013,'a felicidad','Gise Esmeralda',232,600.5,null),
(10014,'Encontrando a Nemo',',Marcos Marcos',233,200.5,2),
(10015,'El arcoiris','Antonio Town',234,800.5,null),
(10016,'Programación web extensa','Mauricio Pérez',235,100.5,null),
(10017,'Sin ti','Lorena Garza',236,200.5,null);

-- creamos tabla editorial
CREATE TABLE editorial(
codigo_editorial INTEGER,
nombre VARCHAR(45),
ciudad VARCHAR(45),
estado VARCHAR(45)
);

INSERT INTO editorial VALUES(220,'Mexico','Tijuana','Baja California'),
(221,'El buen lector','Celaya','Guanajuato'),
(222,'El capricho','Leon','Guanajuato'),
(223,'Forever 89','Mazatlan','Sinaloa'),
(224,'1950','Hermosillo','Sonora'),
(225,'Violeta','Navojoa','Sonora'),
(226,'Esperanza','Monterrey','Nuevo Leon'),
(227,'La luna','Monterrey','Nuevo Leon'),
(228,'Horizonte del mañana','Puebla','Puebla'),
(229,'Las flores','Guadalajara','Jalisco'),
(230,'Renacer','Puerto Vallarta','Jalisco'),
(231,'Celeste','Tepic','Nayarit'),
(232,'Antonios','Guadalajara','Jalisco');

-- seleccionamos libros y editorial
SELECT * FROM libros l 
SELECT * FROM editorial e 

-- uniendo tabla libros con editorial
SELECT l.titulo, l.autor, l.codigoeditorial, e.nombre, e.ciudad, e.estado  FROM libros l 
JOIN editorial e 
ON l.codigoeditorial  = e.codigo_editorial 

-- otros tipos de JOIN 
--insertamos mas datos a editorial
INSERT INTO editorial VALUES(233,'Madrid','Tijuana','Baja California'),
(234,'Paris','Mexicali','Baja California'),
(235,'California','Monterrey','Nuevo Leon'),
(236,'Monterrey','Monterrey','Nuevo Leon'),
(237,'Editorial Castellana','Guadalajara','Jalisco'),
(238,'La aventura lectora','Monterrey','Nuevo Leon');

INSERT INTO editorial VALUES(800,'Los ojos del lector','Tijuana','Baja California'),
(801,'El puerto','Celaya','Guanajuato'),
(802,'El intelectual','Leon','Guanajuato'),
(803,'Cartoons','Mazatlan','Sinaloa'),
(804,'Renacer','Hermosillo','Sonora'),
(805,'La casita del lector','Navojoa','Sonora'),
(806,'La hermosa','Monterrey','Nuevo Leon');

SELECT * FROM libros l 
SELECT * FROM editorial e 

SELECT * FROM libros WHERE codigoeditorial  = 800

-- left join ayuda a poder saber en que edit no tienen libros
-- poder averiguar que registros de una tabla no se encuentran en otras tablas 
-- left join uniendo a la izquierda, por eso se pone editorial primero se usa para coincidir registros de una tabla izq con otra tabla der
SELECT * FROM editorial e 
LEFT JOIN libros l 
ON e.codigo_editorial = l.codigoeditorial 
ORDER BY e.codigo_editorial 

-- creando tabla empleados y puestos
DROP TABLE IF EXISTS empleados

CREATE TABLE empleados(
idempleado INTEGER PRIMARY KEY,
nombre VARCHAR(45),
puestoid INTEGER
);

CREATE TABLE puestos(
puestoid INTEGER PRIMARY KEY,
nombrepuesto VARCHAR(45)
);

INSERT INTO empleados VALUES(1000,'Juan',1);
INSERT INTO empleados VALUES(1001,'Jose',1);
INSERT INTO empleados VALUES(1002,'Daniel',4);
INSERT INTO empleados VALUES(1003,'Laura',2);
INSERT INTO empleados VALUES(1004,'Carlos',1);
INSERT INTO empleados VALUES(1005,'Daniel',1);
INSERT INTO empleados VALUES(1006,'Luna',3);
INSERT INTO empleados VALUES(1007,'Oscar',5);
INSERT INTO empleados VALUES(1008,'Joao',6);
INSERT INTO empleados VALUES(1009,'Gabriel',7);
INSERT INTO empleados VALUES(1010,'Pedro',7);
INSERT INTO empleados VALUES(1011,'Jesus',2);
INSERT INTO empleados VALUES(1012,'Linda',6);
INSERT INTO empleados VALUES(1013,'Ana',7);
INSERT INTO empleados VALUES(1014,'Maria',7);
INSERT INTO empleados VALUES(1015,'Jose Carlos',2);

INSERT INTO puestos VALUES(1,'Limpieza');
INSERT INTO puestos VALUES(2,'Secretaria');
INSERT INTO puestos VALUES(3,'Cajera');
INSERT INTO puestos VALUES(4,'Facturista');
INSERT INTO puestos VALUES(5,'Capturista');
INSERT INTO puestos VALUES(6,'Contador');
INSERT INTO puestos VALUES(7,'RH');
INSERT INTO puestos VALUES(8,'Gerente');
INSERT INTO puestos VALUES(9,'Subgerente');
INSERT INTO puestos VALUES(10,'Jardinero');
INSERT INTO puestos VALUES(11,'Office boy');
INSERT INTO puestos VALUES(12,'Cocinero personal');

-- seleccionamos empleados y puestos
SELECT * FROM empleados e 
SELECT * FROM puestos p

-- saber los puestos con empleados inner join la union
SELECT * FROM empleados e 
JOIN puestos p 
ON e.puestoid = p.puestoid 

-- cuales puestos no tienen empleados
SELECT * FROM puestos p 
LEFT JOIN empleados e 
ON p.puestoid = e.puestoid 
ORDER BY p.puestoid ASC 

-- insertamos mas datos en empleados
INSERT INTO empleados VALUES(1016, 'Sandra', 15),
(1017, 'Ismael', 15),
(1018, 'Jonas', 15),
(1019, 'Lorena', 13),
(1020, 'Yuridia', 14)

SELECT * FROM empleados e ORDER BY idempleado ASC 
SELECT * FROM puestos p WHERE puestoid = 13 OR puestoid = 14 OR puestoid =15

-- el left join al revez del arriba la tabla izqueirda es empleados
-- 
SELECT * FROM empleados e
LEFT JOIN puestos p 
ON e.puestoid = p.puestoid 
ORDER BY e.idempleado ASC 

-- usando RIGHT JOIN 
-- se le da prioridad a la tabla puestos osea a la tabla derecha
SELECT * FROM empleados e
RIGHT JOIN puestos p 
ON e.puestoid = p.puestoid 
ORDER BY p.puestoid ASC

-- se le da prioridad a la tabla empleado
SELECT * FROM puestos p
RIGHT JOIN empleados e  
ON e.puestoid = p.puestoid 
ORDER BY e.idempleado ASC

-- se le da prioridad tabla empleados
SELECT e.idempleado, p.puestoid, p.nombrepuesto
FROM empleados e 
LEFT JOIN puestos p 
ON e.puestoid = p.puestoid 
ORDER BY e.idempleado 

-- prioridad tabla puestos
SELECT e.idempleado, p.puestoid, p.nombrepuesto
FROM empleados e 
RIGHT JOIN puestos p 
ON e.puestoid = p.puestoid 
ORDER BY p.puestoid 

-- next intro 5