create database TiendaCesde
use TiendaCesde

create table Cliente (
Cedula int primary key,
Nombre varchar (50) not null,
Apellido varchar (50) not null,
Telefono bigint not null,
Direccion varchar not null)
create table producto (
Cod_Producto int primary key,
Nombre_Producto varchar (50) not null,
Categoria varchar (50) not null,
Existencias int not null,
Precio_Compra float not null,
Precio_Venta float not null,
Ganancia as (Precio_Venta - Precio_Compra), --as es para asignar
check (Precio_Venta > Precio_Compra) -- check es para validar
)

create table Pedido (
Id_Pedido int primary key identity, --identity es un campo que incremente de manera automatica de 1 en 1
Cliente int foreign key references Cliente (Cedula),
Producto int foreign key references producto (Cod_Producto),
Cantidad int not null,
Total_Pago float not null)

--DML: insert into
insert into Cliente (Cedula,Nombre,Apellido,Telefono,Direccion) values 
(11934445,'Kevin','Lopez',3130285591,'Carr 20 #50-30'),
(41545416,'Antoni','Garcia',1254268565,'Cr 30 #20-30'),
(81278937,'Mateo','Torta',1114651545,'cr 10 #62-45'),
(78237834,'Maria','Sereno',2123322333,'cr 26 #78-73'),
(27782377,'Sergio','Mares',67362623676,'cr 12 #73-48')

insert into producto (Cod_Producto,Nombre_Producto,Categoria,Existencias,Precio_Compra,Precio_Venta) values
(0020,'Pan Tajado','Harinas',32,2000,5000),
(0030,'Quesito','Lacteo',10,2800,4000),
(0040,'Arepas x 5','Harinas',23,1000,4000),
(0050,'Jamon Zenu','Carnes Frias',32,8000,12000)

insert into Pedido (Cliente,Producto,Cantidad,Total_Pago) values
(11934445,0020,3,7200),
(41545416,0040,2,8000),
(78237834,0050,2,24000)

--Traer la informacion de la tabla Cliente
select * from Cliente
--Traer los nombres y apellidos de la tabla cliente
select Nombre,Apellido from Cliente
--Traer toda la informacion de los productosa que esten en la categoria Lacteos
select * from producto where Categoria = 'Lacteo'
--Traer de la tabla producto los nombres de los productos que esten en la categoria lacteos
select Nombre_Producto from producto where Categoria='Lacteo'
--Traer de la tabla producto solamente aquellos que su ganacia sea mayor a 2000
select * from producto where Ganancia > 2000
