

SELECT * FROM sakila.public.actor;
SELECT * FROM sakila.public.category;
SELECT name FROM sakila.public.category;
SELECT last_update, name FROM sakila.public.category;

SELECT * FROM sakila.public.actor ORDER BY first_name;
SELECT * FROM sakila.public.actor ORDER BY first_name DESC;
SELECT * FROM sakila.public.actor ORDER BY last_name, first_name;

SELECT * FROM actor WHERE actor_id > 100;

SELECT actor_id, first_name, last_name FROM actor WHERE  first_name = 'NICK';

SELECT actor_id, first_name, last_name
FROM actor
WHERE  first_name = 'NICK'
ORDER BY actor_id
DESC;

SELECT * FROM rental;

SELECT rental_date, inventory_id, return_date
FROM rental;

SELECT rental_date AS RentalDate, inventory_id AS FilmListID, return_date AS ReturnDate
FROM rental;

SELECT film.replacement_cost - film.rental_rate AS CostDif,
       film.film_id AS FilmID,
       film.length / 60 AS TimeInHour
FROM film;

SELECT rental_rate AS RentalRate,
       rental_rate + 3 *4 - 1 AS Result,
       (rental_rate + 3) * 4 - 1 AS Result2,
       (rental_rate + 3) * (4 - 1) AS Result3,
       rental_rate + (3 * 4) - 1 AS Result4
FROM film;

SELECT replacement_cost AS ReplacementCost,
       replacement_cost / 5 AS DecimalRentalRate,
       replacement_cost % 5 AS RemainderRentalRate
FROM film;


SELECT * FROM payment;
SELECT amount,
       ROUND(amount) AS Amnt,
       ROUND(amount, 1) AS Amnt1,
       FLOOR(amount) AS Amnt2,
       CEILING(amount) AS Amnt3
FROM payment;


SELECT CONCAT(first_name, ' ', last_name) AS FullName
FROM actor;

SELECT CONCAT(LEFT(first_name, 1), '.', LEFT(last_name, 1), '.') AS Inititials
FROM actor;


SELECT CONCAT(first_name, ' ', last_name) AS Fu
FROM actor;

SELECT first_name, last_name
FROM actor;


SELECT CONCAT(first_name, ' ', last_name) AS FullName,
       REVERSE(CONCAT(first_name, ' ', last_name)) AS ReversedName,
       REPLACE(CONCAT(first_name, ' ', last_name), 'S', '$') AS Replace
FROM actor;


SELECT actor_id, first_name, last_update
FROM actor
WHERE actor_id = 100;

SELECT actor_id, first_name, last_update
FROM actor
WHERE first_name < 'NICK';

SELECT actor_id, first_name, last_update
FROM actor
WHERE first_name <> 'NICK';
SELECT actor_id, first_name, last_update
FROM actor
WHERE first_name != 'NICK';

SELECT *
FROM actor
WHERE first_name = 'KENNETH';

SELECT *
FROM actor
WHERE first_name = 'KENNETH'
    AND actor_id > 100
    OR last_name = 'TEMPLE';

SELECT *
FROM actor
WHERE first_name IN ('NICK', 'JOHNNY', 'VIVIEN');
SELECT *
FROM actor
WHERE first_name NOT IN ('NICK', 'JOHNNY', 'VIVIEN');

SELECT *
FROM actor
WHERE first_name IN ('NICK', 'JOHNNY', 'VIVIEN')
AND actor_id IN (SELECT actor_id
                 FROM actor
                 WHERE last_name = 'DEGENERES'
                 AND actor_id NOT BETWEEN 10 AND 150);

SELECT *
FROM actor
WHERE first_name LIKE 'A__E%';

SELECT *
FROM actor
ORDER BY actor_id
LIMIT 10 OFFSET 5;
