create database T7
use T7
create table Depto(
NoDepto int primary key,
DescDepto varchar(30)
)
create table Tipo(
Tipo int primary key,
DescTipo varchar(30)
)
create table Puesto(
IdPuesto int primary key,
DescPuesto varchar(30),
Estado varchar(30)
)
create table Producto(
IdPto int primary key,
Descripcion varchar(30),
FechaCreacionPto date,
Estado varchar(30),
Tipo int foreign key references Tipo(Tipo) 
)
create table Empleado(
NoEmp int primary key,
Nombre varchar(30),
Rfc varchar(30),
Correo varchar(30),
Empresa varchar(30),
Estado varchar(30),
NoDepto int foreign key references Depto(NoDepto),
IdPuesto int foreign key references Puesto(IdPuesto)
)

alter table Empleado add default 'IKE' for Empresa

alter table Empleado add constraint UQ_Empleado_Rfc unique (rfc)

insert into Depto values (1, 'Sistemas y computación')
insert into Depto values (2, 'Producción')
insert into Depto values (3, 'Ing. Industrial')

insert into Tipo values (1, 'Electrónicos')
insert into Tipo values (2, 'Blancos')
insert into Tipo values (3, 'Muebles')

alter table Empleado add default 'Activo' for Estado

select * from Depto
select * from Tipo