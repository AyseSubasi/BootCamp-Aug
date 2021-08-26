 -- 1 not repeated last name 
 select last_name from actor group by last_name having count(last_name) = 1;
 
 -- 2 repeated last name
 select last_name from actor group by last_name having count(last_name) > 1;
 
 -- 3 how many rentals were prcosseded by each employee
 
select * from rental;
select staff_id , count(rental_id) from rental group by staff_id;

-- 4 Using the film table, find out how many films were released.
 
 select * from film;
 select count(film_id), release_year from film group by release_year;
 
 -- 5 Using the film table, find out how many films there are of each rating.
 
 select rating , count(title) from film group by rating;
 
 -- 6 mean length of the film for each rating type - > round 2 dec
 
 select round(avg(length),2) , rating from film group by rating;

-- 7 
 select round(avg(length),2) , rating from film group by rating having round(avg(length),2) > 120;