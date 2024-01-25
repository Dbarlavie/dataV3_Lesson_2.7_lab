use sakila;

#1 How many films are there for each of the categories in the category table. Use appropriate join to write this query.
select c.name , count(fc.film_id) as number_of_films
from category c
join film_category fc
on c.category_id=fc.category_id
group by c.name;

#2 Display the total amount rung up by each staff member in August of 2005.
select s.staff_id, sum(p.amount) as total_payment
from staff s
join payment p
on s.staff_id = p.staff_id
where p.payment_date between '2005-08-01' and '2005-08-31'
group by s.staff_id;

#3 Which actor has appeared in the most films?
select a.actor_id, count(*)as film_count
from actor a
join film_actor fa
on a.actor_id=fa.actor_id
group by actor_id
order by film_count desc
limit 1;

#4 Most active customer (the customer that has rented the most number of films)
select r.customer_id, count(*)as rental_count
from rental r
join customer c
on r.customer_id = c.customer_id 
group by customer_id
order by rental_count desc
limit 1;

#5 Display the first and last names, as well as the address, of each staff member.
select s.staff_id, s.first_name, s.last_name, a.address
from staff s
join address a
on a.address_id=s.address_id;

#6 List each film and the number of actors who are listed for that film.
select f.film_id, f.title, count(fa.actor_id)
from film f
join film_actor fa
on fa.film_id = f.film_id
group by f.film_id, f.title  
order by f.film_id;

#7 Using the tables payment and customer and the JOIN command, list the total paid by each customer. List the customers alphabetically by last name.
select c.customer_id, c.last_name, sum(p.amount) as total_paid
from customer c
join payment p
on p.customer_id = c.customer_id
group by p.customer_id
order by c.last_name;

#8 List the titles of films per category.
select f.title, c.name
from category c
join film_category fc
on c.category_id = fc.category_id
join film f 
on fc.film_id = f.film_id
order by c.name, f.title;