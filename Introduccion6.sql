-- seleccionamos puesto
SELECT DISTINCT puesto FROM empleados
DROP TABLE puestos

--creando tabla puesto 
-- creando una tabla a partir de otra tabla
CREATE TABLE puestos
AS SELECT DISTINCT puesto
FROM empleados 

SELECT * FROM puestos

-- crear una tabla vendedores de los puestos vendedores en empleados
SELECT * FROM empleados e WHERE puesto = 'Vendedor'

CREATE TABLE vendedores
AS SELECT DISTINCT nombre, apellidopaterno, apellidomaterno, edad, telefono, sueldo
FROM empleados e 
WHERE puesto = 'Vendedor'

--creando tabla rangoa a partir de empleados con sueldo mayor a 5000
SELECT * FROM vendedores
SELECT * FROM empleados e WHERE sueldo >= 5000

CREATE TABLE rangoa
AS SELECT nombre, apellidopaterno, apellidomaterno, edad, sueldo, puesto
FROM empleados e 
WHERE sueldo >= 5000

SELECT * FROM rangoa

-- creando tabla a partir de otras usando join
SELECT * FROM vendedores v 

--creando tabla vendedor
CREATE TABLE vendedor(
id INTEGER,
nombre VARCHAR(45),
apellidopaterno VARCHAR(45),
apellidomaterno VARCHAR(45),
antiguedad DATE,
ciudad VARCHAR(45),
estado VARCHAR(45),
telefono VARCHAR(12)

);


INSERT INTO vendedor(id,nombre,apellidopaterno,apellidomaterno,antiguedad,ciudad,
estado,telefono) VALUES(1000,'Juan','Vazquez','Perez','2020-05-08','Guadalajara','Jalisco',
'1234564343'),(1001,'Juan','Vazquez','Perez','2021-02-08','Merida','Yucatan',
'1234564348'),(1002,'Carlos Miguel','Lopez','Perez','2020-03-15','Morelia','Michoacan',
'1234564349'),(1003,'Maria Carlota','SAnchez','Perez','2018-02-02','Guasave','Sinaloa',
'1234564322'),(1004,'Casandra','Gavilan','Gonzalez','2021-07-25','Monterrey','Nuevo Leon',
'1234564335'),(1005,'Andrea','Davila','Antonios','2018-06-02','Guadalajara','Jalisco',
'1234564326'),(1006,'Joao','Aguiar','Garza','2015-03-15','Morelia','Michoacan',
'1234564327'),(1007,'Daniel','Zambrano','Espino','2015-07-18','Toluca','Estado de Mexico',
'1234564328'),(1008,'Flor','Velazquez','Espinoza','2017-02-08','Guadalajara','Jalisco',
'1234564345'),(1009,'Celeste','Vazquez','De la O','2015-08-22','Tijuana','Baja California',
'1234564385'),(1010,'Abigail','Andrade','Beltran','2020-05-12','Guadalajara','Jalisco',
'1234564373'),(1011,'Juan Carlos','Espinoza','Campos','2020-05-15','Tijuana','Baja California',
'1234564399'),(1012,'Dionicio','Espino','Espinoza','2021-06-15','Guadalajara','Jalisco',
'1234564398'),(1013,'Jose Carlos','Flores','Garcia','2021-07-17','Guasave','Sinaloa',
'1234564390'),(1014,'Jose Pedro','Valle','Perez','2021-08-01','Mazatlan','Sinaloa',
'1234564312'),(1015,'Miguel Luis','Flores','Sanchez','2021-01-15','M;onterrey','Nuevo Leon',
'1234564315'),(1016,'JoseMarcelo','Gonzalez','Miranda','2018-05-12','Guadalajara','Jalisco',
'1234564222'),(1017,'Flor Estela','Huerta','Espinosa','2018-07-09','Guadalajara','Jalisco',
'1234564555'),(1018,'Cristian Jesus','Kilberth','Perez','2018-01-08','Ensenada','Baja California',
'1234564532'),(1019,'Maria Cecilia','Lopez','Lopez','2045-07-28','Guadalajara','Jalisco',
'1234564145'),(1020,'Juan Alberto','Martinez','Vazquez','2016-07-22','Guadalajara','Jalisco',
'1234564142'),(1021,'Franchesco Daniel','Nunez','Perez','2017-07-15','Puerto Vallarta','Jalisco',
'1234564248'),(1022,'Laura','Quinonez','Garcia','2020-02-08','Puebla','Puebla',
'1234564788');

-- creando tabla sucursales
CREATE TABLE sucursales(
  
  municipio varchar(45),
  estado varchar(45),
  numsucursal INTEGER
  );
  INSERT INTO sucursales(municipio,estado,numsucursal)
  VALUES('Guadalajara','Jalisco',1),
  ('Merida','Yucatan',7),
  ('Morelia','Michoacan',4),
  ('Guasave','Sinaloa',5),
  ('Monterrey','Nuevo Leon',3),
  ('Toluca','Estado de Mexico',11),
  ('Tijuana','Baja California',8),
  ('Mazatlan','Sinaloa',6),
  ('Ensenada','Baja California',9),
  ('Puerto Vallarta','Jalisco',2),
  ('Puebla','Puebla',10),
  ('Celaya','Guanajuato',12)
  
SELECT * FROM vendedor v 
SELECT * FROM sucursales s 

SELECT * FROM sucursales s ORDER BY numsucursal 

-- borrando columna estado y ciudad para vendedor
ALTER TABLE vendedor DROP COLUMN ciudad;
ALTER TABLE vendedor DROP COLUMN estado;

-- añadiendo vendedor numsucursal
ALTER TABLE vendedor ADD COLUMN num_sucursal INTEGER

-- actualizando num_sucursal en vendedor
UPDATE vendedor SET num_sucursal=2 WHERE id=1000;
UPDATE vendedor SET num_sucursal=4 WHERE id=1001;
UPDATE vendedor SET num_sucursal=1 WHERE id=1002;
UPDATE vendedor SET num_sucursal=3 WHERE id=1003;
UPDATE vendedor SET num_sucursal=5 WHERE id=1004;
UPDATE vendedor SET num_sucursal=12 WHERE id=1005;
UPDATE vendedor SET num_sucursal=10 WHERE id=1006;
UPDATE vendedor SET num_sucursal=11 WHERE id=1007;
UPDATE vendedor SET num_sucursal=9 WHERE id=1008;
UPDATE vendedor SET num_sucursal=6 WHERE id=1009;
UPDATE vendedor SET num_sucursal=8 WHERE id=1010;
UPDATE vendedor SET num_sucursal=7 WHERE id=1011;
UPDATE vendedor SET num_sucursal=8 WHERE id=1012;
UPDATE vendedor SET num_sucursal=4 WHERE id=1013;
UPDATE vendedor SET num_sucursal=1 WHERE id=1014;
UPDATE vendedor SET num_sucursal=3 WHERE id=1015;
UPDATE vendedor SET num_sucursal=5 WHERE id=1016;
UPDATE vendedor SET num_sucursal=12 WHERE id=1017;
UPDATE vendedor SET num_sucursal=10 WHERE id=1018;
UPDATE vendedor SET num_sucursal=11 WHERE id=1019;
UPDATE vendedor SET num_sucursal=12 WHERE id=1020;
UPDATE vendedor SET num_sucursal=12 WHERE id=1021;
UPDATE vendedor SET num_sucursal=8 WHERE id=1022;

-- usando join para ambas tablas
SELECT v.nombre, v.apellidopaterno, v.num_sucursal, s.municipio, s.estado
FROM vendedor v 
JOIN sucursales s 
ON v.num_sucursal = s.numsucursal 

--crear una tabla para saber cuantos cant hay por sucursal cantsucursal
CREATE TABLE cantsucursal
AS SELECT v.num_sucursal, COUNT(v.num_sucursal) AS cantidadporsucursal
FROM vendedor v 
JOIN sucursales s 
ON v.num_sucursal = s.numsucursal 
GROUP BY v,num_sucursal  
ORDER BY v.num_sucursal 

SELECT * FROM vendedor v ORDER BY num_sucursal 
SELECT * FROM cantsucursal c 

-- insertando valores con insert y select
SELECT * FROM libros l 
SELECT codigo_editorial FROM editorial e WHERE nombreeditorial = 'Mexico'
INSERT INTO libros VALUES(10040, 'La perdida del baston', 'Dionisio Castelo', 220, 840, 6)

INSERT INTO libros(codigolibro, titulo, autor, codigoeditorial, precio, cantidad) 
SELECT 10041, 'el bosque de la jungle', 'Edward', codigo_editorial , 740, 5
FROM editorial e2 
WHERE nombreeditorial = 'Mexico'

SELECT * FROM libros l 

-- insertando en tabla vendedor con select
SELECT * FROM vendedor v ORDER BY id
SELECT * FROM sucursales s ORDER BY numsucursal 

INSERT INTO vendedor(id, nombre, apellidopaterno, apellidomaterno, antiguedad, telefono, num_sucursal)
SELECT 1023, 'Edward', 'Cordova', 'Chavez', '2020-08-02', 983478763, numsucursal
FROM sucursales 
WHERE municipio = 'Ensenada'

-- next intro 7