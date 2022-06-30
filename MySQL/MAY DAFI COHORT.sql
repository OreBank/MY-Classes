-- MYSQL DAFI MAY COHORT
-- QUANTUM ANALYTICS 

-- SELECT STATEMENT
-- ==> USED TO FETCH ALL THE COLUMNS, MULTPLE COLUMNS OR A SINGLE COLUMN FROM A TABLE
-- ALL THE COLUMNS 
-- ==> WE USE THE * AFTER THE SELECT STATEMENT

SELECT * FROM CUSTOMERS;

-- MULTIPLE COLUMNS
-- ==> PUT THE NAMES OF THE RESPECTIVE COLUMNS AFTER THE SELECT STATEMENT
SELECT CUSTOMERNAME, CONTACTLASTNAME, CONTACTFIRSTNAME FROM CUSTOMERS;

-- SINGLE COLUMN
SELECT CUSTOMERNAME FROM CUSTOMERS;

-- REMOVING DUPLICATE ROWS
SELECT * FROM EMPLOYEES;
SELECT JOBTITLE FROM EMPLOYEES;

-- WE USE THE 'DISTINCT' KEYWORD TO FETCH UNIQUE ROWS
SELECT DISTINCT JOBTITLE FROM EMPLOYEES;

-- SELECT THE DIFFERENT OFFICECODES for our employees

-- Ridwan 

-- Oyebola 
select distinct officecode from employees;

-- FILTERING RECORDS
-- WHERE ==> KEYWORD USED FOR FILTERING RECORDS 
-- IT WORKS WITH OPERATORS AND/OR PREDICATES
-- OPERATORS ==> <,>,=,!=,<>, AND, OR, NOT

-- GET THE ALL THE INFO OF THE CUSTOMER(S) WHOSE CONTACTFIRSTNAME IS JULIE
SELECT * FROM CUSTOMERS
WHERE CONTACTFIRSTNAME = 'JULIE';

-- GET THE INFO OF THE CUSTOMER(S) WHOSE CONTACTFIRSTNAME IS  JULIE AND LASTNAME IS KING
SELECT * FROM CUSTOMERS
WHERE CONTACTFIRSTNAME = 'JULIE' AND CONTACTLASTNAME = 'KING';

-- GET THE PAYMENTS GREATER THAN $10000

SELECT * FROM PAYMENTS
WHERE AMOUNT > 10000;

-- One of our customers, Baane Mini Imports, need to know who their contact person is. 
-- Use your SQL skills to get this person NAMES and their  city;

-- PEJU
SELECT CUSTOMERNAME, CONTACTLASTNAME, CONTACTFIRSTNAME, CITY FROM customers
WHERE CUSTOMERNAME = 'Baane Mini Imports';
-- OLU
/**SELECT CUSTOMERNAME, CITY FROM CUSTOMERS
 WHERE CUSTOMERNAME = 'NAME' AND 'CITY';
**/

-- PREDICATES ==> BETWEEN, IN, LIKE

-- BETWEEN 
-- USED WHEN FILTERING WITHIN RANGE OF VALUES 
-- USED TO REPLACE THE '>= AND <=' IN A STATEMENT 

-- GET THE CUSTOMERNUMBER, CHECKNUMBER AND AMOUNTS FOR PAYMENTS THAT ARE BETWEEN $8000 AND $9000
-- BASHIRAT, LOLA, OYEBOLA

SELECT CUSTOMERNUMBER, CHECKNUMBER, AMOUNT FROM PAYMENTS
WHERE AMOUNT >= 8000 AND AMOUNT <= 9000;

-- USING PREDICATE 
SELECT CUSTOMERNUMBER, CHECKNUMBER, AMOUNT FROM PAYMENTS
WHERE AMOUNT BETWEEN 8000 AND 9000;

-- NOT 
-- USED TO NEGATE PREDICATES OR FILTERS 
SELECT CUSTOMERNUMBER, CHECKNUMBER, AMOUNT FROM PAYMENTS
WHERE AMOUNT NOT BETWEEN 8000 AND 9000;

-- IN 
-- You use the IN statement with the WHERE clause to check if the value(s) matches any value in the records
-- it is used to replace multiple = signs
-- the values are enclosed in brackets ()

-- Suppose I want to  find the offices located in the USA and France
SELECT * FROM OFFICES
WHERE COUNTRY = 'USA' OR COUNTRY = 'FRANCE'; 

SELECT COUNTRY, ADDRESSLINE1 FROM OFFICES
WHERE COUNTRY = 'USA' OR COUNTRY = 'FRANCE'; 

-- USING IN

SELECT * FROM OFFICES
WHERE COUNTRY IN ('USA', 'FRANCE');

-- NOT IN 
-- NEGATION OF IN 
SELECT * FROM OFFICES
WHERE COUNTRY NOT IN ('USA', 'FRANCE');

-- LIKE 
-- USED FOR PATTER FILTERING 
-- HAS TWO SIGNS 
-- % ==> WILDCARD, ALLOWS US TO FILTER WITH AS MANY AS POSSIBLE CHARACTERS
-- _ ==> ALLOWS US TO FILTER WITH A CHARACTER AT A TIME

-- GET THE FULL CONTACT NAMES OF CUSTOMERS WTH FIRST NAME STARTING WITH 'Je'

SELECT CONTACTFIRSTNAME, CONTACTLASTNAME FROM CUSTOMERS 
WHERE CONTACTFIRSTNAME LIKE 'Je%';

--  CUSTOMERS WTH lastname  ending WITH 'on'
SELECT CONTACTFIRSTNAME, CONTACTLASTNAME FROM CUSTOMERS 
where CONTACTLASTNAME LIKE '%on';

--  CUSTOMERS WTH lastname  ending WITH 'on' and firstname is susan 
SELECT CONTACTFIRSTNAME, CONTACTLASTNAME FROM CUSTOMERS 
where contactfirstname = 'Susan' and contactlastname like '%on';

SELECT * FROM CUSTOMERS 
where contactfirstname = 'Susan' and contactlastname like '%on';

-- To find employees whose FIRST names start with the letter j , 
-- end with the letter N AND WE KNOW THAT IT IS A 4 LETTERS NAME
SELECT CONTACTFIRSTNAME, CONTACTLASTNAME FROM CUSTOMERS 
where contactfirstname like 'J__n';

-- SORTING RECORDS 
-- USED TO ARRANGE RECORDS
-- ORDER BY ==> KEYWORD USED TO SORT RECORDS
-- WE CAN SORT RECORDS IN TWO WAYS 
-- ASCENDING ==> SMALLEST TO LARGEST, SMALL TO BIG==> 1,2,3 ...10, A,B,C...Z
-- ASC ==> ASCENDING KEYWORD
-- DESCENDING ==> HIGHEST TO LOWEST, BIG TO SMALL ==> 10,9,8...1. Z,Y,X...A
-- DESC ==> DESCENDING KEYWORD

SELECT CONTACTFIRSTNAME, CONTACTLASTNAME FROM CUSTOMERS
ORDER BY CONTACTFIRSTNAME ASC;

SELECT CUSTOMERNUMBER, CHECKNUMBER, AMOUNT FROM PAYMENTS
ORDER BY AMOUNT DESC;

-- LIMITING RECORDS 
-- LIMIT ==> KEYWORD FOR LIMITING RECORDS 
SELECT CONTACTFIRSTNAME, CONTACTLASTNAME FROM CUSTOMERS
LIMIT 10; 

SELECT CONTACTFIRSTNAME, CONTACTLASTNAME FROM CUSTOMERS
ORDER BY CONTACTFIRSTNAME ASC
LIMIT 10;

-- AGGREGATE FUNCTION 
-- THE AGGREGATE FUNCTIONS ARE USED TO PERFORM SIMPLE STATISTICAL OPERATIONS
-- THEY ARE ALWAYS IN THE SELECT STATEMENT 
-- THE COLUMN THEY ARE WORKING ARE IN BRACKETS () 

-- MIN
-- MINIMUM VALUE IN A COLUMN
SELECT MIN(AMOUNT) FROM PAYMENTS;

-- MAX
-- MAXIMUM VALUE IN A COLUMN
SELECT MAX(AMOUNT) FROM PAYMENTS;

-- SUM 
-- SUMMATION OF ALL THE VALUES IN A COLUMN
SELECT SUM(AMOUNT) FROM PAYMENTS;

-- AVG
-- THE AVERAGE MEAN OF ALL THE VALUES IN A COLUMN
SELECT AVG(AMOUNT) FROM PAYMENTS;

-- COUNT
-- FREQUENCY OF THE VALUES IN A COLUMN
-- IT RESPONDS TO THE QUESTION OF "HOW MANY"
SELECT COUNT(AMOUNT) FROM PAYMENTS;

-- ALIASES 
-- ARE USED TO RENAME COLUMNS OR TABLES 
-- AS ==> KEYWORD USED FOR RENAMING 
SELECT SUM(AMOUNT) AS TOTAL_AMOUNT FROM PAYMENTS;

-- ASSIGNMENT 
-- 01 I want to see the contactfirst name of customers that has A 'her' as the second alphabets
-- 02 We want to send out a promotional message to our  existing customers. 
-- We would need their phone numbers, first  name and last name.
-- 03 Can you get me the phone number for the person who lives at '67, rue des Cinquante Otages'
-- 04 Get the Customer ID numbers for the top 10 highest amounts

-- -----------------------------------------------------------------------------------------------------------------

-- DAY 03 
-- MYSQL 

-- ALIASES 
-- THIS IS USED TO RENAME COLUMNS OR TABLES 
-- AS ==> KEYWORD USED FOR RENAMING 
SELECT SUM(AMOUNT) AS TOTAL_AMOUNT FROM PAYMENTS;
-- OR USE A SPACE BETWEEN THE OLD NAME AND THE NEW NAME 
SELECT SUM(AMOUNT) TOTAL_AMOUNT FROM PAYMENTS;

SELECT SUM(AMOUNT) TOTAL_AMOUNT, COUNT(AMOUNT), AVG(AMOUNT)  FROM PAYMENTS;

-- GROUPING RECORDS 
SELECT * FROM PAYMENTS;

-- TO GROUP RECORDS, WE USE THE ==> 'GROUP BY' SYNTAX

-- HOW MUCH HAS EACH CUSTOMER SPENT 
SELECT CUSTOMERNUMBER, SUM(AMOUNT) AS TOTAL_AMOUNT FROM PAYMENTS
GROUP BY CUSTOMERNUMBER;

-- How many customers do we have from each country?

SELECT COUNTRY, COUNT(CUSTOMERNAME) TOTAL_CUSTOMERS FROM CUSTOMERS
GROUP BY COUNTRY ;

SELECT COUNTRY, COUNT(CUSTOMERNAME) TOTAL_CUSTOMERS FROM CUSTOMERS
GROUP BY COUNTRY 
ORDER BY TOTAL_CUSTOMERS DESC
LIMIT 5;

-- FILTERING GROUPED RECORDS
-- HAVING ==> KEYWORD USED FOR FILTERING GROUPED RECORDS 
-- IS SIMILAR IN FUNCTIONALITIES WITH WHERE i.e IT CAN DO EVERYTHING WHERE DOES 
-- IT USED THE SAME OPERATORS (<,>,=,!=) AND PREDICATES ( BETWEEN, LIKE, IN )

 -- WE WANT CUTOMERS WHO HAVE SPENT OVER $100,000
SELECT CUSTOMERNUMBER, SUM(AMOUNT) AS TOTAL_AMONT FROM PAYMENTS
GROUP BY CUSTOMERNUMBER
HAVING TOTAL_AMONT > 100000;

SELECT CUSTOMERNUMBER, SUM(AMOUNT) AS TOTAL_AMOUNT FROM PAYMENTS
GROUP BY CUSTOMERNUMBER
HAVING SUM(AMOUNT) > 100000;

-- JOINS 
-- USED TO COMBINE TWO OR TABLES TOGETHER 

-- HOW TO JOIN 

-- 01 IDENTIFY THE TABLES WE ARE JOINING 
-- 02 TAKE NOTE OF THE RELATIONSHIP KEYS (PRIMARY & FOREIGN KEYS)
-- 03 TAKE NOTE OF THE COLUMNS NEEDED AND THE TABLE THE COLUMNS APPEAR 
-- 04 MERGE THE COLUMNS TOGETHER IN A SINGLE SELECT STATEMENT
-- 05 STATE THE JOIN TYPE AFTER THE FROM KEYWORD
-- 06 ADD THE SECOND TABLE 
-- 07 INTRODUCE THE JOINING CONDITION = (ON) WITH RELATIONSHIP
-- 08 TO AVOID AMBIGOUS COLUMN:
	-- WE CAN ALIAS OUR TABLES NAMES 
	-- WE USE THE TABLE.COLUMNNAME FOR THE AMBIGOUS COLUMN


-- TYPES OF JOINS 
-- INNER
-- lets get the names of customers that patronizes the company
SELECT * FROM CUSTOMERS;
-- CUSTOMERNAME, CUSTOMERNUMBER
SELECT * FROM PAYMENTS;
-- AMOUNT, CUSTOMERNUMBER 

-- RELATIONSHIP KEY ==> CUSTOMERNUMBER 
-- DEVELLOPING THE JOIN QUERRY

SELECT CUSTOMERNAME, CUSTOMERS.CUSTOMERNUMBER, AMOUNT, PAYMENTS.CUSTOMERNUMBER
FROM CUSTOMERS  INNER JOIN PAYMENTS
ON CUSTOMERS.CUSTOMERNUMBER = PAYMENTS.CUSTOMERNUMBER;

SELECT CUSTOMERNAME, C.CUSTOMERNUMBER, AMOUNT, P.CUSTOMERNUMBER
FROM CUSTOMERS AS C INNER JOIN PAYMENTS AS P
ON C.CUSTOMERNUMBER = P.CUSTOMERNUMBER;

-- WITH 3 TABLES 
SELECT CUSTOMERNAME, CUSTOMERS.CUSTOMERNUMBER, AMOUNT, PAYMENTS.CUSTOMERNUMBER, orderNumber
FROM CUSTOMERS INNER JOIN PAYMENTS 
ON CUSTOMERS.CUSTOMERNUMBER = PAYMENTS.CUSTOMERNUMBER
INNER JOIN orders 
ON PAYMENTS.CUSTOMERNUMBER = ORDERS.customerNumber;

-- LEFT 
SELECT CUSTOMERNAME, CUSTOMERS.CUSTOMERNUMBER, AMOUNT, PAYMENTS.CUSTOMERNUMBER
FROM CUSTOMERS  LEFT JOIN PAYMENTS
ON CUSTOMERS.CUSTOMERNUMBER = PAYMENTS.CUSTOMERNUMBER;

-- RIGHT
-- FULL 

-- UNIONS 
-- WE COMBINE COLUMNS OR RESULTS OF SELECT STATEMENTS

-- RULES
-- 1.	Both queries must return the same number of columns
-- 2.	The corresponding columns in the queries must have compatible data types

-- UNION ==> MERGES WITHOUT DUPLICATE 
-- UNION ALL ==> MERGES WITH THE DUPLICATES

-- Suppose that you want to combine the first name and 
-- last name of employees and customers CONTACTS into a single result set,

SELECT LASTNAME, FIRSTNAME FROM EMPLOYEES
UNION 
SELECT CONTACTLASTNAME, CONTACTFIRSTNAME FROM CUSTOMERS;

SELECT LASTNAME, FIRSTNAME FROM EMPLOYEES
UNION ALL
SELECT CONTACTLASTNAME, CONTACTFIRSTNAME FROM CUSTOMERS

-- DATA DEFINITION LANGUAGE 

-- CREATE 
-- USED TO CREATE TABLES

-- DROP
-- USED TO DELETE TABLES

-- INSERT INTO 
-- USED TO INSERT RECORDS OR VALUES INTO A TABLE

-- MISCELLEANOUS 

-- PRACTICE! PRACTICE!! PRACTICE!!!

-- CONNECT WITH ME ON LINKEDIN 

-- ABDULLAH BANKOLE
-- LINKEDIN = www.linkedin.com/in/abdullahbankole/
