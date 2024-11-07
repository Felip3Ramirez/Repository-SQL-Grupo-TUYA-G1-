create database Banco

use Banco

create table Clientes(
Cliente_Id int Primary key,
Nombre varchar (80) not null,
Apellido varchar (80) not null,
Email varchar (80) not null,
Telefono bigint not null,
Fecha_Nacimiento date not null,
Fecha_Creacion datetime default getdate(),
Estado_Cliente varchar (20) not null)

alter table Clientes
add constraint Email unique (Email)

create table Prestamos(
Prestamo_Id int primary key,
Cliente_Id int foreign key references Clientes (Cliente_Id),
Monto_Prestamo float not null,
Tasa_Interes float not null,
Fecha_Aprobacion date not null,
Plazo_Meses int not null,
Estado_Prestamo varchar (20) not null)

create table Pagos_Prestamo(
Pago_Id int primary key,
Prestamo_Id int foreign key references Prestamos (Prestamo_Id),
Monto_Pago float not null,
Fecha_Pago date not null)

create table Cuentas_Bancarias(
Numero_Cuenta int primary key,
Cliente_Id int foreign key references Clientes (Cliente_Id),
Estado_Cuenta varchar (20) not null,
Tipo_Cuenta varchar (20) not null,
Saldo float not null,
Fecha_Apertura date not null)

create table Transacciones(
Transaccion_Id int identity(1,1) primary key,
Cuenta_Id int foreign key references Cuentas_Bancarias (Numero_Cuenta),
Monto float not null,
Tipo_Transaccion varchar (40) not null,
Fecha_Transaccion date not null,
Descripcion varchar (100) not null)

create table Sucursales(
Sucursal_Id int primary key,
Nombre_Sucursal varchar (80) not null,
Direccion varchar (50) not null,
Ciudad varchar (50) not null,
Estado varchar (50) not null,
Telefono bigint not null)

create table Empleados (
Empleado_Id int primary key,
Sucursal int foreign key references Sucursales (Sucursal_Id),
Nombre varchar (80) not null,
Apellido varchar (80) not null,
Cargo varchar (50) not null,
Email varchar (80) not null,
Fecha_Ingreso date not null,
Salario float not null)


INSERT INTO Clientes (Cliente_Id, Nombre, Apellido, Email, Telefono, Fecha_Nacimiento, Estado_Cliente)
VALUES
(1, 'Juan', 'Pérez', 'juan.perez@example.com', 1234567890, '1990-01-01', 'Activo'),
(2, 'María', 'González', 'maria.gonzalez@example.com', 9876543210, '1992-02-02', 'Activo'),
(3, 'Pedro', 'Rodríguez', 'pedro.rodriguez@example.com', 5551234567, '1995-03-03', 'Activo'),
(4, 'Ana', 'Martínez', 'ana.martinez@example.com', 8765432109, '1998-04-04', 'Activo'),
(5, 'Luis', 'Hernández', 'luis.hernandez@example.com', 3456789012, '2000-05-05', 'Activo')

INSERT INTO Prestamos (Prestamo_Id, Cliente_Id, Monto_Prestamo, Tasa_Interes, Fecha_Aprobacion, Plazo_Meses, Estado_Prestamo)
VALUES
(1, 1, 10000.00, 0.05, '2022-01-01', 12, 'Aprobado'),
(2, 2, 5000.00, 0.03, '2022-02-01', 6, 'Aprobado'),
(3, 3, 20000.00, 0.07, '2022-03-01', 24, 'Aprobado'),
(4, 4, 8000.00, 0.04, '2022-04-01', 18, 'Aprobado'),
(5, 5, 15000.00, 0.06, '2022-05-01', 12, 'Aprobado')

INSERT INTO Pagos_Prestamo (Pago_Id, Prestamo_Id, Monto_Pago, Fecha_Pago)
VALUES
(1, 1, 1000.00, '2022-02-01'),
(2, 1, 1000.00, '2022-03-01'),
(3, 2, 500.00, '2022-03-01'),
(4, 3, 2000.00, '2022-04-01'),
(5, 4, 800.00, '2022-05-01')

INSERT INTO Cuentas_Bancarias (Numero_Cuenta, Cliente_Id, Estado_Cuenta, Tipo_Cuenta, Saldo, Fecha_Apertura)
VALUES
(1, 1, 'Activa', 'Corriente', 1000.00, '2022-01-01'),
(2, 2, 'Activa', 'Ahorro', 500.00, '2022-02-01'),
(3, 3, 'Activa', 'Corriente', 2000.00, '2022-03-01'),
(4, 4, 'Activa', 'Ahorro', 800.00, '2022-04-01'),
(5, 5, 'Activa', 'Corriente', 1500.00, '2022-05-01')

INSERT INTO Transacciones (Cuenta_Id, Monto, Tipo_Transaccion, Fecha_Transaccion, Descripcion)
VALUES
(1, 100.00, 'Depósito', '2022-01-01', 'Depósito inicial'),
(2, 200.00, 'Retiro', '2022-01-05', 'Retiro en efectivo'),
(3, 300.00, 'Transferencia', '2022-01-10', 'Transferencia a otra cuenta'),
(4, 400.00, 'Depósito', '2022-01-15', 'Depósito de salario'),
(5, 500.00, 'Retiro', '2022-01-20', 'Retiro en efectivo')

INSERT INTO Sucursales (Sucursal_Id, Nombre_Sucursal, Direccion, Ciudad, Estado, Telefono)
VALUES
(1, 'Sucursal Central', 'Calle 1 # 2-3', 'Bogotá', 'Cundinamarca', 1234567890),
(2, 'Sucursal Norte', 'Calle 10 # 5-6', 'Bogotá', 'Cundinamarca', 9876543210),
(3, 'Sucursal Sur', 'Calle 20 # 8-9', 'Bogotá', 'Cundinamarca', 5551234567),
(4, 'Sucursal Occidente', 'Calle 30 # 11-12', 'Cali', 'Valle del Cauca', 7778889990),
(5, 'Sucursal Oriente', 'Calle 40 # 13-14', 'Bucaramanga', 'Santander', 3334445555)

INSERT INTO Empleados (Empleado_Id, Sucursal, Nombre, Apellido, Cargo, Email, Fecha_Ingreso, Salario)
VALUES
(1, 1, 'Juan', 'Pérez', 'Gerente', 'juan.perez@example.com', '2018-01-01', 5000000.00),
(2, 1, 'María', 'González', 'Asistente', 'maria.gonzalez@example.com', '2019-02-02', 3000000.00),
(3, 2, 'Pedro', 'Rodríguez', 'Cajero', 'pedro.rodriguez@example.com', '2020-03-03', 2500000.00),
(4, 3, 'Ana', 'López', 'Gerente', 'ana.lopez@example.com', '2019-04-04', 4500000.00),
(5, 4, 'Carlos', 'Martínez', 'Asistente', 'carlos.martinez@example.com', '2020-05-05', 3500000.00)

select * from Clientes
select * from Prestamos
select * from Pagos_Prestamo
select * from Cuentas_Bancarias
select * from Transacciones
select * from Sucursales
select * from Empleados

SELECT top 5 * FROM Clientes 
SELECT count (*) as 'CantidadSucursalesBogota' FROM Sucursales WHERE Ciudad = 'Bogotá'
SELECT sum (Monto) as 'SumatoriaMonto' FROM Transacciones WHERE Cuenta_Id=2
SELECT avg (Saldo) as 'PromedioCuentaBancaria' FROM Cuentas_Bancarias 
SELECt distinct (Fecha_Apertura) FROM Cuentas_Bancarias
SELECT min (Saldo) as 'SaldoMinimo' FROM Cuentas_Bancarias
SELECT max (Saldo) as 'SaldoMaximo' FROM Cuentas_Bancarias

--1.Obtener una lista de las ciudades distintas donde hay sucursales
SELECT distinct (Ciudad) FROM Sucursales
--2.Contar la cantidad de clientes en estado 'Activo'
SELECT count (*) FROM Clientes WHERE Estado_Cliente = 'Activo'
--3.Obtener el monto maximo de prestamo otorgado
SELECT max (Monto_Prestamo) FROM Prestamos
--4.Contar la cantidad de empleados cuyo correo electronico termina en '@gmail.com'
SELECT count (*) FROM Empleados WHERE Email like '%@example.com'
--5.Encontrar el monto maximo y minimo de prestamo aprobado en el año 2023
SELECT min (Monto_Prestamo),max (Monto_Prestamo) FROM Prestamos where Fecha_Aprobacion between '2022-01-01' and '2022-12-31'
--6.Contar la cantidad de tipos de transacciones distintas que existen
SELECT count  (distinct Tipo_Transaccion ) FROM Transacciones
--7.Encontrar el salario mas alto de los empleados en una sucursal Medellin
SELECT MAX(Salario) AS SalarioMaximo FROM Empleados WHERE Sucursal IN (1, 2, 3)
--8.Contar el monto de clientes cuya cuenta no esta en estado 'activo'
SELECT count (*) FROM Clientes WHERE Estado_Cliente not in ('Activo')
--9.Encontrar el monto minimo de prestamo aprobado
SELECT min (Monto_Prestamo) FROM Prestamos WHERE Estado_Prestamo = 'Aprobado'
--10.Contar el numero total de clientes
SELECT count (*) FROM Clientes
--11.Sumar el saldo de las cuentas bancarias que pertenecen a los clientes con id 235562,90068 y 797653
SELECT sum (Saldo) FROM Cuentas_Bancarias WHERE Cliente_Id in (1,2,3)
--12.Calcular el promedio de monto de prestamos entre 500.000 y 2000000
SELECT avg (Monto_Prestamo) FROM Prestamos WHERE Monto_Prestamo BETWEEN 5000 AND 15000

--Mostrar cuantos trabajadores hay en cargo
SELECT Cargo, COUNT(*) as 'Cantidad de empleados por cargo' FROM Empleados GROUP BY Cargo

--Motrar el total de la tabla transacciones segun el TipoTransaccion
SELECT Tipo_Transaccion, sum(Monto) as 'Total de tipos de transaccion' FROM Transacciones GROUP BY Tipo_Transaccion

--Mostrar cuantas sucursales hay en cada ciudad
SELECT Ciudad ,COUNT(*) as 'Numero de sucursales por ciudad' FROM Sucursales GROUP BY Ciudad

--Mostrar de la tabla prestamos el total del Montopretamo segun el estado
SELECT Estado_Prestamo ,SUM(Monto_Prestamo) as 'Sumatoria de prestamos' FROM Prestamos GROUP BY Estado_Prestamo

--Motrar el total del monto la tabla transacciones segun el TipoTransaccion pero mostrar aquellos que superen 2 millones
SELECT Tipo_Transaccion ,SUM(Monto) FROM Transacciones GROUP BY Tipo_Transaccion HAVING SUM(Monto) > 2000000

--Mostrar la informacion de la tabla CLiente ordenando los apellidos de manera ascendente
SELECT * FROM Clientes ORDER BY Apellido DESC
SELECT * FROM Clientes ORDER BY Apellido ASC

--1.Listar los tipos de transaccion de la tabla transacciones que superan los 10000 en monto
SELECT Tipo_Transaccion, SUM (Monto) from Transacciones Group by Tipo_Transaccion having sum(Monto)>400

--2.Mostrar el numero de prestamos aprobados por cliente
SELECT count(*) from Prestamos where  Estado_Prestamo in  ('Aprobado')
SELECT Cliente_Id,COUNT(*) from Prestamos where Estado_Prestamo = 'Aprobado' group by Cliente_Id

--3.Mostar los clientes con mas de dos perestamos aprobados
SELECT Cliente_Id,COUNT(*) from Prestamos where Estado_Prestamo = 'Aprobado' group by Cliente_Id having count(*) >=1

--4.Obtener el total de transacciones por tipo entre las fechas '2023-01-01' y '2023-12-31' solo para los tipos 'Deposito' y 'Retiro'
SELECT Tipo_Transaccion, COUNT(*) AS Total_Transacciones FROM  Transacciones WHERE  Fecha_Transaccion BETWEEN '2023-01-01' AND '2023-12-31'
AND Tipo_Transaccion IN ('Depósito', 'Retiro')
GROUP BY  Tipo_Transaccion;

--5.Obtener el numero de transacciones por tipo de transaccion que contienen la palabra 'pago' en la descripcion y cuyo monto total sea mayor a 5000
SELECT Tipo_Transaccion, SUM (Monto) From Transacciones where  Descripcion like '%Depósito%' group by Tipo_Transaccion having SUM(Monto) >300
select * from Transacciones

--1.	Mostrar el total de las transacciones realizadas en el mes de enero de 2024
SELECT * from Transacciones where Fecha_Transaccion between '2022-01-01' and '2022-12-31'

--2.	Mostrar todas las transacciones menos las que sean tipo transferencia.
SELECT * FROM Transacciones where Tipo_Transaccion not in ('Transferencia')

--3.	Mostrar el monto total de los préstamos en el estado "Rechazado".
select * from Prestamos
SELECT  SUM(Monto_Prestamo) FROM Prestamos where Estado_Prestamo ='Aprobado' 

--4.	Mostrar el número total de préstamos por cada cliente con estado "Pendiente"
SELECT Prestamo_Id, count(*) From Prestamos where Estado_Prestamo ='Aprobado' group by Prestamo_Id

--5.	Mostrar el monto total de transacciones por tipo para aquellos que tengan más de 5 transacciones
SELECT  Tipo_Transaccion, SUM(Monto) FROM Transacciones GROUP BY Tipo_Transaccion HAVING  COUNT(*) > 5

--6.	Obtener la cantidad de sucursales en cada ciudad y ordenar los resultados por la cantidad de sucursales (de mayor a menor).






