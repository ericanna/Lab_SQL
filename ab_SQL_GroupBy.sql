USE sakila;
# 1. In the table actor, what last names are not repeated? For example if you would sort the data in the table actor by last_name, you would see that there is Christian Arkoyd, Kirsten Arkoyd, and Debbie Arkoyd. These three actors have the same last name. So we do not want to include this last name in our output. Last name "Astaire" is present only one time with actor "Angelina Astaire", hence we would want this in our output list.
SELECT last_name FROM actor
GROUP BY last_name
HAVING COUNT(last_name) = 1;
# 2. Which last names appear more than once? We would use the same logic as in the previous question but this time we want to include the last names of the actors where the last name was present more than once.SELECT last_name FROM actor
SELECT last_name FROM actor
GROUP BY last_name
HAVING COUNT(last_name) > 1;
# 3. Using the rental table, find out how many rentals were processed by each employee.
SELECT staff_id, COUNT(rental_id) AS rentals_processed FROM rental
GROUP BY staff_id;
# 4. Using the film table, find out how many films there are of each rating.
SELECT rating, COUNT(film_id) AS total_movies FROM film
GROUP BY rating
ORDER BY COUNT(film_id) DESC;
# 5. What is the mean length of the film for each rating type. Round off the average lengths to two decimal places.
SELECT rating, AVG(length) FROM film
GROUP BY rating
ORDER BY rating;
# 6. Which kind of movies (rating) have a mean duration of more than two hours?
SELECT rating FROM film
GROUP BY rating
HAVING (AVG(length) > 120)
ORDER BY rating;
