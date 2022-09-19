use ecommerce;
show tables;
select * from user;

create user 'admin'@dominion identified by '001011299';
grant all privileges on ecommerce.* to 'admin'@dominion;

create user 'seller'@dominion identified by '001165086';
grant all privileges on ecommerce.products_sold_view to 'seller'@dominion;