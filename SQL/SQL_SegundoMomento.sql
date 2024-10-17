create database Biblioteca
use Biblioteca

create table Autor (
Id_Autor int primary key,
Nombre varchar (80) not null,
Nacionalidad varchar (20) not null
)

create table Libro (
Id_libro int primary key,
Titulo varchar (40) not null,
Editorial varchar (40) not null,
Area varchar (40) not null
)

create table LibAutor (
Id_Autor int foreign key references Autor (Id_Autor),
Id_Libro int foreign key references Libro (Id_Libro)
)

create table Estudiante (
Id_Lector int primary key,
Ci varchar (40) not null,
Nombre varchar (40) not null,
Direccion varchar (80) not null,
Carrera varchar (40) not null,
Edad int not null
) 

create table Prestamo (
Id_lector int foreign key references Estudiante (Id_Lector),
Id_libro int foreign key references Libro (Id_Libro),
Fecha_Prestamo datetime default getdate(),
Fecha_Devolucion datetime not null,
Devuelto varchar (40) not null,
)


insert into Autor (Id_Autor,Nombre,Nacionalidad) values
(111,'Gabriel','España'),
(222,'Marcos','Brasil'),
(333,'Lucas','Colombia')

insert into Libro (Id_libro,Titulo,Editorial,Area) values
(111,'El Señor de los Anillos','E.D.Marcalos','Ficcion'),
(222,'El Principito','E.D.Sanchos','Infantil'),
(333,'El Vielto','E.D.Climas','Drama')

insert into LibAutor (Id_Autor,Id_Libro) values
(111,222),
(222,333),
(333,111)

insert into Estudiante (Id_Lector,Ci,Nombre,Direccion,Carrera,Edad) values
(111,'Natural','Andres Grajales','Cra 20 #22-33','Informatica',20),
(222,'Patrocinio','Marcela Torres','Cra 30 #40-23','Informatica',22),
(333,'Natural','Artulio Perez','cra 40 #75-12','Matematicas',19)

insert into Prestamo (Id_lector,Id_libro,Fecha_Devolucion,Devuelto) values 
(111,222,'2022-04-01','Disponible'),
(222,333,'2024-12-31','Disponible'),
(333,111,'2025-11-20','Disponible')


select Nombre,Edad from Estudiante

select * from Estudiante where Carrera in ('Informatica')

select * from Estudiante where Edad>15

select * from Autor where Nacionalidad in ('Colombia')

select * from Libro where Area not in ('Informatica')

select * from Estudiante where Edad between 20 and 30

select * from Estudiante where Id_Lector in ('111')