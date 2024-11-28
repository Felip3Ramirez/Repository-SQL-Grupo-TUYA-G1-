create database InstitucionEducativa
use InstitucionEducativa

--Create en un comando DDL
create table Alumnos(
Id_Alumno int primary key,
Nombre varchar (50) not null,
Apellido varchar (50) not null,
Direccion varchar (50) not null,
Fecha_Nacimiento date Not null
)
create table Profesor(
Id_Profesor int primary key,
Nombre varchar (50) not null,
Apellido varchar (50) not null,
Direccion varchar (50) not null,
Fecha_Nacimiento date not null,
Nivel_Academico varchar (50) not null 
)
create table Asignatura (
Id_Asignatura int primary key identity,
Nombre_Asignatura varchar(30) not null
)
create table Inscripcion(
Id_Inscripcion int primary key,
Id_Asignatura int foreign key references Asignatura (Id_Asignatura),
Id_Alumno int foreign key references Alumnos (Id_Alumno),
Id_Profesor int foreign key references Profesor (Id_Profesor),
Fecha DATETIME DEFAULT GETDATE() not null
)

--Insert en un comando DML
insert into  Alumnos(Id_Alumno,Nombre,Apellido,Direccion,Fecha_Nacimiento) values
(1020110613,'juan','Ramirez','Cr 45 # 80-90','1990-02-14'),
(71380960,'Camila','Salazar','Cll 21 #14-56','2000-03-21'),
(4277895,'Mateo','Rios','Cll 34a # 71-09','1998-10-15'),
(45091324,'Manuela','Ospina','Cll 45 # 89-50','2001-12-28')

insert into Profesor(Id_Profesor,Nombre,Apellido,Direccion,Fecha_Nacimiento,Nivel_Academico) values
(457125,'Marcos','Martines','Crr 40 #73-78','1997-03-15','Doctorado'),
(154515, 'Juan', 'Perez', 'Calle Falsa 123', '1985-06-15', 'Doctorado'),
(252452, 'Maria', 'Gomez', 'Avenida Siempre Viva 742', '1990-03-22', 'Maestria'),
(34243, 'Luis', 'Martinez', 'Boulevard de Suenos 456', '1978-11-10', 'Licenciatura'),
(42423, 'Ana', 'Sanchez', 'Plaza Mayor 789', '1982-07-05', 'Doctorado')

insert into Asignatura(Nombre_Asignatura) values
('Matematicas'),
('Sociales'),
('Fisica'),
('Artistica'),
('Musica'),
('Estadistica')

select * from Asignatura

insert into Inscripcion(Id_Inscripcion,Id_Asignatura,Id_Alumno) values
(1,2,4277895),
(2,1,45091324),
(3,4,71380960), 
(4,3,1020110613)

select * from Alumnos

select Nombre,Direccion from Alumnos

select * from Alumnos where Nombre ='Juan'

select * from Inscripcion where Id_Alumno not in (71380960,4277895)
select * from Profesor where Fecha_Nacimiento between '1980-01-01' and '1990-12-31'
select * from Alumnos where Nombre like 'C%'
select * from Inscripcion where Fecha between '2024-01-01' and '2024-06-31'
select * from Profesor where Nivel_Academico in ('Maestria','Licenciatura')
select * from Alumnos where Apellido like '%ez'


/*
1.SUM= solamente se puede aplicar a columnas tipo numeras y devuelve el total de una suma
2.MIN= trae el valor mas pequeño de una columna
3.MAX= trae el valor mas grande de una columna
4.AVG= devuelve el total de un promedio
5.COUNT= Traer el numero de una cuenta
6.GROUP BY=Agrupar registros con el mismo valor con un calculo
7.TOP=Listar una cantidad de filas
8.ORDER BY=Ordenar una columa de manera ASC o DESC
9.DISTICT=Omitir valores duplicados

*/

select Id_Alumno, COUNT(*) as 'CantidadInscripciones' from Inscripcion group by Id_Alumno

select MAX(Fecha_Nacimiento) from Profesor

select MIN(Fecha) from Inscripcion

select top 3 * from Asignatura

select distinct(Nombre) from Alumnos

select * from Profesor order by Apellido desc

/*
1.join inner=Muestra solamente los que se relacionan
2.join rigth= Muestra los relacionados incluso los que no de la segunda tabla
3.join left= Muestra los relacionados incluso los que no de la primera tabla
*/

select Alumnos.Nombre from Alumnos inner join Inscripcion on Alumnos.Id_Alumno=Inscripcion.Id_Alumno

select * from Profesor inner join Inscripcion on Profesor.Id_Profesor=Inscripcion.Id_Profesor inner join Asignatura on Inscripcion.Id_Asignatura=Asignatura.Id_Asignatura

select * from Alumnos left join Inscripcion on Alumnos.Id_Alumno=Inscripcion.Id_Alumno

select * from Inscripcion right join Asignatura on Inscripcion.Id_Asignatura=Asignatura.Id_Asignatura



select* from Alumnos inner join Inscripcion on Alumnos.Id_Alumno=Inscripcion.Id_Alumno inner join Asignatura on Inscripcion.Id_Asignatura=Asignatura.Id_Asignatura where Nombre_Asignatura in ('Fisica','Musica')

select* from Alumnos inner join Inscripcion on Alumnos.Id_Alumno=Inscripcion.Id_Alumno inner join Asignatura on Inscripcion.Id_Asignatura=Asignatura.Id_Asignatura where Alumnos.Id_Alumno like '%a%' and Asignatura.Nombre_Asignatura='Sociales'

select Alumnos.Id_Alumno,COUNT(*) from Alumnos inner join Inscripcion on Alumnos.Id_Alumno=Inscripcion.Id_Alumno inner join Asignatura on Inscripcion.Id_Asignatura=Asignatura.Id_Asignatura group by Alumnos.Id_Alumno


select * from Profesor INNER JOIN Inscripcion on Profesor.Id_Profesor=Inscripcion.Id_Profesor join Alumnos on Inscripcion.Id_Alumno=Alumnos.Id_Alumno