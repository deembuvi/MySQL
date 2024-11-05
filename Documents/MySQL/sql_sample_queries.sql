-- 1.Retrieve all data and columns from customers and orders
SELECT *
FROM customers;
SELECT *
FROM orders;

-- 2.Retrieve only first name and country of all customers 
SELECT first_name,country
FROM customers;

-- 3.List all countries of all customers without duplicates
SELECT DISTINCT(country)
FROM customers;

-- 4.Retrieve all the customers where the result is sorted by score from smallest and the reverse
SELECT*
FROM customers
ORDER BY score ASC;
SELECT*
FROM customers
ORDER BY score DESC;

-- 5.Retrieve all the customers, sorting the result by country(alphabetically) and then by score (highest first)
SELECT *
FROM customers
ORDER BY country, score DESC;

-- 6.List only German customers
SELECT*
FROM customers
WHERE country= 'Germany';

-- 7.Find all customers whose score is higher than 500 and also less than 500
SELECT*
FROM customers
WHERE score>500;
SELECT*
FROM customers
WHERE score<500;

-- 8.Find all customers whose score is less than or equal to 500
SELECT*
FROM customers
WHERE score <=500;

-- 8.Find all customers whose score is higher than or equal to 500
SELECT*
FROM customers
WHERE score >=500;

-- 9. Find all non-german customers
SELECT*
FROM customers
WHERE country != 'Germany'; 

-- 10. Find all customers who come from Germany and whose score is less than 500
SELECT*
FROM customers
WHERE country='Germany'
HAVING score<500;
-- can also be executed as 
SELECT*
FROM customers
WHERE country='Germany'
AND score<500;

-- 11. Find all customers who come from Germany OR whose score is less than 500
SELECT*
FROM customers
WHERE country='Germany' OR score <=500;

-- 12. Find all customers whose score is not less than 400
SELECT*
FROM customers
WHERE NOT score<400;

-- 13. Find all customers whose score falls in the range between 100 and 500
SELECT*
FROM customers
WHERE score BETWEEN 100 AND 500;

-- 14. Find all customers whose ID is equal to 1,2 or 5
SELECT*
FROM customers
WHERE customer_id IN (1,2,5);

-- 15. Find all customers whose  first name starts with M
SELECT*
FROM customers
WHERE first_name LIKE 'M%';

-- 16. Find all customers whose first name ends with n
SELECT*
FROM customers
WHERE first_name LIKE '%n';

-- 17. Find customers whose first name contains r
SELECT*
FROM customers
WHERE first_name LIKE '%r%';

-- 18. Find customers whose first name contain r in 3rd position
SELECT*
FROM customers
WHERE first_name LIKE '__r%';

-- 19. List customer ID, first name, order ID, quantity, exclude the customers who have not placed any orders
SELECT*
FROM customers;
SELECT*
FROM orders;
SELECT c.customer_id,
		c.first_name,
        o.order_id,
        o.quantity
FROM customers AS c
INNER JOIN orders AS o
ON c.customer_id=o.customer_id;

-- 20. List customer id, first name, order id, quantity include the customers who have not placed any orders
SELECT*
FROM customers;
SELECT*
FROM orders;
SELECT c.customer_id,
		c.first_name,
        o.order_id,
        o.quantity
FROM customers AS c
LEFT JOIN orders AS o
ON c.customer_id=o.customer_id;

-- 21. List customer id, first name, order id, quantity, include all orders regardless of whether there is a matching customer or not
SELECT c.customer_id,
		c.first_name,
        o.order_id,
        o.quantity
FROM customers AS c
RIGHT JOIN orders AS o
ON c.customer_id=o.customer_id;

-- 22. List customer id, first name, order id, quantity. Include everything, all orders and all customers
SELECT c.customer_id,
		c.first_name,
        o.order_id,
        o.quantity
FROM customers AS c
LEFT JOIN orders AS o
ON c.customer_id=o.customer_id
UNION
SELECT c.customer_id,
		c.first_name,
        o.order_id,
        o.quantity
FROM customers AS c
RIGHT JOIN orders AS o
ON c.customer_id=o.customer_id;

-- 23. List first name, last name, and country of all persons from customers and employees
SELECT first_name, last_name, country
FROM customers
UNION ALL
SELECT first_name, last_name, emp_country
FROM employees;

-- 24. Find the total number of customers
SELECT COUNT(*) AS total_customers
FROM customers;

-- 25. Find the total quantity of all orders
SELECT*
FROM orders;
SELECT SUM(quantity) AS total_order
FROM orders;

-- 26. Find the average score of all customers
SELECT AVG(score) as avg_score
FROM customers;

-- 27. Find the highest score of all customers
SELECT MAX(score) AS highest_score
FROM customers;

-- 28. List all customer names, where the name is a combination of the first name and last names.
SELECT CONCAT(first_name,' ',last_name) AS full_name
FROM customers;

-- 29. List the first name of all customers to be in uppercase
SELECT UPPER (first_name) AS upper_case_first_name
FROM customers;

-- 30. Find the length of the last name of all customers
SELECT LENGTH(last_name)
FROM customers;

-- 31. Subtract 3 characters from last name of all customers, starting from the 2nd position
SELECT last_name,
SUBSTRING(last_name,2,3) AS sub_last_name
FROM customers;

-- 32. Find the total number of customers for each country
SELECT COUNT(*) AS customers_per_country,
 country
FROM customers
GROUP BY country;

-- 33. Find the total number of customers for each country and sort the result by total (lowest first)
SELECT COUNT(*) AS customers_per_country,
	country
FROM customers
GROUP BY country
ORDER BY COUNT(*) ASC;

-- 34. Find the highest score of all customers for each country
SELECT MAX(score) AS highest_score,
	country
FROM customers
GROUP BY country;

-- 35. Find the total number of customers for each country and only include countries that have more than one customer
SELECT COUNT(*) AS customers_per_country,country
FROM customers
GROUP BY country
HAVING COUNT(*)>1;

-- 36. Find all orders placed from customers whose score is higher than 500 using customer id
SELECT *
FROM orders
WHERE customer_id IN
 (SELECT customer_id
FROM customers
WHERE score>500);

-- THE TABLES WERE CREATED/ALTERED MANUALLY ON THE MYSQL WORKSHEET WITHOUT CODE
-- 37. Insert new customer Anna Nixon from UK
-- 38. Insert new customer Max Lang
-- 39. Change the country of customer id 7 to Germany 
-- 40. Change the score of the customer Anna to 100 and her country from UK to USA
-- 41. Delete both new customers and Anna and Max from the data base
DELETE FROM customers 
WHERE customer_id IN (6,7);
-- 42. Create a new table called persons with 4 columns: ID, person name, birthdate, and phone
-- 43. Add a new column called email to the table persons