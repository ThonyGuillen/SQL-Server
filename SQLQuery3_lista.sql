create database lista
use lista
create table Alumno(
no_control int primary key,
nombre varchar(30)
)
create table Materia(
id_materia int primary key,
nombre_materia varchar(30),
creditos int
)
create table Maestro(
no_maestro int primary key,
nombre_maestro varchar(30)
)
create table Lista(
folio varchar(12) primary key,
periodo varchar(25),
fecha date,
cant_alumnos int,
horario varchar(30),
no_maestro int foreign key references Maestro(no_maestro),
id_materia int foreign key references Materia(id_materia)
)
create table listaAlumno(no_control int foreign key references Alumno(no_control),
folio varchar(12) foreign key references Lista(folio),
primary key (no_control,folio)
)

insert into Alumno values(19210455,'AGANZA MOLINA ABRAHAM ARMANDO'), (18212138,'AHUATZI ANGULO CHRISTIAN ANDRES'), (18210450,'ALEMAN URETA ENRIQUE'), (19210460,'ALVAREZ ZACARIAS ADRIAN NOE'), (18210453,'ARELLANO MUNGUIA ROLANDO')
insert into Materia values(1025,'Contabilidad',5)
insert into Maestro values(764,'Margarita Ramirez')
select * from Alumno
select * from Materia
select * from Maestro