-- 1
select * 
from customer
where last_name like 'T%'
order by first_name asc;
-- 2
select *
from rental
where return_date between '2005-05-28' AND '2005-06-01';

-- 3
SELECT customer.customer_id, customer.first_name AS customer_first_name, customer.last_name AS customer_last_name, SUM(payment.amount) AS total_spent
FROM customer
INNER JOIN rental ON customer.customer_id = rental.customer_id
INNER JOIN payment ON rental.rental_id = payment.rental_id
GROUP BY customer.customer_id, customer.first_name, customer.last_name
ORDER BY total_spent ASC;


-- 4
SELECT first_name, last_name, SUM(payment.amount) AS total_spent
FROM customer
INNER JOIN payment  ON customer.customer_id = payment.customer_id
GROUP BY customer.customer_id, customer.first_name, customer.last_name
ORDER BY total_spent ASC;

-- 5
SELECT actor.actor_id, actor.first_name AS actor_first_name, actor.last_name AS actor_last_name, COUNT(film.film_id) AS film_count
FROM actor 
INNER JOIN film_actor  ON actor.actor_id = film_actor.actor_id
INNER JOIN film ON film_actor.film_id = film.film_id
WHERE YEAR (film.release_year) = 2006
GROUP BY actor.actor_id, actor.first_name, actor.last_name
ORDER BY film_count DESC;

--6 
-- 4 in 4 first name and last name are selected from customer sum(payment.amount) finds the sum of payment in amount
-- inner join merges customer ID and payment customer ID, group by groups them and order by orders them
--5 actor_id and actor's first and last name are selected from actor table
-- film actor is the new column where actor id and film actor id are merged
-- where year finds the year and group by groups by id first and last name
-- order by desc orders in descending order.


-- 7
SELECT category.name, AVG(film.rental_rate) AS average_rental_rate
FROM category 
INNER JOIN film_category  ON category.category_id = film_category.category_id
INNER JOIN film ON film_category.film_id = film.film_id
GROUP BY category.name
ORDER BY average_rental_rate;
--8
SELECT category.category_id, category.name, COUNT(rental.rental_id) AS rental_count, SUM(payment.amount) AS total_sales
FROM category 
INNER JOIN film_category ON category.category_id = film_category.category_id
INNER JOIN film ON film_category.film_id = film.film_id
INNER JOIN rental ON film.film_id = rental.rental_id
INNER JOIN payment ON rental.rental_id = payment.rental_id
GROUP BY category.category_id, category.name
ORDER BY rental_count DESC
LIMIT 5;
