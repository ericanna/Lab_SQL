USE sakila;
# Activity 1: List all films whose length is longer than the average of all the films.
SELECT title FROM film
WHERE length > (SELECT AVG(length) FROM film);
# Activity 2: How many copies of the film Hunchback Impossible exist in the inventory system?
SELECT COUNT(inventory_id) AS number_of_copies FROM inventory
WHERE film_id = (SELECT film_id FROM film
					WHERE title = "Hunchback Impossible");
# Activity 3: Use subqueries to display all actors who appear in the film Alone Trip.
SELECT concat(first_name, " ", last_name) AS actor_name FROM actor
WHERE actor_id in (SELECT actor_id FROM film_actor
						WHERE film_id = (SELECT film_id FROM film
											WHERE title = "Alone Trip"));
# Activity 4: Sales have been lagging among young families, and you wish to target all family movies for a promotion. Identify all movies categorized as family films.
SELECT title FROM film
WHERE film_id in (SELECT film_id FROM film_category
						WHERE category_id = (SELECT category_id FROM category
							WHERE name = "Family"));
# Activity 5: Get name and email from customers from Canada using subqueries. Do the same with joins. Note that to create a join, you will have to identify the correct tables with their primary keys and foreign keys, that will help you get the relevant information.
##First, using subqueries:
SELECT first_name, last_name, email FROM customer
WHERE address_id in (SELECT address_id FROM address
						WHERE city_id in (SELECT city_id FROM city
											WHERE country_id in (SELECT country_id FROM country
																	WHERE country = "Canada")));
## Now using joins:
SELECT first_name, last_name, email FROM customer
JOIN address USING (address_id)
JOIN city USING (city_id)
JOIN country USING (country_id)
	WHERE country = "Canada";
# Optional - Activity 6: Which are films starred by the most prolific actor? Most prolific actor is defined as the actor that has acted in the most number of films. First you will have to find the most prolific actor and then use that actor_id to find the different films that he/she starred.
SELECT title FROM film
WHERE film_id in (SELECT film_id FROM film_actor
					WHERE actor_id = (SELECT actor_id FROM film_actor
										GROUP BY actor_id
										ORDER BY COUNT(actor_id) DESC LIMIT 1));
# Optional - Activity 7: Films rented by most profitable customer. You can use the customer table and payment table to find the most profitable customer ie the customer that has made the largest sum of payments.
SELECT title FROM film
WHERE film_id in (SELECT film_id FROM inventory
					WHERE inventory_id in (SELECT inventory_id FROM rental
						WHERE rental_id in (SELECT rental_id FROM payment
							WHERE customer_id = (SELECT customer_id FROM payment
									GROUP BY customer_id ORDER BY SUM(amount) DESC LIMIT 1))));
# Optional - Activity 8: Customers who spent more than the average payments(this refers to the average of all amount spent per each customer)..

                            
                            



