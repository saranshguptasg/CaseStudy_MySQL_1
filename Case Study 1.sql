/* Case 1 */

-- Creating Database and Importing CSV file

CREATE DATABASE Item;
USE Item;

-- Converting imported data into correct data type for analysis

SELECT str_to_date(order_date,"%d-%m-%Y")
FROM item;

ALTER TABLE item
ADD Column od date;

UPDATE item
SET od = str_to_date(order_date,"%d-%m-%Y");

ALTER TABLE item
DROP order_date;

ALTER TABLE item
ADD COLUMN order_date date;

UPDATE item
SET order_date = od;

ALTER TABLE item
DROP od;

SELECT *
FROM item
LIMIT 10;

SELECT *
FROM customer
LIMIT 10;

/*
1. From the items_ordered table, select a list of all items purchased for customerid 10449.
Display the customerid, item, and price for this customer.
*/

SELECT customerid, item, price
FROM item
WHERE customerid = 10449;

-- 2. Select all columns from the items_ordered table for whoever purchased a Tent.

SELECT *
FROM item
WHERE item = "Tent";

/*
3. Select the customerid, order_date, and item values from the items_ordered table for any
items in the item column that start with the letter "S".
*/

SELECT customerid, order_date, item, price
FROM item
WHERE item LIKE "S%";

/*
4. Select the distinct items in the items_ordered table. In other words, display a listing of each
of the unique items from the items_ordered table.
*/

SELECT item
FROM item
GROUP BY item
HAVING count(*) =1;

/* 
5. Select the maximum price of any item ordered in the items_ordered table. Hint: Select the
maximum price only.
*/

SELECT max(price)
FROM item;

-- 6. Select the average price of all of the items ordered that were purchased in the month of Dec.

SELECT avg(price)
FROM item
WHERE month(order_date) = 12;

-- 7. What are the total number of rows in the items_ordered table?

SELECT count(*) as Total_Rows
FROM item;

-- 8. For all of the tents that were ordered in the items_ordered table, what is the price of the lowest tent? 

SELECT min(price)
FROM item
WHERE item = "tent";

/* 
9. How many people are in each unique state in the customers table? Select the state and display
the number of people in each. Hint: count is used to count rows in a column, sum works on
numeric data only.
*/

SELECT state , count(*)
FROM customer
GROUP BY state;

/*
10. From the items_ordered table, select the item, maximum price, and minimum price for each
specific item in the table.
*/

SELECT item, max(price) as max, min(price) as min
FROM item
GROUP BY item;

/*
11. How many orders did each customer make? Use the items_ordered table. Select the
customerid, number of orders they made, and the sum of their orders. Click the Group By
answers link below if you have any problems. 
*/

SELECT customerid, count(*) as Total_orders, sum(price) as Total_price
FROM item
GROUP BY customerid;

/* 
12. How many people are in each unique state in the customers table that have more than one
person in the state? Select the state and display the number of how many people are in each if
it's greater than 1.
*/

SELECT state, count(*)
from customer
GROUP BY state
Having count(*)>1;

/*
13. From the items_ordered table, select the item, maximum price, and minimum price for each
specific item in the table. Only display the results if the maximum price for one of the items is
greater than 190.00.
*/

SELECT item, max(price) as max, min(Price) as min
from item 
GROUP BY item
HAving max>190;

/*
14. How many orders did each customer make? Use the items_ordered table. Select the
customerid, number of orders they made, and the sum of their orders if they purchased more
than 1 item. 
*/

SELECT customerid, count(*), sum(quantity) as sum
from item
GROUP BY customerid
having count(*)>1;

/* 
15. Select the lastname, firstname, and city for all customers in the customers table. Display the
results in Ascending Order based on the lastname.
*/

SELECT lastname, firstname, city
from customer
ORder by lastname asc;

-- 16. Repeat the above query, but display the results in Descending order.

SELECT lastname, firstname, city
from customer
ORder by lastname desc;

/*
17. Select the item and price for all of the items in the items_ordered table that the price is greater
than 10.00. Display the results in Ascending order based on the price. 
*/

select item, price
from item
where price > 10
order by price;

/* 
18. Select the customerid, order_date, and item from the items_ordered table for all items unless
they are 'Snow Shoes' or if they are 'Ear Muffs'. Display the rows as long as they are not either of
these two items.
*/

select customerid, order_date, item
from item
where item NOT IN ('Snow Shoes' , 'Ear Muffs');

-- 19. Select the item and price of all items that start with the letters 'S', 'P', or 'F'. 

select item, price
from item
where item regexp "^[spf]";

/* 
20. Select the date, item, and price from the items_ordered table for all of the rows that have a
price value ranging from 10.00 to 80.00.
*/

select order_date, item, price
from item
where price between 10 and 80;

/*
21. Select the firstname, city, and state from the customers table for all of the rows where the state
value is either: Arizona, Washington, Oklahoma, Colorado, or Hawaii.
*/

select firstname, city, state
from customer
where state in ('Arizona', 'Washington', 'Oklahoma', 'Colorado', 'Hawaii');

-- 22. Select the item and per unit price for each item in the items_ordered table.

select item, round(price/quantity,2)
from item;

/*
23. Write a query using a join to determine which items were ordered by each of the customers in
the customers table. Select the customerid, firstname, lastname, order_date, item, and price for
everything each customer purchased in the items_ordered table.
*/

select i.customerid, c.firstname,c.lastname,i.order_date,i.item,i.price
from item i inner join customer c
on i.customerid = c.customerid;

-- 24. Repeat the above query, however display the results sorted by state in descending order. 

select i.customerid, c.firstname,c.lastname,i.order_date,i.item,i.price
from item i inner join customer c
on i.customerid = c.customerid
order by c.state desc;

