-- 1
select * 
from customer
where last_name like 'T%'
order by first_name asc;
-- 2
select *
from rental
where return_date between '2005-05-28' and '2005-06-01';

-- 3
select customer.customer_id, customer.first_name as customer_first_name, customer.last_name as customer_last_name, sum(payment.amount) as total_spent
from customer
inner join rental on customer.customer_id = rental.customer_id
inner join payment on rental.rental_id = payment.rental_id
group by customer.customer_id, customer.first_name, customer.last_name
order by total_spent asc;

-- 4
select first_name, last_name, sum(payment.amount) as total_spent
from customer
inner join payment  on customer.customer_id = payment.customer_id
group by customer.customer_id, customer.first_name, customer.last_name
order by total_spent asc;

-- 5
select actor.actor_id, actor.first_name as actor_first_name, actor.last_name as actor_last_name, count(film.film_id) as film_count
from actor 
inner join film_actor  on actor.actor_id = film_actor.actor_id
inner join film on film_actor.film_id = film.film_id
where year (film.release_year) = 2006
group by actor.actor_id, actor.first_name, actor.last_name
order by film_count desc;

--6 
-- 4 in 4 first name and last name are selected from customer sum(payment.amount) finds the sum of payment in amount
-- inner join merges customer ID and payment customer ID, group by groups them and order by orders them
--5 actor_id and actor's first and last name are selected from actor table
-- film actor is the new column where actor id and film actor id are merged
-- where year finds the year and group by groups by id first and last name
-- order by desc orders in descending order.


-- 7
select category.name, avg(film.rental_rate) as average_rental_rate
from category 
inner join film_category  on category.category_id = film_category.category_id
inner join film on film_category.film_id = film.film_id
group by category.name
order by average_rental_rate;
--8
select category.category_id, category.name, count(rental.rental_id) as rental_count, sum(payment.amount) as total_sales
from category 
inner join film_category on category.category_id = film_category.category_id
inner join film on film_category.film_id = film.film_id
inner join rental on film.film_id = rental.rental_id
inner join payment on rental.rental_id = payment.rental_id
group by category.category_id, category.name
order by rental_count desc
limit 5;
