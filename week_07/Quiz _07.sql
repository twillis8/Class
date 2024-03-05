--Question 1
select *
from payment
where amount >= 9.99;

-- Question 2
Select amount, title
from payment p
left join rental r
on p.customer_id = r.customer_id
Left join inventory i
on r.inventory_id = i.inventory_id
Left join film f
on i.film_id = f.film_id
where amount = 11.99

-- Question 3
Select first_name, last_name, email, address, city, country
from staff s 
left join address a
on s.address_id = a.address_id
left join city c
on a.city_id = c.city_id
left join country l
on c.country_id =l.country_id

--Question 4
-- Im interested in agriculture companies and im interested in the video game industry.

