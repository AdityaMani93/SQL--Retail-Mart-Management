/*  Write a query to create a database named SQL basics. */
create database sqlbasics;

/* Write a query to select SQL basics. */ 
use sqlbasics;

/* Write a query to create a product table with the fields 
product code, product name, price, stock, and category,
a customer table with the fields customer ID, customer name,
customer location, and customer phone number, 
and a sales table with the fields date, order number, 
product code,product name, quantity, and price. */
CREATE TABLE sqlbasics.product(
p_code varchar(45) NOT NULL,     
p_name varchar(45) NOT NULL,     
stock varchar(45) NOT NULL,     
price INT NOT NULL,     
category varchar(45) NOT NULL,     
PRIMARY KEY(p_code));

CREATE TABLE sqlbasics.customer(
c_id VARCHAR(45) NOT NULL,     
c_name varchar(45) NOT NULL,     
c_location varchar(45) NOT NULL,     
c_phoneno int NOT NULL,     
PRIMARY KEY(c_id));

CREATE TABLE sqlbasics.sales(     
order_date DATE NOT NULL,     
order_no varchar(45) NOT NULL,     
c_id varchar(45) NOT NULL,     
c_name varchar(45) NOT NULL,     
s_code varchar(45) NOT NULL,     
p_name varchar(45) NOT NULL,     
qty INT NOT NULL,     
price INT NOT NULL,     
PRIMARY KEY(order_date));

/* Write a query to add new columns, such as serial number and categories, to the sales table */
ALTER TABLE sqlbasics.sales ADD (S_no INT,categories varchar(45));

/* Write a query to change the stock field type to varchar in the product table */
ALTER TABLE sqlbasics.product MODIFY stock varchar(45);

/*  Write a query to change the table name from customer to customer details  */
ALTER TABLE sqlbasics.customer RENAME TO sqlbasics.customer_details;

/*  Write a query to drop the sl. no. and categories columns from the sales table */
ALTER TABLE sqlbasics.sales DROP COLUMN S_no;
ALTER TABLE sqlbasics.sales DROP COLUMN categories;

/* Write a query to display the details where the category is stationary from the product table */
SELECT order_date,order_no,c_id,qty,price FROM sqlbasics.sales;

/*  Write a query to display the details where the category is stationary from the product table */
SELECT * FROM sqlbasics.product WHERE category='Stationary';

/*  Write a query to display the unique category from the product table */
SELECT DISTINCT(category) FROM sqlbasics.product;

/* Write a query to display the details of the sales from the sales table where quantity is greater than 2 and the price is less than 500 */
SELECT * FROM sqlbasics.sales WHERE qty>2 AND price < 500;

 /* . Write a query to display every customer whose name ends with an ‘a’  */
SELECT c_name FROM sqlbasics.customer_details WHERE c_name LIKE '%a';

/* . Write a query to display the product details in descending order of price  */
select * FROM sqlbasics.product ORDER BY price DESC ;

/* Write a query to display the product code and category from categories that have two or more products */
SELECT p_code,category FROM sqlbasics.product GROUP BY category HAVING COUNT(category)>=2;
/* Write a query to combine the sales and product tables based on the order number and customer's name including duplicated rows */

SELECT order_no, c_name FROM sqlbasics.sales LEFT JOIN sqlbasics.product 
ON sales.s_code = product.p_code  
UNION ALL   
SELECT order_no,c_name FROM sqlbasics.sales RIGHT JOIN sqlbasics.product 
ON sales.s_code = product.p_code;