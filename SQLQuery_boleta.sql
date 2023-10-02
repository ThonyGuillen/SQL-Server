create database boleta
use boleta
create table Alumno(
id_matricula int identity primary key,
nombre varchar(20),
carrera varchar(25)
)
create table materia(
id_materia int identity primary key,
nombreMateria varchar(25),
)
create table boleta(
id_folio int identity primary key,
fecha_emision date,
semestre varchar(20),
id_matricula int foreign key references Alumno (id_matricula)
)
create table boletaMateria(
id_folio int foreign key references boleta (id_folio),
id_materia int foreign key references materia (id_materia),
primary key (id_folio,id_materia),
calificacion int,
tipoExamen varchar(30)
)