USE sakila;

#This answers 1a
SELECT first_name, last_name FROM actor;

#This Answers 1b
SELECT CONCAT(first_name, ' ', last_name) FROM actor AS full_name;

#This Answers 2a
SELECT actor_id, first_name, last_name FROM actor
	WHERE first_name = "Joe";

#This Answers 2b
SELECT * FROM actor
	WHERE last_name LIKE "%gen%";
 
#This Answers 2c 
SELECT * FROM actor
	WHERE last_name LIKE "%li%"
    ORDER BY last_name, first_name ASC;
    
#This Answers 2d 
SELECT country_id, country
FROM country
WHERE country IN ("Afghanistan", "Bangladesh", "China");

#This Answers 3a 
ALTER TABLE actor
ADD description BLOB;

#This Answers 3b
ALTER TABLE actor
DROP COLUMN description;


#This Answers 4a
SELECT  last_name, COUNT(last_name)
FROM actor
GROUP BY last_name
ORDER BY COUNT(last_name) DESC;

#This Answers 4b
SELECT  last_name, COUNT(last_name)
FROM actor
GROUP BY last_name
HAVING COUNT(last_name) >= 2
ORDER BY COUNT(last_name) DESC;


#This Answers 4c
UPDATE actor
SET first_name = "HARPO"
WHERE first_name = "GROUCHO" AND last_name = "WILLIAMS";

#This Answers 4d
UPDATE actor
SET first_name = "GROUCHO"
WHERE first_name = "HARPO" AND last_name = "WILLIAMS";

#This Answers 5a
SHOW CREATE TABLE address;

#This Answers 6a
SELECT staff.first_name, staff.last_name, address.address
FROM address
INNER JOIN staff ON
staff.address_id=address.address_id;

#This Answers 6b
SELECT staff.staff_id, staff.first_name, staff.last_name, payment.mySUM
FROM  staff
INNER JOIN 
	(SELECT staff_id, SUM(amount) AS mySUM FROM payment
	GROUP BY staff_id)
	payment ON
	staff.staff_id = payment.staff_id;

#This Answers 6c
SELECT film.title, film_actor.ACTOR_COUNT
FROM film
INNER JOIN
	(SELECT film_id, COUNT(actor_id) AS ACTOR_COUNT FROM film_actor
	GROUP BY film_id) 
    film_actor ON
    film.film_id = film_actor.film_id;
    
#This answers 6d
SELECT film.film_id, film.title, inventory.MYCOUNT
FROM film
INNER JOIN
	(SELECT film_id, COUNT(store_id) AS MYCOUNT FROM inventory
    GROUP BY film_id) 
    inventory ON
    film.film_id = inventory.film_id
WHERE film.title = "Hunchback Impossible";

#This answers 6e
SELECT customer.first_name, customer.last_name, payment.CUSTOMER_PAYMENT
FROM  customer
INNER JOIN 
	(SELECT customer_id, SUM(amount) AS CUSTOMER_PAYMENT FROM payment
	GROUP BY customer_id)
	payment ON
	customer.customer_id = payment.customer_id
ORDER BY last_name ASC;

#This Answers 7a
#Tried using LIKE "[QK]%" But it did not work
SELECT * 
FROM film
WHERE title LIKE "q%" AND language_id = 1;

SELECT * 
FROM film
WHERE title LIKE "k%" AND language_id = 1;

#This answers 7b
SELECT DISTINCT film.title, actor.first_name, actor.last_name
FROM film
INNER JOIN film_actor
	ON film.film_id = film_actor.film_id
INNER JOIN actor
	ON film_actor.actor_id = actor.actor_id
WHERE film.title =  "Alone Trip"; 

#This answers 7c
SELECT customer.first_name, customer.last_name, address.address, country.country
FROM customer
INNER JOIN address
	ON customer.address_id = address.address_id
INNER JOIN city
	ON address.city_id = city.city_id
INNER JOIN country
	ON city.country_id = country.country_id
WHERE country = "Canada";

#This answers 7d
SELECT film.title, category.name
FROM film
INNER JOIN film_category 
	ON film.film_id = film_category.film_id
INNER JOIN category
	ON film_category.category_id = category.category_id
WHERE category.name = "Family";


    
