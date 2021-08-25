-- 1 get release year
select distinct release_year from film; #-> 2006

-- 2 Get all films with ARMAGEDDON in the title.

select title from film where title contains "ARMAGEDDON";

-- 3 Get all films which title ends with APOLLO

select title from film where title like "%APOLLO";

-- 4 Get 10 the longest films.

select distinct length from film order by length desc limit 10;

-- 5 How many films include Behind the Scenes content?

select count(title) from film where special_features = "Behind the Scenes";

-- 6 drop column picture from staff

alter table staff drop picture;

-- 7 A new person is hired to help Jon. Her name is TAMMY SANDERS, and she is a customer. Update the database accordingly.
select * from staff;
select customer_id from sakila.customer
where first_name = 'Tammy' and last_name = 'SANDERS'; #ID 75

select address_id from sakila.customer
where first_name = 'Tammy' and last_name = 'SANDERS'; #Adress ID 79

insert into staff values
(3, 'Tammy', 'Sanders', 79, 'tammy.sanders@sakilastaff.com', 2, 1, 'Tammy', 'blablabla', '2021-08-25 21:30:00');


-- 8 rental for movie "Academy Dinosaur" by Charlotte Hunter from Mike Hillyer at Store 1 , rental_date actual date
select customer_id from sakila.customer
where first_name = 'CHARLOTTE' and last_name = 'HUNTER'; # customer id 130

select * from rental;
rental_id; rental_date, inventory_id, customer_id, return_date,staff_id last_update

select staff_id ,first_name, last_name from staff; #staff id 1 

insert into rental values(1002222, "2021-08-25" ,1002222 ,130, "2021-09-25" ,1,"2022-09-25");

-- 9 

create table deleted_users (customer_id int, email not null, date current_timestamp)


