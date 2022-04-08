DROP TABLE IF EXISTS libros 

CREATE TABLE libros(
codigolibro INTEGER PRIMARY KEY,
titulo VARCHAR(40),
autor VARCHAR(30),
nombreeditorial VARCHAR(45),
precio DECIMAL(5,2),
cantidad SMALLINT
);

INSERT INTO libros(codigolibro,titulo, autor,nombreeditorial,precio,cantidad)
VALUES(10001,'El lago','Gil Gamez','El buen lector',850,4),
(10002,'El conejito','Flors','Libro abierto',200.5,2),
(10003,'El elefante','De la Rosa','Mexico',100.5,3),
(10004,'Sor Juana','Juan Galileo','1998',400,4),
(10005,'La Bella','Flors','El lago',500.5,1),
(10006,'Los zapatos de Juana','Flors','La esperanza',100,1),
(10007,'Tasa de café','Anastacia Arco','Forever',200.5,1),
(10008,'Los pecesitos','Cristina Tomás','El buen lector',100.5,2),
(10009,'El sueño dorado','Ana Camello','Mexico',99.9,2),
(10010,'Andrés','Andrés Camareno','Mexico',200.5,4),
(10011,'Tasa de café 2','Anastacia Arco','España',200.5,1),
(10012,'LA tortuga','María Booleana','El buen lector',85.9,null),
(10013,'a felicidad','Gise Esmeralda','Libro abierto',600.5,null),
(10014,'Encontrando a Nemo','Marcos Marcos','Mexico',200.5,2),
(10015,'El arcoiris','Antonio Town','El buen lector',800,null),
(10016,'Programación web extensa','Mauricio Pérez','España',100.5,null),
(10017,'Sin ti','Lorena Garza','Forever',400,null),
(10019,'Antonieta','Flors','El buen lector',200.5,2),
(10020,'Cocinando sueños','De la Rosa','Mexico',100.5,3),
(10021,'El perdedor','Juan Galileo','Mexico',400,4),
(10022,'Doña Juana','Flors','Forever',500.5,1),
(10023,'Caperuza busa','Camilo Rosas','España',100,1),
(10024,'Es resplandor','Anastacia Arco','Mexico',200.5,1),
(10025,'Volver a comenzar','Cristina Tomás','1998',100.5,2),
(10026,'La sonrisa de Amalia','Ana Camello','Esperanza',99.9,2),
(10027,'El piano de Jose','Andrés Camareno','El buen lector',238.5,4),
(10028,'El huerto del terror','Anastacia Arco','Mexico',200.5,1),
(10029,'El payaso de las tinieblas','María Booleana','El buen lector',85.9,null),
(10030,'El bals de la esperanza','Gise Esmeralda','Mexico',600.5,null),
(10031,'Buscando a Hyun','Marcos Marcos','España',520,2),
(10032,'El arcoiris II','Antonio Town','Mexico',800.5,null),
(10033,'Programación en Java a fondo','Mauricio Pérez','España',100.5,null),
(10034,'Calculo I','Lorena Garza','España',150,null),
(10035,'Aprender CSS con Flor','Gise Esmeralda','Esperanza',600.5,null),
(10036,'MySQL a fondo','Marcos Marcos','Libro abierto',200.5,2),
(10037,'Calculo II','Antonio Town','Mexico',800.5,null),
(10038,'Programación en Java a fondo II','Mauricio Pérez','Mexico',100.5,null),
(10039,'Calculo III','Lorena Garza','El pueblo',200.5,null);

-- seleccionar libros
SELECT * FROM libros l 
-- saldra error al crear un registro con la misma llave
INSERT INTO libros VALUES (10040, 'Payaso Amable', 'Edward', 'El buen lector', 480, 1);

-- crear tabla cliente y pedido
--relacion 1 a muchos
CREATE TABLE pedidos(
    idpedido INTEGER PRIMARY KEY,
    idcliente INTEGER,
	descripcion VARCHAR(100),
	fecha DATE
   --CONSTRAINT FK_id_pedidos FOREIGN KEY (idcliente)
   -- REFERENCES clientes(idcliente)
);
CREATE TABLE clientes(
    idcliente INTEGER,
	nombre VARCHAR(45),
    apellidopaterno VARCHAR(45),
	apellidomaterno VARCHAR(45),
	telefono VARCHAR(45),
	PRIMARY KEY(idcliente)
  
);

DROP TABLE IF EXISTS clientes

SELECT * FROM clientes c 
SELECT * FROM pedidos p 

INSERT INTO clientes(idcliente,nombre,apellidopaterno,apellidomaterno,telefono)
VALUES (1001,'Alberto','Gomez','Perez','2222222222'),
	(1002,'Juan Jose','Sanchez','Guerra','4822222222'),
	(1003,'Maria Antonia','Lopez','Gamez','2277222222'),
	(1004,'Luis Roman','Espino','Garza','2222262222'),
	(1005,'Ana Estela','Juarez','Lima','2222224522'),
	(1006,'Jose','Esparza','Suarez','2222223822'),
	(1007,'Alberto','Flores','Gonzalez','2222289222'),
	(1008,'Luis Pedro','Higo','Suarez','22222423222'),
	(1009,'Jose Carlos','Mendoza','Lopez','2222125222'),
	(1010,'Maria Laura','Puga','Gomez','2222267422'),
	(1011,'Sasha','Lopez','Quintana','2222267422'),
	(1012,'Flor Celeste','Ramos','Espino','2228832222'),
	(1013,'Jose Alberto','Sosa','Flores','2222888222'),
	(1014,'Luis Miguel','Beltran','Gamez','2222211122'),
	(1015,'Daniel','Esparza','Suarez','2222220002');
	
	INSERT INTO pedidos(idpedido,idcliente,descripcion,fecha)
	VALUES(1,'1015','8 Kg de carne para asar','2021-09-01'),
	(2,'1012','12 Kg queso fresco','2021-09-01'),
	(3,'1001','6 Kg de carne para bictec','2021-09-02'),
	(4,'1001','1 Kg de asaderar','2021-09-02'),
	(5,'1002','4 Kg de queso crema','2021-09-02'),
	(6,'1011','4 L de crema','2021-09-03'),
	(7,'1012','1 Kg de carne para asar','2021-09-03'),
	(8,'1013','2 Kg de carne para asar','2021-09-03'),
	(9,'1008','8 Kg de carne para asar','2021-09-04'),
	(10,'1008','1 de asadera','2021-09-05'),
	(11,'1001','4 Kg de manteca de cerdo','2021-09-06'),
	(12,'1002','2 Kg mantequilla','2021-09-06'),
	(13,'1002','12 Kg de carne para bictec','2021-09-07'),
	(14,'1009','4 Kg de pata de puerco','2021-09-08'),
	(15,'1012','8 Kg de carne de puerco','2021-09-08'),
	(16,'1015','15 Kg de cabeza de res','2021-09-09'),
	(17,'1012','2 Kg de carne para asar','2021-09-10'),
	(18,'1012','1 Kg de carne para asar','2021-09-12');
	
-- join - innerjoin = unida con la tabla
SELECT * FROM clientes c 
SELECT * FROM pedidos p 

SELECT p.idpedido, p.descripcion, c.idcliente, c.nombre, c.apellidopaterno
FROM clientes c 
INNER JOIN pedidos p 
ON c.idcliente = p.idcliente 

-- relacion 1 a 1
CREATE TABLE estudiantes(
idestudiante INTEGER PRIMARY KEY,
apellidos VARCHAR(45),
nombre VARCHAR(45)
);
CREATE  TABLE infoestudiante(
id_estudiante INTEGER PRIMARY KEY,
ciudad VARCHAR(45),
telefono VARCHAR(12),
CONSTRAINT FK_id_estudiante FOREIGN KEY (id_estudiante)
REFERENCES estudiantes(idestudiante)

);

INSERT INTO estudiantes(idestudiante,apellidos,nombre)
VALUES(1,'Gomez Perez','Juan'),(2,'Gonzalez Sazueta','Carlos'),
(3,'Sanchez Ortiz','Cecilia'),(4,'Camello Perez','Carlos'),
(5,'Gamez Hoya','Ana Maria'),(6,'Delfin Garza','Jose');

INSERT INTO infoestudiante(id_estudiante,ciudad,telefono)
VALUES(1,'Guadalajara','1242222299'),(2,'Monterrey','7742222299'),
(3,'Hermosillo','7878434323'),(4,'Obregon','8842222299'),
(5,'Guadalajara','8999222299'),(6,'Cd. de Mexico','1242222299');

-- seleccionar estudiantes e infoestudiantes
SELECT * FROM estudiantes e 
SELECT * FROM infoestudiante i 

-- error porque no existe
INSERT INTO estudiantes VALUES (2, 'Cordova', 'Edward');
INSERT INTO infoestudiante VALUES (100, 'Casma', '983478763');

-- si existiera 
INSERT INTO estudiantes VALUES (8, 'Cordova', 'Edward');
INSERT INTO infoestudiante VALUES (8, 'Casma', '983478763');

-- obtniendo union de ambas tablas estudiantes con infoestudiante
SELECT * 
FROM estudiantes e 
INNER JOIN infoestudiante i 
ON e.idestudiante = i.id_estudiante 

-- next intro 4