use Northwind
--1. Genere una lista de la tabla Empleado donde solo se genere una columna de salida y esta contenga 
--los campos: EmployeeID, LastName y FirstName.
select employeeid, lastname, firstname
from employees
go
--2. Despliegue aquellos productos (Tabla Products) cuyos valores se encuentran entre los 4 y 20.
select ProductID, ProductName, SupplierID, CategoryID, QuantityPerUnit, 
		UnitPrice, UnitsInStock, UnitsOnOrder, ReorderLevel, Discontinued
from products
where ProductID between 4 and 20 
go
--3. Liste los campos de la tabla productos que tengan exactamente un precio de 18,19 y 10.
select ProductID, ProductName, SupplierID, CategoryID, QuantityPerUnit, 
		UnitPrice, UnitsInStock, UnitsOnOrder, ReorderLevel, Discontinued
from products
where UnitPrice in (18,19,10)
go
--4. Encontrar todos los apellidos (LastName) en la tabla Employees que comiencen con la letra S.
select lastname
from employees
where (LastName LIKE 'S%')
go
--5. Despliegue los datos de los empleados cuya primera letra del apellido comienza entre A y M.
select employeeid, lastname, firstname, Title, TitleOfCourtesy, BirthDate,
		HireDate, Address, City, Region, PostalCode, Country, HomePhone, Extension,
		Photo, Notes, ReportsTo, PhotoPath
from employees
where LastName between 'A%' and 'M%'
go
--7. Liste todos los campos de la tabla Suppliers cuya columna Region sea NULL.
select SupplierID, CompanyName, ContactName, ContactTitle, Address, City,
		Region, PostalCode, Country, Phone, Fax, HomePage
from Suppliers
where Region is null
go
--19. Muestre los Productos (ID del Producto, Nombre y Precio Unitario) que tengan un precio unitario
--igual al Maximo.
select ProductID, ProductName, UnitPrice
from products
where UnitPrice = (select max(UnitPrice) from products);
--20. Muestre los Productos (ID del Producto, Nombre y Precio Unitario) que tengan un precio unitario
--igual al Minimo.
select ProductID, ProductName, UnitPrice
from products
where UnitPrice = (select min(UnitPrice) from products);

