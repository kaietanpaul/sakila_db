CREATE TABLE IF NOT EXISTS actor_sample (
    actor_id SERIAL,
    first_name VARCHAR(45) NOT NULL,
    last_name VARCHAR(45) NOT NULL,
    last_update TIMESTAMP NOT NULL  DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (actor_id)
);

INSERT INTO actor_sample (first_name, last_name) VALUES ('Jarsław', 'Śmierdziński');

SELECT * FROM actor_sample;

INSERT INTO actor_sample (first_name, last_name)
VALUES ('Lech', 'Śmierdziński'),
       ('Antoni', 'Moher'),
       ('Janusz', 'Krotki');

INSERT INTO actor_sample (first_name, last_name)
SELECT first_name, last_name
FROM actor;

UPDATE actor_sample
SET first_name = 'Śmiech'
WHERE actor_id = 2;
UPDATE actor_sample
SET first_name = 'Srantoni', last_name = 'Sroher'
WHERE actor_id = 3;

UPDATE actor_sample
SET first_name = 'Jarosław'
WHERE actor_id IN (1, 2, 3, 4, 5);

UPDATE actor_sample
SET first_name = 'Andrzej'
WHERE actor_id IN (SELECT actor_id
                   FROM film_actor WHERE film_id = 1);



SELECT *
FROM actor_sample
ORDER BY actor_id;


DROP TABLE actor_sample;