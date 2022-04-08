-- Creacion Tabla Empleados
create table empleados(
	numemp integer,
	nombre varchar(45),
	apellidopat varchar(45),
	apellidomat varchar(45),
	fechanac date,
	sueldo decimal(7,2),
	puesto varchar(45)
);

-- Seleccionar Tabla Empleados
select * from empleados

select nombre, apellidopat, sueldo from empleados

-- Insertar Datos Tabla Empleados
insert into empleados(numemp ,nombre, apellidopat, apellidomat, fechanac, sueldo, puesto)
values(1, 'Edward', 'Cordova', 'Chavez', '1993-03-10' ,5250.8, 'Developer Java'),
(2, 'Cristina' ,'Fuentes', 'Mejia' ,'1995-03-20' ,4150.2, 'Comunicadora Audiovisual'),
(3, 'Gaston' ,'Llanos', 'Camones' ,'1992-01-18' ,2150.5, 'Entrenador de Basket')

--Nuevo Script Alumnos
CREATE TABLE alumnos(
numcontrol BIGINT,
nombre VARCHAR(45),
apellidopaterno VARCHAR(45),
apellidomaterno VARCHAR(45),
fechaingreso DATE,
fechanac DATE,
telefono VARCHAR(12),
carrera VARCHAR(45),
promedio DECIMAL(6,2)
);



INSERT INTO alumnos(numcontrol,nombre,apellidopaterno,apellidomaterno,fechaingreso,fechanac,telefono,carrera,promedio)
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

-- Seleccionar Alumnos
select * from alumnos
select * from alumnos where promedio <= 90
select * from alumnos where promedio >= 90

select nombre ,apellidopaterno ,apellidomaterno ,carrera, promedio from alumnos a 
select nombre ,apellidopaterno ,apellidomaterno ,carrera, promedio from alumnos a where promedio <= 90
SELECT nombre ,apellidopaterno ,apellidomaterno ,carrera, promedio FROM alumnos a WHERE promedio >= 90

-- concatenacion y agregar alias
SELECT nombre||' '||apellidopaterno||' '||apellidomaterno AS nombrecompleto, carrera, promedio FROM alumnos a WHERE promedio <= 90

-- multi condiciones
SELECT * FROM alumnos a WHERE promedio < 90 AND carrera = 'Ingenieria en Sistemas'
SELECT * FROM alumnos a2 WHERE carrera = 'Ingenieria en Sistemas' AND carrera = 'Contabilidad'
SELECT * FROM alumnos a2 WHERE carrera = 'Ingenieria en Sistemas' OR carrera = 'Contabilidad'

-- esto muestra los que pertenecen a la carrera ing sistemas
SELECT * FROM alumnos a2 WHERE carrera = 'Ingenieria en Sistemas'

-- esto es para los que no estan en ing sistemas
SELECT * FROM alumnos a WHERE NOT carrera = 'Ingenieria en Sistemas'

-- Clientes
CREATE TABLE clientes(
	idcliente INTEGER,
	nombre VARCHAR(45),
	apellidopaterno VARCHAR(45),
	apellidomaterno VARCHAR(45),
	telefono VARCHAR(12),
	ciudad VARCHAR(45),
	estado VARCHAR(45),
	totaldeuda DECIMAL(8,2),
	tipocliente CHARACTER(1)
	);
	
	INSERT INTO clientes VALUES(1000,'Alberto','Esparza','Suarez','2222222222','Mochis','Sinaloa',8000,'A'),
	(1001,'Alberto','Gomez','Perez','2222222222','Mochis','Sinaloa',8000,'A'),
	(1002,'Juan Jose','Sanchez','Guerra','2222222222','Mazatlan','Sinaloa',15000,'A'),
	(1003,'Maria Antonia','Lopez','Gamez','2222222222','Guasave','Sinaloa',2500,'B'),
	(1004,'Luis Roman','Espino','Garza','2222222222','Guadalajara','Jalisco',1000,'A'),
	(1005,'Ana Estela','Juarez','Lima','2222222222','Mochis','Sinaloa',250.4,'C'),
	(1006,'Jose','Esparza','Suarez','2222222222','Guadalajara','Jalisco',800,'A'),
	(1007,'Alberto','Flores','Gonzalez','2222222222','Tijuana','Baja California',1500,'B'),
	(1008,'Luis Pedro','Higo','Suarez','2222222222','Tijuana','Baja California',1000,'A'),
	(1009,'Jose Carlos','Mendoza','Lopez','2222222222','Ensenada','Baja California',4500,'A'),
	(1010,'Maria Laura','Puga','Gomez','2222222222','Mochis','Sinaloa',2000,'A'),
	(1011,'Sasha','Lopez','Quintana','2222222222','Puerto Vallarta','Jalisco',1500,'B'),
	(1012,'Flor Celeste','Ramos','Espino','2222222222','Veracruz','Veracruz',8000,'A'),
	(1013,'Jose Alberto','Sosa','Flores','2222222222','Acapulco','Guerrero',8000,'B'),
	(1014,'Luis Miguel','Beltran','Gamez','2222222222','Mochis','Sinaloa',4000.2,'A'),
	(1014,'Daniel','Esparza','Suarez','2222222222','Mochis','Sinaloa',12000,'C');

-- seleccionar clientes
SELECT * FROM clientes c

-- clientes estado sinaloa y total deuda es igual >= 10000
SELECT * FROM clientes cs WHERE estado = 'Sinaloa' AND totaldeuda >= 10000

-- clientes tipo cliente es tipo A y total deuda es >= 5000
SELECT * FROM clientes c WHERE tipocliente = 'A' AND totaldeuda >= 5000

-- clientes estado sinaloa, tipo A y total deuda es >= 5000
SELECT * FROM clientes c WHERE tipocliente = 'A' AND totaldeuda >= 5000 AND estado = 'Sinaloa'

-- clientes estado sinaloa, tipo A o C y total deuda es >= 5000

-- selecciona ciudad
SELECT * FROM clientes c WHERE ciudad = 'Mochis'

-- selecciona ciudad y estado sinaloa
SELECT * FROM clientes c WHERE ciudad = 'Mochis' AND estado ='Sinaloa'

-- borra toda la tabla
SELECT * FROM clientes c 
DELETE FROM clientes 

SELECT * FROM alumnos a 
DELETE FROM alumnos a2 WHERE numcontrol  = 1000
DELETE FROM alumnos a3 WHERE nombre = 'Juan' AND apellidopaterno = 'Vazquez' AND apellidomaterno = 'Perez'
DELETE FROM alumnos a4 WHERE promedio < 90
DELETE FROM alumnos a5 WHERE promedio >= 90 AND promedio < 95
DELETE FROM alumnos WHERE promedio BETWEEN 95 AND 99

--Next Intro2