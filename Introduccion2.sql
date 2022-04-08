-- dropear una tabla y una condicional si es que no existe
DROP TABLE clientes,alumnos 
DROP TABLE IF EXISTS tabla1

SELECT * FROM empleados e 

-- actualizar una columna de una tabla sin el where se cambia todas las columnas
UPDATE empleados SET nombre = 'Edu'

-- seleccionar clientes
SELECT * FROM clientes c

-- actualizar columna de una tabla con where cambia especificamente
UPDATE clientes SET idcliente = 1015 WHERE nombre = 'Daniel' AND apellidopaterno = 'Esparza' AND apellidomaterno = 'Suarez'
UPDATE clientes SET ciudad = 'Guadalajara' ,estado = 'Jalisco' WHERE idcliente = 1000
UPDATE clientes SET nombre = 'Florentina Celeste' ,apellidomaterno = 'Espinoza' WHERE idcliente = 1012

-- ordenar por idcliente ascendeteASC y descendente DESC 
SELECT * FROM clientes c ORDER BY idcliente
SELECT * FROM clientes c2 ORDER BY idcliente DESC 
SELECT * FROM clientes c2 ORDER BY totaldeuda DESC 

-- ordenar y no repetir los mismos montos 
SELECT totaldeuda FROM clientes c 
SELECT DISTINCT totaldeuda FROM clientes c 
SELECT DISTINCT totaldeuda FROM clientes c2 ORDER BY totaldeuda DESC 
SELECT DISTINCT totaldeuda FROM clientes c2 ORDER BY totaldeuda ASC  


-- crear tabla Personas
CREATE TABLE personas(
dni VARCHAR(8),
nombre VARCHAR(45),
apellidopaterno VARCHAR(45),
apellidomaterno VARCHAR(45),
fechanacimiento DATE,
municipio VARCHAR(45),
estado VARCHAR(45),
telefono VARCHAR(12),
sexo CHARACTER(1)
);


INSERT INTO personas(dni,nombre,apellidopaterno,apellidomaterno,fechanacimiento,municipio,estado,telefono,sexo)
 VALUES('100012A','Juan','Vazquez','Perez','2020-05-08','Guadalajara', 'Jalisco','1234564343','M'),
('1001B12','Juan','Vazquez','Perez','2021-02-08','Merida','Yucatan','1234564348','M'),
('1002W12','Carlos Miguel','Lopez','Perez','2020-03-15','Morelia','Michoacan','1234564349','M'),
('1003Q43','Maria Carlota','SAnchez','Perez','2018-02-02','Guasave','Sinaloa','1234564322','F'),
('1004S23','Casandra','Gavilan','Gonzalez','2021-07-25','Monterrey','Nuevo Leon','1234564335','F'),
('1005F32','Andrea','Davila','Antonios','2018-06-02','Guadalajara','Jalisco','1234564326','F'),
('1006H78','Joao','Aguiar','Garza','2015-03-15','Morelia','Michoacan','1234564327','M'),
('1007Y54','Daniel','Zambrano','Espino','2015-07-18','Toluca','Estado de Mexico','1234564328','M'),
('1008W43','Flor','Velazquez','Espinoza','2017-02-08','Guadalajara','Jalisco','1234564345','F'),
('1009W23','Celeste','Vazquez','De la O','2015-08-22','Tijuana','Baja California','1234564385','F'),
('1010W12','Abigail','Andrade','Beltran','2020-05-12','Guadalajara','Jalisco','1234564373','F'),
('1011Q25','Juan Carlos','Espinoza','Campos','2020-05-15','Tijuana','Baja California','1234564399','M'),
('1012W25','Dionicio','Espino','Espinoza','2021-06-15','Guadalajara','Jalisco','1234564398','F'),
('1013Q45','Jose Carlos','Flores','Garcia','2021-07-17','Guasave','Sinaloa','1234564390','M'),
('1014Y59','Jose Pedro','Valle','Perez','2021-08-01','Mazatlan','Sinaloa','1234564312','M'),
('1015P45','Miguel Luis','Flores','Sanchez','2021-01-15','Monterrey','Nuevo Leon','1234564315','M'),
('1016H89','JoseMarcelo','Gonzalez','Miranda','2018-05-12','Guadalajara','Jalisco','1234564222','M'),
('1017278','Flor Estela','Huerta','Espinosa','2018-07-09','Guadalajara','Jalisco','1234564555','F'),
('1018Q34','Cristian Jesus','Kilberth','Perez','2018-01-08','Ensenada','Baja California','1234564532','F'),
('1019W47','Maria Cecilia','Lopez','Lopez','2045-07-28','Guadalajara','Jalisco','1234564145','F'),
('1020P30','Juan Alberto','Martinez','Vazquez','2016-07-22','Guadalajara','Jalisco','1234564142','M'),
('1021Q25','Franchesco Daniel','Nunez','Perez','2017-07-15','Puerto Vallarta','Jalisco','1234564248','M'),
('1022F78','Laura','Quinonez','Garcia','2020-02-08','Puebla','Puebla','1234564788','F');

-- seleccionar personas
SELECT * FROM personas

-- seleccionar usando contador
SELECT COUNT(*) FROM personas 

-- agrupar varones y mujeres el primero no especifica el segundo si lo hace
SELECT COUNT(*) FROM personas GROUP BY sexo
-- el count aparece normal
SELECT sexo, COUNT(*) FROM personas GROUP BY sexo
-- el count personalizado con el AS 
SELECT sexo, COUNT(*) AS cantporsexo FROM personas GROUP BY sexo

SELECT estado, COUNT(*) FROM personas p GROUP BY estado 
SELECT * FROM personas p2 WHERE estado = 'Jalisco'

-- crear tabla libros
DROP TABLE IF EXISTS libros

CREATE TABLE libros(
codigolibro INTEGER,
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

-- seleccionar tabla libros
SELECT * FROM libros l 

-- agrupar libros
SELECT nombreeditorial, COUNT(*) AS cantidad  FROM libros l GROUP BY nombreeditorial  
SELECT * FROM libros l2 WHERE nombreeditorial = 'Mexico'

-- calcular el precio mayor y menor de una editorial
SELECT nombreeditorial, MAX(precio) AS preciomayor FROM libros l GROUP BY nombreeditorial 
SELECT nombreeditorial, MIN(precio) AS preciomenor FROM libros l2 GROUP BY nombreeditorial 
SELECT nombreeditorial, MAX(precio) AS preciomayor, MIN(precio) AS preciomenor FROM libros l2 GROUP BY nombreeditorial 
SELECT nombreeditorial, COUNT(*) AS cantidad, MAX(precio) AS preciomayor, MIN(precio) AS preciomenor FROM libros l2 GROUP BY nombreeditorial

-- rango de precio con agrupacion
SELECT nombreeditorial, COUNT(*) FROM libros WHERE precio BETWEEN 100 AND 300 GROUP BY nombreeditorial 
SELECT * FROM libros l WHERE nombreeditorial = 'España'

-- agrupar por el nombre y por el precio mas nombre esto dara que aparezcan todos los libros del count
SELECT nombreeditorial, precio, titulo, COUNT(*) FROM libros l WHERE precio BETWEEN 100 AND 300 GROUP BY nombreeditorial, precio, titulo


-- primmary KEY
SELECT * FROM libros l 
SELECT * FROM libros l3 WHERE codigolibro = 10001
SELECT * FROM libros l2 ORDER BY codigolibro 
SELECT * FROM libros l WHERE codigolibro = 10015

INSERT INTO libros VALUES (10001, 'La Casona Demoniaca', 'Edward', 'El buen lector', 450, 2);
INSERT INTO libros VALUES (10001, 'Payaso Amable', 'Edward', 'El buen lector', 480, 1);
INSERT INTO libros VALUES (10001, 'Volver a amanecer', 'Cristina Fuentes', 'España', 500, 1);

-- o otra manera para el INSERT
INSERT INTO libros (codigolibro, titulo, autor, nombreeditorial, precio, cantidad) VALUES
(10001, 'La Casona Demoniaca', 'Edward', 'El buen lector', 450, 2),
(10001, 'Payaso Amable', 'Edward', 'El buen lector', 480, 1),
(10001, 'Volver a amanecer', 'Cristina Fuentes', 'España', 500, 1)

-- next intro 3