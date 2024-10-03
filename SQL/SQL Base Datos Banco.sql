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