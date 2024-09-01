--Creating a satabase called SQL_Project_Aug
CREATE DATABASE Sql_Project_Aug;
--Qestion 1 (Creating a table called Cyclist Product)
CREATE TABLE Cyclist_product(
Product_id INT PRIMARY KEY,
Product_name VARCHAR(256) NOT NULL
);

--Creating a table called Cyclist Customer Behaviour
CREATE TABLE Cyclist_customer_behaviour(
Customer_id INT PRIMARY KEY,
Customer_name VARCHAR(256) NOT NULL,
Phone_Number BIGINT NOT NULL,
Email_address VARCHAR(256) UNIQUE,
Product_id INT NOT NULL,
FOREIGN KEY (Product_id) REFERENCES Cyclist_product(Product_id)
);

--Question 2 (Populate information into the Cyclist product table)
INSERT INTO Cyclist_product (Product_id, Product_name)
VALUES (1, 'Smart Watch'),
	   (2, 'Hand Brake'),
	   (3, 'Brake'),
	   (4, 'Chaining'),
	   (5, 'Brake Shiter');


--Insert records into the Cyclist_customer_behaviour table
INSERT INTO 
Cyclist_customer_behaviour (Customer_id, Customer_name, Phone_Number, Email_address, Product_id)
VALUES (1, 'Janet Jones', 801234672, 'jonesjanet@gmail.com','2'),
	   (2, 'Grace Michael', 902547815, 'MICHAELgrace@yahoo.com','3'),
	   (3, 'Alexandra Stephen', 706538915, 'alexstephen@gmail.com','5'),
	   (4, 'Helen Paul', 907652413, 'paulHELEN@outlook.com','1'),
	   (5, 'Faith Guy', 708625143, 'faithguy@gmail.com','4');

--Question 3 (Adding a new column called Product_category to the cyclist_product table
ALTER TABLE Cyclist_product
ADD Product_category CHAR(8) NULL;

SELECT*
FROM Cyclist_customer_behaviour;

SELECT *
FROM Cyclist_product;

--Question 4 (Count number of each gender in the Customer_data table)
SELECT*
FROM sales_customer_data;

SELECT
 gender,
COUNT(*) AS Gender_record
FROM 
sales_customer_data
GROUP BY
 gender;

 SELECT *
 FROM sales_data;

 --Question 5 (Using sales_data table, write a query that returns the total
 sales for all shopping mall between 2021-01-01 and 2021-03-31.
 Sort your result in descending order)

 SELECT 
	 SUM(Price) AS Total_sales,
	 shopping_mall
	 FROM
	 sales_data
	 WHERE Invoice_date BETWEEN '2021-01-01' AND '2021-03-31'
	 GROUP BY shopping_mall
	 ORDER BY shopping_mall DESC;
	 
--Question 6  Write a query to return the customer_id for customers that uses
 Cevahir AVM, Forum Istanbul and Emaar Square Mall

 SELECT
		customer_id,
		shopping_mall
FROM 
	  Sales_data
WHERE
	 shopping_mall IN ('Cevahir AVM','Forum Istanbul','Emaar Square Mall');


--Question 7  Write a query that returns the invoiceno, Customer_id, gender,
 payment method, category, price and shopping mall of customers
 that shopped between 2022-01-01 and 2022-03-31. Limit the
 result to 20

SELECT 
	TOP (20) 
	s.Customer_id,
	s.Invoice_no,
	s.Category,
	s.Price,
	s.Shopping_mall,
	c.Payment_method,
	c.Gender
FROM
	 Sales_data AS s
INNER JOIN
	 [sales_customer_data] AS c 
ON
	s.shopping_mall = s.shopping_mall
WHERE 
	Invoice_date BETWEEN '2022-01-01' AND '2022-03-31';

--Question 8  Write a query that groups the invoice date into the following: 2021-01-01 to 2021-12-31 as year 1: 2022-01-01 to 2022-12-31 as year 2:Every other record should be grouped as year 3

SELECT
	Invoice_date,
CASE
	WHEN Invoice_date <= '2021-12-31' THEN 'Year 1'
	WHEN Invoice_date BETWEEN '2022-01-01' AND '2022-12-31' THEN 'Year 2'
	ELSE 'Year 3' 
	END Year_Invoice_date
FROM
	Sales_data;



