-- LINK: https://en.wikibooks.org/wiki/SQL_Exercises/The_computer_store
-- 1.1 Select the names of all the products in the store.
select name from products;

-- 1.2 Select the names and the prices of all the products in the store.
select name, price from products;

-- 1.3 Select the name of the products with a price less than or equal to $200.
select name from products where price <= 200;

-- 1.4 Select all the products with a price between $60 and $120.
select * from products where price between 60 and 120;

select * 
from products 
where price >= 60 
and price <= 120;

-- 1.5 Select the name and price in cents (i.e., the price must be multiplied by 100).
select name, price*100  from products;

-- 1.6 Compute the average price of all the products.
 select avg(price) from products;
 
 select sum(price)/count(*) from products;

-- 1.7 Compute the average price of all products with manufacturer code equal to 2.
select avg(price) from products where manufacturer = 2;

select sum(price)/count(*) from products where manufacturer = 2;

-- 1.8 Compute the number of products with a price larger than or equal to $180.
select count(*) from products where price >= 180;

-- 1.9 Select the name and price of all products with a price larger than or equal to $180, and sort first by price (in descending order), and then by name (in ascending order).
 select 
     name
     , price 
from 
    products
where
    price >= 180
order by price desc, name asc
;

-- 1.10 Select all the data from the products, including all the data for each product's manufacturer.
select 
    prod.*
    , manu.name
from
    products as prod
    join manufacturers as manu
    on prod.manufacturer = manu.code
;

-- 1.11 Select the product name, price, and manufacturer name of all the products.
select 
    prod.name
    , prod.price
    , manu.name
from
    products as prod
    join manufacturers as manu
    on prod.manufacturer = manu.code
;

-- 1.12 Select the average price of each manufacturer's products, showing only the manufacturer's code.
select
    manufacturer
    , avg(price)
from
    products
group by manufacturer
;

-- 1.13 Select the average price of each manufacturer's products, showing the manufacturer's name.
select
    manu.name
    , calc.ave
from
    manufacturers as manu
    join (select
               manufacturer
               , avg(price) as ave
           from
               products
           group by manufacturer) as calc
    on manu.code = calc.manufacturer
;

-- 1.14 Select the names of manufacturer whose products have an average price larger than or equal to $150.
select
    manu.name
from
    manufacturers as manu
    join (select
               manufacturer
           from
               products
           group by manufacturer
           having avg(price) >= 150
           ) as calc
    on manu.code = calc.manufacturer
;

-- 1.15 Select the name and price of the cheapest product.
select
    name
    , price
from
    products
order by price
limit 1, 1
;

-- 1.16 Select the name of each manufacturer along with the name and price of its most expensive product.
select
    manu.name, prod.name, calc.min_price
from (
    select 
        manufacturer
        , max(price) as min_price
    from
        products
    group by manufacturer
    ) as calc
    join manufacturers as manu
        on calc.manufacturer = manu.code
    join products as prod
        on prod.manufacturer = calc.manufacturer
             and prod.price = calc.min_price
order by manu.name
;

-- 1.17 Add a new product: Loudspeakers, $70, manufacturer 2.
insert into products values(11, "Loudspeakers", 70, 2);

-- 1.18 Update the name of product 8 to "Laser Printer".
update products set name = "Laser Printer" where code = 8;

-- 1.19 Apply a 10% discount to all products.
update products set price = price * 0.9
;

-- 1.20 Apply a 10% discount to all products with a price larger than or equal to $120.
update
    products
set
    price = price * 0.9
where
    price >= 120 
;
