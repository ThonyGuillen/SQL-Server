create database T6
use T6

create table Productos(
CvePto int,
Descripcion varchar(30),
precio valorreal,
CveLinea int ,
Tipo varchar(20)
)
EXEC sp_addtype valorreal, 'decimal(6,2)'

select * from Productos
use T6
alter table dbo.Productos
alter column CvePto int not null
alter table dbo.Productos
add constraint pk_CvePto primary key (CvePto)
create table Linea(
CveLinea int primary key,
Descripcion varchar(20)
)

alter table dbo.Productos
add constraint fk_CveLinea
foreign key (CveLinea) 
references dbo.Linea(CveLinea)

alter table dbo.Productos
add
constraint ck_CveLinea
check (Cvelinea >=1 and CveLinea <=20);

insert into Linea values (1,'Linsoftware')
insert into Productos values (22,'LinJabon', 30, 1,'326')
alter table dbo.Productos
add constraint ck_Precio check (Precio >=1 and Precio <=9999.99);

alter table dbo.Linea
add constraint ck_Descripcion
check (Descripcion like 'Lin%' )
delete from Linea where CveLinea=1
delete from Productos