--Question 1. I tried my best, but I'm still having issues. 
SELECT status
FROM rental
(CASE
	WHEN date rental_date + rental_duration < date(returned_date) then 'returned early'
	WHEN date rental_date + rental_duration = date(returned_date) then 'On Time'
	WHEN date rental_date + rental_duration > date(returned_date) then 'retruned late'
	END)
FROM rental;

--Question 2
Select city, SUM (amount)
From payment
LEFT JOIN customer
ON payment.customer_id = customer.customer_id
LEFT JOIN address
ON customer.address_id = address.address_id
LEFT JOIN city
ON address.city_id = city.city_id
LEFT JOIN country
ON city.country_id = country.country_id
WHERE city = 'Kansas City' OR city = 'St.Louis'
GROUP BY city;

--Question 3
SELECT category.name, COUNT(title)
FROM film
LEFT JOIN film_category
on film.film_id = film_category.film_id
LEFT JOIN category
on film_category.category_id = category.category_id
GROUP BY category.name;

--Question 4: The Category table shows the different generes while film category displays the ids.
Select * 
FROM film_category

--Question 5
SELECT film.film_id, title, film.length
FROM film
LEFT JOIN inventory
on film.film_id = inventory.film_id
LEFT JOIN rental
on inventory.inventory_id = rental.inventory_id
WHERE return_date BETWEEN '5/15/2005' AND '5/31/2005';

--Question 6
SELECT rental.rental_id
FROM rental
LEFT JOIN payment
on rental.rental_id = payment.rental_id
WHERE amount <= 4.2

SELECT AVG(amount)
FROM payment

--Question 8
EXPLAIN ANALYZE SELECT rental.rental_id
FROM rental
LEFT JOIN payment
on rental.rental_id = payment.rental_id
WHERE amount <= 4.2
-- This will count my row and measure time spent at various points with the
--execution plan. I see the cost, rows, and width as well as actual time, planning
--time and execution time




-- Question 9: For Question 5 I joined three different tables to group three different columns 
--At a certain date range. For question 3, I joined two different categories and group it by the 
-- category.name. Then I used the aggregate function to count the title of those different names

--Extra Credit: Set-based operations allow you to express operations on data as a whole, without
-- iterating through individual rows. 