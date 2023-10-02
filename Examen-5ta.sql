create database Examen5

use Examen5

create table Empleados(
NoEmpl int not null,
Nombre varchar(50) not null,
area varchar(20) not null,
sueldo money not null
)

--1.Escribe un procedimiento almacenado que permita realizar la captura de los datos en una tabla de
--empleados que tiene la siguiente estructura, utilizando el procedimiento inserta los datos incluidos en la
--tabla.(3 pto)


create proc sp_InsertEmpleado(@NoEmpl int,@Nombre varchar(90),@area varchar(40),@sueldo money)
as  
begin
insert into Empleados(NoEmpl,Nombre,area,Sueldo)
values(@NoEmpl,@Nombre,@area,@sueldo)
end

exec sp_InsertEmpleado 1121, 'Enrique Ramírez Gómez', 'Sistemas', 9500.00
exec sp_InsertEmpleado 1221, 'Rubén A. Ortega Ramos', 'Diseño', 9000.00


select * from Empleados
--2.Crea un Trigger que cada vez que de un alta un registro a la tabla de estudiantes, grabe el mensaje ALTA
--en una tabla denominada REGISTRO,y la fecha en la que se almaceno.(3 ptos).

create table REGISTRO
(
alta varchar(10), 
Fecha date not null,
usuario varchar(15)
)

create trigger Insertar on Empleados
for insert
as
begin
insert into REGISTRO values ('ALTA',GETDATE(), CURRENT_USER);
end

exec sp_InsertEmpleado 20210575, 'Guillen Martinez Anthony', 'Sistemas', 10.00

select * from REGISTRO;

--3. Crea una función que calcule la comisión a pagar a un vendedor en base al monto de venta.
--Si la venta es de 0-1000, comisión de 1 %, si la venta es 1001-5000 comisión de 2 %, si la venta es 5001 o
--más una comisión de 3 %
--Se deben desplegar. Los datos del vendedor, el monto de la venta y el monto de la comisión obtenida. (4
--ptos).

create function dbo.Comision(@montoventa money)
returns money
as
begin
	declare @Comision1 money

	set @Comision1 =
	case
	when @montoventa >= 0 and @montoventa <= 1000 then @montoventa*0.01
	when @montoventa >= 1001 and @montoventa <= 5000 then @montoventa*0.02
	when @montoventa >= 5001  then @montoventa*0.03
end
return @comision1;
end


select NoEmpl,Nombre,area,sueldo, 600 as 'monto de venta',dbo.Comision(600) as 'Comisión a pagar' from Empleados where NoEmpl = 1121
