CREATE TABLE city
(
    cid SERIAL PRIMARY KEY,
    name VARCHAR(20)
);

CREATE TABLE customer
(
    id SERIAL PRIMARY KEY,
    first_name VARCHAR(30),
    last_name VARCHAR(50),
    email VARCHAR(40),
    phone_number VARCHAR(15),
    city_id BIGINT UNIQUE REFERENCES city(cid)
);

CREATE TABLE category
(
    cid SERIAL PRIMARY KEY,
    category_name VARCHAR(20)
);

CREATE TABLE seller
(
    sid SERIAL PRIMARY KEY,
    seller_name VARCHAR(50),
    phone_number VARCHAR(15),
    inn BIGINT,
    pay_acc BIGINT
);

CREATE TABLE product
(
    pid SERIAL PRIMARY KEY,
    product_name VARCHAR(40),
    description VARCHAR(300),
    category_id BIGINT UNIQUE REFERENCES category(cid),
    price BIGINT,
    seller_id BIGINT UNIQUE REFERENCES seller(sid)
);

CREATE TABLE reservation
(
    rid SERIAL PRIMARY KEY,
    customer_id BIGINT UNIQUE REFERENCES customer(id),
    start_date DATE
);

CREATE TABLE pickup
(
    pid SERIAL PRIMARY KEY,
    addres VARCHAR(40),
    city_id BIGINT UNIQUE REFERENCES city(cid),
    work_time INTERVAL
);

CREATE TABLE delivery
(
    did SERIAL PRIMARY KEY,
    pickup_id BIGINT UNIQUE REFERENCES pickup(pid),
    reservation_id BIGINT UNIQUE REFERENCES reservation(rid),
    end_date DATE
);


CREATE TABLE storage
(
    sid SERIAL PRIMARY KEY,
    addres VARCHAR(40),
    city_id BIGINT UNIQUE REFERENCES city(cid),
    work_time INTERVAL
);

CREATE TABLE storage_product
(
    spid SERIAL PRIMARY KEY,
    count BIGINT,
    storage_id BIGINT REFERENCES storage(sid),
    product_id BIGINT REFERENCES product(pid),
    UNIQUE (storage_id, product_id)
);

CREATE TABLE reservation_product
(
    rpid SERIAL PRIMARY KEY,
    count BIGINT,
    reservation_id BIGINT REFERENCES reservation(rid),
    product_id BIGINT REFERENCES product(pid),
    UNIQUE (reservation_id, product_id)
);

CREATE TABLE product_likes
(
    plid SERIAL PRIMARY KEY,
    product_id BIGINT REFERENCES product(pid),
    customer_id BIGINT REFERENCES customer(id),
    UNIQUE (product_id, customer_id)
);

CREATE TABLE product_basket
(
    pbid SERIAL PRIMARY KEY,
    product_id BIGINT REFERENCES product(pid),
    customer_id BIGINT REFERENCES customer(id),
    UNIQUE (product_id, customer_id)
);