USE sakila;
# Activity 1: Which actor has appeared in the most films?
SELECT concat(first_name, " ", last_name) AS full_name, COUNT(film_id) AS movies_made FROM actor
INNER JOIN film_actor
USING (actor_id)
GROUP BY actor_id
ORDER BY COUNT(film_id) DESC LIMIT 1;
# Activity 2: Most active customer (the customer that has rented the most number of films)
SELECT concat(first_name, " ", last_name) AS full_name, COUNT(rental_id) AS rents FROM customer
INNER JOIN rental
USING (customer_id)
GROUP BY customer_id
ORDER BY COUNT(rental_id) DESC LIMIT 1;
# Activity 3: List number of films per category.
SELECT  name, COUNT(title) AS number_of_titles FROM film
INNER JOIN film_category
USING (film_id)
INNER JOIN category
USING (category_id)
GROUP BY name;
# Activity 4: Display the first and last names, as well as the address, of each staff member.
SELECT first_name, last_name, address FROM staff
LEFT JOIN address
USING (address_id);
# Activity 5: get films titles where the film language is either English or italian, and whose titles starts with letter "M" , sorted by title descending.
SELECT title FROM film
INNER JOIN language
USING (language_id)
WHERE language.name = ("English" OR "Italian") AND film.title LIKE 'M%'
ORDER BY title DESC;
# Activity 6: Display the total amount rung up by each staff member in August of 2005.
SELECT concat(first_name, " ", last_name) AS full_name, SUM(amount) FROM staff
INNER JOIN payment
USING(staff_id)
WHERE payment_date LIKE '2005-08%'
GROUP BY full_name;
# Activity 7: List each film and the number of actors who are listed for that film.
SELECT title, COUNT(actor_id) FROM film
LEFT JOIN film_actor # We wanna get even movies that have zero actors (documentaries, for eg.)
USING (film_id)
GROUP BY title
ORDER BY COUNT(actor_id) DESC;
# Activity 8: Using the tables payment and customer and the JOIN command, list the total paid by each customer. List the customers alphabetically by last name.
SELECT first_name, last_name, SUM(amount) FROM customer
INNER JOIN payment
USING (customer_id)
GROUP BY customer_id
ORDER BY last_name;
# Activity 9: Write sql statement to check if you can find any actor who never particiapted in any film.
SELECT concat(first_name, " ", last_name) AS full_name FROM actor
LEFT JOIN film_actor
USING (actor_id)
WHERE film_id IS NULL;
# Acivity 10: get the addresses that have NO customers, and ends with the letter "e"
SELECT address FROM address
LEFT JOIN customer
USING (address_id)
WHERE customer_id IS NULL AND address LIKE '%e';
# Optional: what is the most rented film?
SELECT title FROM film
INNER JOIN inventory
USING (film_id)
INNER JOIN rental
USING (inventory_id)
GROUP BY title
ORDER BY COUNT(rental_id) DESC LIMIT 1;