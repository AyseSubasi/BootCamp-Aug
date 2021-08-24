-- 1 Write a query to display for each store its store ID, city, and country.
# store -> address -> city ->country

select store.store_id, city.city, country.country from store
inner join address on store.address_id = address.address_id inner join
city on city.city_id = address.city_id
inner join country on country.country_id = city.country_id
group by store.store_id, city.city, country.country ;


-- 2 #Write a query to display how much business, in dollars, each store brought in.
# payment (amount) -> customer (store_id) customer_id -> address address_id  -> city ->country

select sum(payment.amount), customer.store_id from payment
inner join customer on customer.customer_id = payment.customer_id
inner join address on address.address_id = customer.address_id
inner join
city on city.city_id = address.city_id
inner join country on country.country_id = city.country_id
group by customer.store_id ;

-- 3 What is the average running time of films by category?

# film(lenght) film_id-> film_category ( category_id) -> category (name)

select avg(film.length) as avg_running_time, category.name from film
inner join film_category on film.film_id = film_category.film_id
inner join category on film_category.category_id = category.category_id
group by category.name;

-- 4 Which film categories are longest?

select avg(film.length) as avg_running_time, category.name from film
inner join film_category on film.film_id = film_category.film_id
inner join category on film_category.category_id = category.category_id
group by category.name order by avg(film.length) desc limit 1;

-- 5 Display the most frequently rented movies in descending order.
#film(title) film_id -> inventory inventory_id - > rental (rental_date)

select film.title, count(rental.rental_date) from film
inner join inventory on inventory.film_id = film.film_id
inner join rental on inventory.inventory_id = rental.inventory_id
group by film.title order by count(rental.rental_date) desc; 

-- 6 List the top five genres in gross revenue in descending order.


