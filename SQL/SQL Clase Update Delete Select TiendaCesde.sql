use TiendaCesde

--Consultar: SELECT
/*  
Traer toda la informacion:
SELECT * FROM tabla

Traer algunas columnas de la tabla
SELECT Columna,Columna.. from tabla

Traer registros que cumplan una condicion
SELECT * FROM Tabla WHERE Columna=valor

*/
--Ingresar filas a las tablas:INSERT
/*
INSERT INTO Tabla (Columnas,Columnas..) VALUES ('',''..),('',''..)
*/
--Traer los nombres de la tabla Cliente
select * from producto

--Traer los productos que tengan mas de 10 en existencias

select * from producto where Existencias >10

--Actualizar, Modificar UPDATE:

update Cliente set Direccion='Cr 20 #20-20' where Cedula=11934445

--Eliminar al Cliente

delete from Cliente where Cedula=78237834

update producto set Precio_Venta=Precio_Venta*1.10
select * from Articulo
select * from producto where Precio_Venta>40000
select * from Empleados where salario=2000000
delete from Compras where fecha<'2020/01/01'
update pedido set estado='enviado' where Id_Pedido=1023
delete from productos where cantidad=0