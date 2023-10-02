use pubs
--6. Despliega los datos de un autor cuyo ID comienza con el numero 724, sabiendo que cada ID tiene el
--formato de tres digitos seguidos por un guion, seguido por dos digitos, otro guion y finalmente cuatro digitos.
select au_id, au_lname, phone, address, city, state, zip, contract
from authors
where au_id like '%724-__-____'
go
--8. Calcule la suma de las ventas del año hasta la fecha(ytd_sales) de todos los libros de la tabla titles.
select sum(ytd_sales)
from titles
go
--9. Calcule el precio promedio de todos los libros (tabla titles).
select avg(price)
from titles
go
--10. Muestre el mayor valor de las ventas del año (ytd_sales) de todos los libros de la tabla titles.
select max(ytd_sales)
from titles
go
--11. Muestre el minimo valor de las ventas del año (ytd_sales) de todos los libros de la tabla titles.
select min(ytd_sales)
from titles
go
--12. Cuente las filas de la tabla titles.
select count(*)
from titles
go
--13. Cuente los datos de la tabla titles, cuyo tipo (TYPE) sea business.
select count(type)
from titles
where type like '%business'
go
--14. Liste la suma de las ventas por año (ytd_sales) de la tabla titles, clasificándolas por tipo (TYPE) de título.
select type ,sum(ytd_sales)
from titles 
group by type
go
--15. Liste las sumas de las ventas por año (ytd_sales) hasta la fecha, clasificándolas por tipo (TYPE) y
--pub_id, liste solamente los grupos cuyo pub_id sea igual a 0877, utilizando having.
select type, pub_id, sum(ytd_sales)
as total_quantity
from titles
group by type, pub_id
having (pub_id)=0877
go
--16. Combine las tablas stores y disconunts para mostrar que tienda (stor_id) ofrece un descuento y el
--tipo de descuento (discounttype). (Full Outer Join).
select * from stores 
full Outer Join discounts
	on stores.stor_id = discounts.discounttype
--17. Utilice el mismo ejemplo anterior solo utilice en el from la instruccion LEFT OUTER JOIN.
select * from stores 
left Outer Join discounts
	on stores.stor_id = discounts.discounttype
--18. Utilice el mismo ejemplo anterior solo utilice en el from la instruccion RIGHT.
select * from stores 
right Outer Join discounts
	on stores.stor_id = discounts.discounttype