# <p align="center">Customer Analysis</p>
# <p align="center">![Pic](https://ibb.co/cc0LMgK)</p>

**Tools Used:** Excel, MySQL

[Datasets Used](https://github.com/saranshguptasg/CaseStudy-with-MySQL-1/tree/main/DataSet)

[SQL Analysis (Code)](https://github.com/saranshguptasg/CaseStudy-with-MySQL-1/blob/main/Case%20Study%201.sql)

## Business Problem Statement
The objective of this case study is to analyze the purchasing patterns of customers and derive meaningful insights from the sales data of a retail business. The database consists of two main tables: items_ordered and customers. The items_ordered table records the details of items purchased by customers, while the customers table contains customer information. By analyzing this data, the goal is to understand customer preferences, identify high-value products, and optimize sales strategies. The specific business problems we aim to address include:

1. Identifying the most popular and least popular products.
2. Understanding the purchasing behavior of different customer segments.
3. Analyzing the geographic distribution of customers and their purchase patterns.
4. Determining price sensitivity and trends in product pricing.
5. Evaluating the overall sales performance and identifying key areas for improvement.

## Plan to Solve the Problem
To address these business problems, a structured approach was followed using SQL queries to extract and analyze relevant data from the items_ordered and customers tables. Below is a detailed plan for solving the identified business problems:

#### 1. Identifying Popular and Unpopular Products:

- Popular Products: Extract a list of items and their respective order counts to identify which products are ordered most frequently.
- Unpopular Products: Identify items with the least number of orders or those ordered only once.
Understanding Purchasing Behavior:

#### 2. Understanding Purchasing Behavior:

- Analyze the number of orders and the total spending of each customer to understand their purchasing frequency and average expenditure.
- Identify purchasing trends by examining the items purchased by different customer segments (e.g., based on customer ID or geographic location).

#### 3. Geographic Distribution of Customers:

- Group customers by state and count the number of customers in each state to understand the geographic distribution.
- Analyze the purchasing patterns of customers from different states to identify regional preferences and trends.

#### 4. Price Sensitivity and Product Pricing Trends:

- Calculate the maximum, minimum, and average prices of items to understand the pricing distribution.
- Identify items with significant price variations and analyze their impact on sales.

#### 5. Evaluating Sales Performance:

- Calculate the total number of orders and the total revenue generated to evaluate overall sales performance.
- Identify high-value customers and products that contribute significantly to revenue.

### Creating Database and Importing CSV file
```mysql
CREATE DATABASE Item;
USE Item;
```
### Converting imported data into correct data type for analysis
```mysql
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
```
### Item Table
```mysql
SELECT *
FROM item
LIMIT 10;
```
Result:

![Item Table](https://github.com/saranshguptasg/CaseStudy-with-MySQL-1/blob/main/Result%20Screenshot/Item%20Table.png)

### Customer Table
```mysql
SELECT *
FROM customer
LIMIT 10;
```
Result:

![Customer Table](https://github.com/saranshguptasg/CaseStudy-with-MySQL-1/blob/main/Result%20Screenshot/Customer%20Table.png)

## Questions I Wanted To Answer From the Dataset:

### 1. From the items_ordered table, select a list of all items purchased for customerid = 10449. Display the customerid, item, and price for this customer.

```mysql
SELECT customerid, item, price
FROM item
WHERE customerid = 10449;
```
Result: 

![Q1](https://github.com/saranshguptasg/CaseStudy-with-MySQL-1/blob/main/Result%20Screenshot/Q1.png)

### 2. Select all columns from the items_ordered table for whoever purchased a Tent.

```mysql
SELECT *
FROM item
WHERE item = "Tent";
```
Result: 

![Q2](https://github.com/saranshguptasg/CaseStudy-with-MySQL-1/blob/main/Result%20Screenshot/Q2.png)

### 3. Select the customerid, order_date, and item values from the items_ordered table for any items in the item column that start with the letter "S".

```mysql
SELECT customerid, order_date, item, price
FROM item
WHERE item LIKE "S%";
```
Result: 

![Q3](https://github.com/saranshguptasg/CaseStudy-with-MySQL-1/blob/main/Result%20Screenshot/Q3.png)

### 4. Select the distinct items in the items_ordered table. In other words, display a listing of each of the unique items from the items_ordered table.

```mysql
SELECT item
FROM item
GROUP BY item
HAVING count(*) =1;
```
Result: 

![Q4](https://github.com/saranshguptasg/CaseStudy-with-MySQL-1/blob/main/Result%20Screenshot/Q4.png)

### 5. Select the maximum price of any item ordered in the items_ordered table. Hint: Select the maximum price only.

```mysql
SELECT max(price)
FROM item;
```
Result: 

![Q5](https://github.com/saranshguptasg/CaseStudy-with-MySQL-1/blob/main/Result%20Screenshot/Q5.png)

### 6. Select the average price of all of the items ordered that were purchased in the month of Dec.

```mysql
SELECT avg(price)
FROM item
WHERE month(order_date) = 12;
```
Result: 

![Q6](https://github.com/saranshguptasg/CaseStudy-with-MySQL-1/blob/main/Result%20Screenshot/Q6.png)

### 7. What are the total number of rows in the items_ordered table?

```mysql
SELECT count(*) as Total_Rows
FROM item;
```
Result: 

![Q7](https://github.com/saranshguptasg/CaseStudy-with-MySQL-1/blob/main/Result%20Screenshot/Q7.png)

### 8. For all of the tents that were ordered in the items_ordered table, what is the price of the lowest tent? 

```mysql
SELECT min(price)
FROM item
WHERE item = "tent";
```
Result: 

![Q8](https://github.com/saranshguptasg/CaseStudy-with-MySQL-1/blob/main/Result%20Screenshot/Q8.png)

### 9. How many people are in each unique state in the customers table? Select the state and display the number of people in each. Hint: count is used to count rows in a column, sum works on numeric data only.

```mysql
SELECT state , count(*)
FROM customer
GROUP BY state;
```
Result: 

![Q9](https://github.com/saranshguptasg/CaseStudy-with-MySQL-1/blob/main/Result%20Screenshot/Q9.png)

### 10. From the items_ordered table, select the item, maximum price, and minimum price for each specific item in the table.

```mysql
SELECT item, max(price) as max, min(price) as min
FROM item
GROUP BY item;
```
Result: 

![Q10](https://github.com/saranshguptasg/CaseStudy-with-MySQL-1/blob/main/Result%20Screenshot/Q10.png)

### 11. How many orders did each customer make? Use the items_ordered table. Select the customerid, number of orders they made, and the sum of their orders. Click the Group By answers link below if you have any problems. 

```mysql
SELECT customerid, count(*) as Total_orders, sum(price) as Total_price
FROM item
GROUP BY customerid;
```
Result: 

![Q11](https://github.com/saranshguptasg/CaseStudy-with-MySQL-1/blob/main/Result%20Screenshot/Q11.png)

### 12. How many people are in each unique state in the customers table that have more than one person in the state? Select the state and display the number of how many people are in each if it's greater than 1.

```mysql
SELECT state, count(*)
from customer
GROUP BY state
Having count(*)>1;
```
Result: 

![Q12](https://github.com/saranshguptasg/CaseStudy-with-MySQL-1/blob/main/Result%20Screenshot/Q12.png)

### 13. From the items_ordered table, select the item, maximum price, and minimum price for each specific item in the table. Only display the results if the maximum price for one of the items is greater than 190.00.

```mysql
SELECT item, max(price) as max, min(Price) as min
from item 
GROUP BY item
HAving max>190;
```
Result: 

![Q13](https://github.com/saranshguptasg/CaseStudy-with-MySQL-1/blob/main/Result%20Screenshot/Q13.png)

### 14. How many orders did each customer make? Use the items_ordered table. Select the customerid, number of orders they made, and the sum of their orders if they purchased more than 1 item. 

```mysql
SELECT customerid, count(*), sum(quantity) as sum
from item
GROUP BY customerid
having count(*)>1;
```
Result: 

![Q14](https://github.com/saranshguptasg/CaseStudy-with-MySQL-1/blob/main/Result%20Screenshot/Q14.png)

### 15. Select the lastname, firstname, and city for all customers in the customers table. Display the results in Ascending Order based on the lastname.

```mysql
SELECT lastname, firstname, city
from customer
ORder by lastname asc;
```
Result: 

![Q15](https://github.com/saranshguptasg/CaseStudy-with-MySQL-1/blob/main/Result%20Screenshot/Q15.png)

### 16. Repeat the above query, but display the results in Descending order. 

```mysql
SELECT lastname, firstname, city
from customer
ORder by lastname desc;
```
Result: 

![Q16](https://github.com/saranshguptasg/CaseStudy-with-MySQL-1/blob/main/Result%20Screenshot/Q16.png)

### 17. Select the item and price for all of the items in the items_ordered table that the price is greater than 10.00. Display the results in Ascending order based on the price. 

```mysql
select item, price
from item
where price > 10
order by price;
```
Result: 

![Q17](https://github.com/saranshguptasg/CaseStudy-with-MySQL-1/blob/main/Result%20Screenshot/Q17.png)

### 18. Select the customerid, order_date, and item from the items_ordered table for all items unless they are 'Snow Shoes' or if they are 'Ear Muffs'. Display the rows as long as they are not either of these two items.

```mysql
select customerid, order_date, item
from item
where item NOT IN ('Snow Shoes' , 'Ear Muffs');
```
Result: 

![Q18](https://github.com/saranshguptasg/CaseStudy-with-MySQL-1/blob/main/Result%20Screenshot/Q18.png)

### 19. Select the item and price of all items that start with the letters 'S', 'P', or 'F'.  

```mysql
select item, price
from item
where item regexp "^[spf]";
```
Result: 

![Q19](https://github.com/saranshguptasg/CaseStudy-with-MySQL-1/blob/main/Result%20Screenshot/Q19.png)

### 20. Select the date, item, and price from the items_ordered table for all of the rows that have a price value ranging from 10.00 to 80.00.


```mysql
select order_date, item, price
from item
where price between 10 and 80;
```
Result: 

![Q20](https://github.com/saranshguptasg/CaseStudy-with-MySQL-1/blob/main/Result%20Screenshot/Q20.png)

### 21. Select the firstname, city, and state from the customers table for all of the rows where the state value is either: Arizona, Washington, Oklahoma, Colorado, or Hawaii. 

```mysql
select firstname, city, state
from customer
where state in ('Arizona', 'Washington', 'Oklahoma', 'Colorado', 'Hawaii');
```
Result: 

![Q21](https://github.com/saranshguptasg/CaseStudy-with-MySQL-1/blob/main/Result%20Screenshot/Q21.png)

### 22. Select the item and per unit price for each item in the items_ordered table.

```mysql
select item, round(price/quantity,2)
from item;
```
Result: 

![Q22](https://github.com/saranshguptasg/CaseStudy-with-MySQL-1/blob/main/Result%20Screenshot/Q22.png)

### 23. Write a query using a join to determine which items were ordered by each of the customers in the customers table. Select the customerid, firstname, lastname, order_date, item, and price for everything each customer purchased in the items_ordered table. 

```mysql
select i.customerid, c.firstname,c.lastname,i.order_date,i.item,i.price
from item i inner join customer c
on i.customerid = c.customerid;
```
Result: 

![Q23](https://github.com/saranshguptasg/CaseStudy-with-MySQL-1/blob/main/Result%20Screenshot/Q23.png)

### 24. Repeat the above query, however display the results sorted by state in descending order.

```mysql
select i.customerid, c.firstname,c.lastname,i.order_date,i.item,i.price
from item i inner join customer c
on i.customerid = c.customerid
order by c.state desc;
```
Result: 

![Q24](https://github.com/saranshguptasg/CaseStudy-with-MySQL-1/blob/main/Result%20Screenshot/Q24.png)

# Conclusion

The analysis of the items_ordered and customers tables revealed valuable insights into customer purchasing behavior, product popularity, and overall sales performance. The key findings include:

- **Product Popularity:** Identified the most and least popular products, helping to inform inventory and marketing strategies.
- **Purchasing Behavior:** Gained an understanding of customer purchasing patterns, including the frequency of orders and total spending per customer, allowing for targeted marketing and personalized customer experiences.
- **Geographic Distribution:** Analyzed the geographic distribution of customers and their purchasing behaviors, aiding in the development of region-specific marketing campaigns and stock distribution plans.
- **Price Sensitivity:** Examined price trends and variations to understand customer price sensitivity, which can be leveraged to optimize pricing strategies and promotional offers.
- **Sales Performance:** Evaluated overall sales performance, including total orders and revenue, and identified high-value customers and products, facilitating better resource allocation and business planning.

By leveraging these insights, the retail business can make data-driven decisions to enhance inventory management, marketing effectiveness, and customer satisfaction. The structured approach to querying and analyzing the data ensures that the business problems are comprehensively addressed, paving the way for improved operational efficiency and increased profitability.
