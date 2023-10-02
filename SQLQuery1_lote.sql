create database lote
use lote
create table Clientes(
id_clientes int identity primary key,
nombre varchar(20),
telefono varchar(20),
correo varchar(30)
)
create table Vendedor(
id_vendedor int identity primary key,
nombre varchar(20),
)
create table Lotes(
id_lote int identity primary key,
ubicacion varchar(40),
dimension varchar(20),
costo_mt decimal(6,2)
)
create table Presupuesto(
folio int identity primary key,
fecha date,
id_vendedor int foreign key references Vendedor (id_vendedor),
id_clientes int foreign key references Clientes (id_clientes)
)
create table PresupuestoLote(
id_lote int foreign key references Lotes (id_lote),
folio int foreign key references Presupuesto (folio),
primary key (id_lote, folio)
)