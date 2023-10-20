CREATE TABLE customer
(
    cid SERIAL PRIMARY KEY,
    first_name VARCHAR(30) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(40),
    phone_number VARCHAR(15),
    pay_acc BIGINT CHECK ( pay_acc > 0 )
);

CREATE TABLE film
(
    fid SERIAL PRIMARY KEY,
    film_name VARCHAR(30) NOT NULL,
    description VARCHAR(300) NOT NULL,
    price BIGINT NOT NULL,
    director VARCHAR(50),
    release_date DATE CHECK ( release_date >= '1895-01-01' )
);

CREATE TABLE ticket
(
    tid SERIAL PRIMARY KEY,
    show_time timestamp NOT NULL,
    customer_id BIGINT REFERENCES customer(cid),
    film_id BIGINT REFERENCES film(fid)
);

CREATE TABLE customer_ticket
(
    tcid SERIAL PRIMARY KEY,
    customer_id BIGINT REFERENCES customer(cid),
    ticket_id BIGINT REFERENCES ticket(tid),
    UNIQUE (customer_id, ticket_id)
);

CREATE TABLE film_ticket
(
    tfid SERIAL PRIMARY KEY,
    film_id BIGINT REFERENCES film(fid),
    ticket_id BIGINT REFERENCES ticket(tid),
    UNIQUE (film_id, ticket_id)
);


INSERT INTO customer (first_name, last_name, email, phone_number, pay_acc) VALUES ('Lara', 'Croft', 'lara.cr@mail.com', '+738574921023', 8384738473);
INSERT INTO customer (first_name, last_name, email, phone_number, pay_acc) VALUES ('Indiana', 'Jones', 'indi@mail.com', '+743545454545', 2332322323);
INSERT INTO customer (first_name, last_name, email, phone_number, pay_acc) VALUES ('Michael', 'Scott', 'dunder.miff@gmail.com', '+45689899764', 9990009999);
INSERT INTO customer (first_name, last_name, email, phone_number, pay_acc) VALUES ('Diana', 'Spencer', 'spen@gmail.com', '+56757676555', 55587878788);
INSERT INTO customer (first_name, last_name, email, phone_number, pay_acc) VALUES ('Natan', 'Drake', 'uncharted@gmail.com', '+256665333', 56856875683);

INSERT INTO film (film_name, description, price, director, release_date) VALUES ('Saw X', 'great film', 500, 'Kevin Greutert', '2023-01-01');
INSERT INTO film (film_name, description, price, director, release_date) VALUES ('The Godfather', 'awesome', 600, 'Kevin Gre', '1972-02-01');
INSERT INTO film (film_name, description, price, director, release_date) VALUES ('Schindler''s List', 'fear', 700, 'Kevin Greut', '2015-01-03');
INSERT INTO film (film_name, description, price, director, release_date) VALUES ('Forrest Gump', 'just film', 800, 'Kev Greutert', '1995-04-01');
INSERT INTO film (film_name, description, price, director, release_date) VALUES ('The Matrix', 'not a film', 100, 'K G', '1999-07-01');

INSERT INTO ticket (show_time, customer_id, film_id)  VALUES ('2023-01-25 13:20:00', 2, 3);
INSERT INTO ticket (show_time, customer_id, film_id)  VALUES ('2024-01-20 13:20:00', 5, 1);
INSERT INTO ticket (show_time, customer_id, film_id)  VALUES ('2025-02-16 13:20:00', 5, 2);
INSERT INTO ticket (show_time, customer_id, film_id)  VALUES ('2023-04-15 13:20:00', 1, 4);
INSERT INTO ticket (show_time, customer_id, film_id)  VALUES ('2026-05-14 13:20:00', 4, 5);

INSERT INTO customer_ticket (customer_id, ticket_id) VALUES (2, 1);
INSERT INTO customer_ticket (customer_id, ticket_id) VALUES (5, 2);
INSERT INTO customer_ticket (customer_id, ticket_id) VALUES (5, 3);
INSERT INTO customer_ticket (customer_id, ticket_id) VALUES (1, 4);
INSERT INTO customer_ticket (customer_id, ticket_id) VALUES (4, 5);

INSERT INTO film_ticket (film_id, ticket_id) VALUES (3, 1);
INSERT INTO film_ticket (film_id, ticket_id) VALUES (1, 2);
INSERT INTO film_ticket (film_id, ticket_id) VALUES (2, 3);
INSERT INTO film_ticket (film_id, ticket_id) VALUES (4, 4);
INSERT INTO film_ticket (film_id, ticket_id) VALUES (5, 5);