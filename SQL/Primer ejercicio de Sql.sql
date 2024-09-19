create database Tienda

use Tienda

create table Producto(
Id_Producto int Primary key,
Cod_Producto varchar (40) not null,
Precio float not null,
Fecha_Vencimiento date not null)

create table Usuario(
Id_Usuario int primary key,
Nombre varchar (70) not null,
Email varchar (80) not null,
Direccion varchar (90) not null,
Barrio varchar (30) not null,
Fecha_Nacimiento date not null)

create table Pedidos(
Id_Pedido int primary key,
Id_Usuario2 int foreign key references Usuario(Id_Usuario),
Total_Pago float not null,
Fecha_Pedido date not null)

create table Facturas(
Id_Factura int primary key,
Id_Pedido2 int foreign key references Pedidos(Id_Pedido),
Total_Factura float not null,
Fecha date not null)

alter table Pedidos
add Id_Producto2 int foreign key references Producto(Id_Producto)