create database T8
use T8
Create table Partes(
Id_Parte varchar(30) not null,
Parte varchar(50) not null,
Color varchar(30) not null,
Estado int not null,
Precio float not null
)
create table Partes_Suministradas(
IdProv varchar(30) not null,
Id_parte varchar(30) not null,
Cantidad int not null
)
Create table Proveedores(
IdProv varchar(30) not null,
Nom Varchar(30) not null,
Estado int not null,
Ciudad varchar(30) not null,
Correo varchar (70) not null
)
alter table Partes add constraint PK_IdParte Primary key (Id_Parte)
alter table Proveedores add constraint PK_IdProv Primary key (IdProv)
alter table Partes_Suministradas add constraint FK_IdParte Foreign key (Id_parte)
references Partes(Id_Parte)
alter table Partes_Suministradas add Constraint FK_IdProv Foreign key (IdProv)
references Proveedores(IdProv)
Alter table Partes add constraint CHECK_IdParte check (Id_Parte like 'P%')
alter table Proveedores add constraint Check_IdProv check (IdProv like 'S%')
alter table Partes add Constraint Check_Precio Check(Precio between 1 and 5)
alter table Proveedores add Constraint Check_Ciudad Check(Ciudad ='Londres'or
Ciudad='Paris')
alter table Partes add constraint DF_Estado default 17 for Estado
alter table Proveedores add Constraint Check_Correo check(Correo like '%@gmail.com')
insert into Partes values ('P1', 'Tuerca','Rojo',12,1.50)
Insert into Partes values('P2', 'Perno','Verde',17,2.00)
Insert into Partes values('P3','Tornillo','Azul',17,4.80)
Insert into Partes values('P4','Tornillo','Rojo',14,1.20)
Insert into Proveedores values('S1','Salazar',20,'Londres','zzzz@gmail.com')
Insert into Proveedores values('S2','Jaramillo',10,'Paris','reytyer@gmail.com')
Insert into Partes_Suministradas values('S1','P1',300)
Insert into Partes_Suministradas values('S1','P2',200)
Insert into Partes_Suministradas values('S1','P3',400)
Insert into Partes_Suministradas values('S1','P4',300)
Insert into Partes_Suministradas values('S2','P2',300)
Insert into Partes_Suministradas values('S2','P2',350)
select*from Partes
select*from Partes_Suministradas
select*from Proveedores
