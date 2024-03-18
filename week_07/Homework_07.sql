--Q1
Select first_name, last_name
FROM customer
WHERE last_name LIKE 'T%'
ORDER BY last_name;

--Q2
SELECT return_date
FROM rental
WHERE return_date BETWEEN '5/28/2005' AND '6/1/2005';

--Q3
SELECT title, COUNT(film.film_id)
FROM film
LEFT JOIN inventory
ON film.film_id = inventory.film_id
LEFT JOIN rental 
ON inventory.inventory_id = rental.inventory_id
GROUP BY title
ORDER BY title

--Q4
SELECT first_name, SUM(amount)
FROM customer
LEFT JOIN payment
ON customer.customer_id = payment.customer_id
GROUP BY first_name

--Q5
SELECT CONCAT(first_name,' ' , last_name) as full_name, count (release_year) as appearances
FROM actor
LEFT JOIN film_actor
ON actor.actor_id = film_actor.actor_id
LEFT JOIN film
ON film_actor.film_id = film.film_id
GROUP BY first_name, last_name

--Q6
EXPLAIN ANALYZE SELECT first_name, SUM(amount)
FROM customer
LEFT JOIN payment
ON customer.customer_id = payment.customer_id
GROUP BY first_name

--Q7
Select category.name, AVG (rental_rate)
FROM category
LEFT JOIN film_category
ON film_category.category_id = category.category_id
LEFT JOIN film
ON film.film_id = film_category.film_id
GROUP BY category.name

--Q8
Select category.name, COUNT(rental_rate)
FROM category
LEFT JOIN film_category
ON film_category.category_id = category.category_id
LEFT JOIN film
ON film.film_id = film_category.film_id
GROUP BY category.name
