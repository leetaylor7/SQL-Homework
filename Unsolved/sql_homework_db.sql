USE sakila;

SELECT first_name FROM actor;

SELECT first_name, last_name FROM actor;

SELECT actor_id, first_name, last_name FROM actor
	WHERE first_name = "Joe";
    
SELECT * FROM actor
	WHERE last_name LIKE "%gen%";
    
SELECT * FROM actor
	WHERE last_name LIKE "%li%"
    ORDER BY last_name, first_name ASC;
    

SELECT country_id, country
FROM country
WHERE country IN ("Afghanistan", "Bangladesh", "China");

ALTER TABLE actor
ADD description BLOB;

ALTER TABLE actor
DROP COLUMN description;

SELECT  last_name, COUNT(last_name)
FROM actor
GROUP BY last_name
ORDER BY COUNT(last_name) DESC;

SELECT  last_name, COUNT(last_name)
FROM actor
GROUP BY last_name
HAVING COUNT(last_name) >= 2
ORDER BY COUNT(last_name) DESC;

UPDATE actor
SET first_name = "HARPO"
WHERE first_name = "GROUCHO" AND last_name = "WILLIAMS";

UPDATE actor
SET first_name = "GROUCHO"
WHERE first_name = "HARPO" AND last_name = "WILLIAMS";

SHOW CREATE TABLE address;

SELECT staff.first_name, staff.last_name, address.address
FROM address
INNER JOIN staff ON
staff.address_id=address.address_id;

SELECT staff.staff_id, staff.first_name, staff.last_name, payment.mySUM
FROM  staff
INNER JOIN 
	(SELECT staff_id, SUM(amount) AS mySUM FROM payment
	GROUP BY staff_id)
	payment ON
	staff.staff_id = payment.staff_id;


SELECT customer.first_name, customer.last_name, payment.mySUM
FROM customer
INNER JOIN 
	(SELECT customer_id, SUM(amount) AS mySUM FROM payment
	GROUP BY customer_id) payment ON
	customer.customer_id=payment.customer_id;


