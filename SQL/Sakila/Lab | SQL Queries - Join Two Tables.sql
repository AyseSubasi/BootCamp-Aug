
select * from film;

-- 1 How many films are there for each of the categories
SELECT category.name, COUNT(film_category.film_id)
FROM category INNER JOIN film_category
ON film_category.category_id = category.category_id GROUP BY category.name;
 
 -- 2 Which actor has appeared in the most films?
 
select actor.first_name, actor.last_name, count(film_actor.actor_id) as number_of_films
from actor inner join film_actor
on actor.actor_id=film_actor.actor_id
group by actor.last_name, actor.first_name order by count(film_actor.actor_id) desc ;
 
 -- 3 Most active customer (the customer that has rented the most number of films)
 
 select* from rental
 
 select customer.first_name, customer.last_name, count(rental.rental_id) as number_of_rental
from customer inner join rental on customer.customer_id=rental.customer_id
group by customer.first_name, customer.last_name order by count(rental.rental_id) desc;

-- 4 same question like 1 

-- 5 Display the first and last names, as well as the address, of each staff member.

select staff.first_name, staff.last_name,address.address
from staff inner join address on staff.address_id=address.address_id;

-- 6 Display the total amount rung up by each staff member in August of 2005.

select staff.first_name, staff.last_name, sum(payment.amount) from staff
inner join payment on staff.staff_id=payment.staff_id group by staff.first_name, staff.last_name;

-- 7 List each film and the number of actors who are listed for that film.

select * from film

select film.title, count(film_actor.actor_id) as number_of_actors from film 
inner join film_actor on film_actor.film_id = film.film_id group by film.title order by count(film_actor.actor_id) desc; 

-- 8 list total paid by each customer , alphabetically by last name 

select sum(payment.amount) as total_paid_by_customer, customer.last_name, customer.first_name from customer
 inner join payment on payment.customer_id=customer.customer_id group by customer.last_name, customer.first_name
 order by customer.last_name asc;

-- Bonus: most rented film? - Bucket Brotherhood
#film(title) film_id -> inventory inventory_id - > rental (rental_date)

select film.title, count(rental.rental_date) from film
inner join inventory on inventory.film_id = film.film_id
inner join rental on inventory.inventory_id = rental.inventory_id
group by film.title order by count(rental.rental_date) desc; 
