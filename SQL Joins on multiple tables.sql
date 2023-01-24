USE sakila;
# Activity 1: Write a query to display for each store its store ID, city, and country.
SELECT store_id, city, country FROM store
LEFT JOIN address
USING (address_id)
INNER JOIN city
USING (city_id)
INNER JOIN country
USING (country_id);
# Activity 2: Write a query to display how much business, in dollars, each store brought in.
SELECT store_id, SUM(amount) AS total_amount FROM store
LEFT JOIN staff
USING (store_id)
INNER JOIN payment
USING (staff_id)
GROUP BY store_id;
# Activity 3: What is the average running time(length) of films by category?
SELECT name, AVG(length) AS average_time FROM film
INNER JOIN film_category
USING (film_ID)
INNER JOIN category
USING (category_id)
GROUP BY name
ORDER BY name;
# Activity 4: Which film categories are longest(length) (find Top 5)? (Hint: You can rely on question 3 output.)
SELECT name, AVG(length) AS average_time FROM film
INNER JOIN film_category
USING (film_ID)
INNER JOIN category
USING (category_id)
GROUP BY name
ORDER BY average_time DESC LIMIT 5;
# Activity 5: Display the top 5 most frequently(number of times) rented movies in descending order.
SELECT title FROM film
INNER JOIN inventory
USING (film_id)
INNER JOIN rental
USING (inventory_id)
GROUP BY title
ORDER BY COUNT(rental_id) DESC LIMIT 5;
# Activity 6: List the top five genres in gross revenue in descending order.
SELECT name, SUM(amount) FROM category
INNER JOIN film_category
USING (category_id)
INNER JOIN film
USING (film_id)
INNER JOIN inventory
USING (film_id)
INNER JOIN rental
USING (inventory_id)
INNER JOIN payment
USING (rental_id)
GROUP BY name
ORDER BY SUM(amount) DESC LIMIT 5;
# Activity 7: Is "Academy Dinosaur" available for rent from Store 1?
SELECT DISTINCT(store_id), title FROM film
INNER JOIN inventory
USING (film_id)
INNER JOIN store
USING (store_id)
WHERE title LIKE 'Academy Dinosaur' AND store_id LIKE '1';