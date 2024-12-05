create database Biblioteca
use Biblioteca

create table Autores(
Id_Autor int primary key,
Nombre varchar (50) not null,
Apellido varchar (50) not null
)
delete Autores
delete Libro
insert into Autores(Id_Autor,Nombre,Apellido) values
(10,'Marcos','Perez'),
(20,'Ivan','Sanches'),
(30,'Martina','Osa'),
(40,'Daniel','Perez'),
(50,'Yonma','Martinez')

create table Libro(
Id_Libro int primary key,
Id_Autor int foreign key references Autores(Id_Autor),
Titulo varchar (50) not null,
Añio_Publicacion date not null
)
insert into Libro(Id_Libro,Id_Autor,Titulo,Añio_Publicacion)values
(10,20,'Harry Poter','2000-02-20'),
(20,10,'Senor de los Anillos','1997-01-30'),
(30,30,'Titanic','1950-03-29'),
(40,50,'Hoy por ti mañana por mi','2000-02-10'),
(50,40,'Te amo rdido un perro','2024-12-05')

create table Miembros(
Id_Miembro int primary key,
Nombre varchar (50) not null,
Apellido varchar (50) not null,
Fecha_Registro date not null
)
insert into Miembros(Id_Miembro,Nombre,Apellido,Fecha_Registro)values
(10,'Brayder','Pacha','2021-05-29'),
(20,'Duglas','Nidea','2019-02-14'),
(30,'Daniel','Algos','2020-06-12'),
(40,'Laura','Porhay','2000-04-12'),
(50,'Profe','Divina','2020-02-20')

create table Prestamos(
Id_Prestamo int primary key,
Id_Libro int foreign key references Libro(Id_Libro),
Id_Miembro int foreign key references Miembros(Id_Miembro),
Fecha_Prestamo date not null,
Fecha_Devolucion date not null
)
insert into Prestamos(Id_Prestamo,Id_Libro,Id_Miembro,Fecha_Prestamo,Fecha_Devolucion)values
(10,50,50,'2024-12-10','2025-02-01'),
(20,40,40,'2000-10-23','2001-01-01'),
(30,30,30,'2012-12-12','2013-02-01'),
(40,20,20,'2000-11-14','2001-01-30'),
(50,10,10,'2005-03-12','2005-03-27')


select * from Autores
select * from Libro
select * from Miembros
select * from Prestamos

update Prestamos set Fecha_Devolucion='2001-05-30' where Id_Prestamo=40
delete from Prestamos where Id_Prestamo=50
select * from Autores where Nombre like '%o%'
select * from Libro where Id_Autor in (10,20)
select * from Libro where Id_Autor not in (30,40)
select * from Prestamos where Fecha_Devolucion between '2005-01-01' and '2030-12-31'
select count(*) from Miembros 
select sum(Id_Miembro) from Miembros
select min(Fecha_Devolucion) from Prestamos
select max(Fecha_Prestamo) from Prestamos
select avg(Id_Libro) from Libro
select Titulo,max(Añio_Publicacion) from Libro group by Titulo
select Titulo from Libro group by Titulo having min(Añio_Publicacion) > '2000-01-01' 
select* from Prestamos right join Libro on Prestamos.Id_Libro=Libro.Id_Autor
select* from Prestamos join Libro on Prestamos.Id_Libro=Libro.Id_Autor
select* from Prestamos left join Libro on Prestamos.Id_Libro=Libro.Id_Autor