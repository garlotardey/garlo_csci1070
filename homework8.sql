-- 1
--alter table rental
--add status varchar(10);
--update rental
--set status = case
--	when return_date > rental_date then 'late'
--	when return_date < rental_date then 'early'
--	when return_date = rental_date then 'on time'
--	else 'wrong'
-- end;
-- already made the file but when i tried running the code again, it says the file already exists

-- 2
select sum(payment.amount) as total_payment
from payment
inner join customer on customer.customer_id = payment.customer_id
inner join address on address.address_id = customer.address_id
inner join city on city.city_id = address.city_id
where city.city in ('Kansas City', 'Saint Louis');

--3
select category.name, count(film.film_id)
FROM film
inner join film_category on film.film_id = film_category.film_id
inner join category on film_category.category_id = category.category_id
group by category.name; 

--4
-- The film_category table is like a bridge between film and category so you can use the two of them

-- 5
select film.film_id, film.title, film.length
from rental
inner join inventory on rental.inventory_id = inventory.inventory_id
inner join film on inventory.film_id = film.film_id
where rental.return_date between '2005-05-15' and '2005-05-31';

-- 6
select film.film_id, film.title, film.rental_rate
from film
where film.rental_rate < (select avg(film.rental_rate) from film);

-- 7
SELECT status, COUNT(*) AS count
FROM rental
GROUP BY status;

-- 8
SELECT film.title, film.length,
    PERCENT_RANK() OVER (ORDER BY film.length ASC) * 100 AS duration_percentile
FROM film;

--9
-- 9.1 for query 2   
-- the query uses multiple inner joins, on payment, customer, city, and address
-- in Query 3 
-- Inner join is used to combine the columns and group by is used
-- to group by the Category.name which provides a unique category.
-- the count function is used 

--EXTRA CREDIT
-- 