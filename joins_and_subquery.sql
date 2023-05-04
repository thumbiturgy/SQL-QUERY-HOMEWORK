--1. List all customers who live in Texas (use JOINs)
SELECT concat(first_name, ' ', last_name) AS full_name
FROM customer AS c
JOIN address AS a 
ON c.address_id = a.address_id
WHERE district = 'Texas';

--2. Get all payments above $6.99 with the Customer's Full Name
SELECT payment_id, concat(first_name, ' ', last_name) AS full_name, amount
FROM payment AS p
JOIN customer AS c 
ON p.customer_id = c.customer_id 
WHERE amount > 6.99;

--3. Show all customers names who have made payments over $175(use subqueries)
SELECT concat(first_name, ' ', last_name) AS full_name, sum(amount)
FROM customer AS c
JOIN payment AS p 
ON c.customer_id = p.customer_id 
GROUP BY first_name, last_name 
HAVING sum(amount) > 175;

--4. List all customers that live in Nepal (use the city table)
SELECT concat(first_name, ' ', last_name) AS full_name
FROM customer AS c
JOIN address AS a 
ON c.address_id = a.address_id 
JOIN city
ON a.city_id = city.city_id 
WHERE country_id = 66;

--5. Which staff member had the most transactions?
SELECT concat(first_name, ' ', last_name) AS full_name, count(payment_id)
FROM staff AS s
JOIN payment AS p 
ON s.staff_id = p.staff_id
GROUP BY first_name, last_name;

--6. How many movies of each rating are there?
SELECT rating, count(film_id)
FROM film
GROUP BY rating;

--7.Show all customers who have made a single payment above $6.99 (Use Subqueries)
SELECT concat(first_name, ' ', last_name) AS full_name, amount
FROM customer AS c
JOIN payment AS p 
ON c.customer_id = p.customer_id 
WHERE amount > 6.99
GROUP BY first_name , last_name , amount
HAVING count(amount) = 1;

--8. How many free rentals did our stores give away?
SELECT count(payment_id)
FROM payment
WHERE amount = 0;
