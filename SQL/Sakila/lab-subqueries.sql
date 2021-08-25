use sakila;

-- 1 How many copies of the film Hunchback Impossible exist in the inventory system?

select count(inventory_id) from inventory where film_id in(
select film_id from film where title = "Hunchback Impossible");

 -- join
select count(i.inventory_id) as copies, f. title from inventory i 
join film f on f.film_id = i.film_id group by f.title having title = "Hunchback Impossible";
# result result: 6 copies


-- 2 List all films whose length is longer than the average of all the films.
select avg(length) from film;

select f.title, f.length from film f having f.length > (select avg(length) from film) order by f.length desc;
#one result - > chicago north length 185


-- 3 Use subqueries to display all actors who appear in the film Alone Trip. 
#actor(actor_id) ->  film_actor (film_id) -> film title
 
select first_name, last_name from actor where actor_id in (
select actor_id from film_actor where film_id in ( 
select film_id from film where title = "Alone Trip"));


-- 4 Identify all movies categorized as family film
# film (film_id) -> film_category ( category_id) -> category

select title from film where film_id in (
select film_id from film_category where category_id in (
select category_id from category where name="Family"));

-- 5 get name and email from customers from Canada using subqueries + join 

#customer (address_id) - > address (city_id) - > city (country_id) -> country

 -- subquerie --
select first_name, last_name, email from customer where address_id in (
select address_id from address where city_id in (
select city_id from city where country_id in (
select country_id from country where country = "Canada")));

 -- join --
 
select c.first_name, c.last_name, c.email from customer c join address a on c.address_id = a.address_id
 inner join city ci on ci.city_id = a.city_id 
 inner join country co on ci.country_id = co.country_id;
 
 
 -- 6 which are films starred by the most prolific actor?alter
    -- most prlofic actor?
    
 # actor (actor_id) -> film_actor (film_id) -> film 
 
 select title, film_id from film where film_id in(
 select film_id from film_actor where actor_id in (
 select actor_id from actor))
 
 
 select actor_id, first_name, last_name from actor where actor_id in(
select actor_id from film_actor where film_id in (
select film_id from film where film_I)) group by first_name,last_name;
 
 
-- errror 
 
-- 7 Films rented by most profitable customer 
# film (film_id) - > inventory (inventory_id) -> rental ( customer_id) -> customer (customer_id) - > payment sum amount

select title, film_id from film where film_id in(
select film_id from inventory where inventory_id in(
select inventory_id from rental where customer_id = (select customer_id from payment
group by customer_id order by sum(amount) desc limit 1)));

-- 8 customer who spent more the avg payments

select avg(amount) from payment;

select first_name, last_name, customer_id from customer where customer_id in
(select customer_id from payment where amount > ( select avg(amount) as average_payment from payment)
group by first_name, last_name, customer_id
order by amount asc);




