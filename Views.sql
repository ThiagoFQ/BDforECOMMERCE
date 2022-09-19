show databases;
show tables from ecommerce;
use ecommerce;

create view products_sold_view as
	select Name, Value_product as Date_sale from sales
    where Value_product > 0.0;
    
select * from products_sold_view;
select * from sales;