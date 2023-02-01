CREATE TABLE IF NOT EXISTS actor_sample (
    actor_id SERIAL,
    first_name VARCHAR(45) NOT NULL,
    last_name VARCHAR(45) NOT NULL,
    last_update TIMESTAMP NOT NULL  DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (actor_id)
);

INSERT INTO actor_sample (first_name, last_name) VALUES ('Jarsław', 'Śmierdziński');


DELETE
FROM actor_sample
WHERE actor_id = 1;

DELETE
FROM actor_sample
WHERE actor_id IN (SELECT actor_id
                   FROM film_actor
                   WHERE film_id = 1);


SELECT * FROM actor_sample;

DROP TABLE actor_sample;