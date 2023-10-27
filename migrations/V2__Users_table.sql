ALTER TABLE customer
DROP COLUMN first_name;

ALTER TABLE customer
DROP COLUMN last_name;

ALTER TABLE customer
ADD surname VARCHAR(30) NOT NULL;

ALTER TABLE customer
ADD name VARCHAR(20) NOT NULL;

ALTER TABLE customer
ADD patronymic VARCHAR(30) DEFAULT 'Нет отчества';

ALTER TABLE customer
ADD birth_date DATE;

ALTER TABLE customer
ADD address VARCHAR(100) DEFAULT 'Адрес не указан';

ALTER TABLE customer
DROP CONSTRAINT customer_city_id_key;

ALTER TABLE customer
ADD purse INTEGER CHECK (purse > -1);

ALTER TABLE customer
ADD sex smallint CHECK (sex < 3); -- http://en.wikipedia.org/wiki/ISO_5218  Немного адаптировали. 0 - Неизвестно. 1 - Мужчина. 2 - Женщина. --

ALTER TABLE customer
ADD profession VARCHAR(50) DEFAULT 'Нет профессии';

ALTER TABLE customer
ADD nationality VARCHAR(20) NOT NULL;

ALTER TABLE customer
ALTER COLUMN email
SET NOT NULL;

ALTER TABLE customer
ADD UNIQUE (email);

ALTER TABLE customer
ADD CONSTRAINT email_check CHECK (email ~* '^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Z|a-z]{2,}$');

ALTER TABLE customer
DROP COLUMN phone_number;  -- столбец "phone_number" нельзя автоматически привести к типу integer --

ALTER TABLE customer
ADD phone_number BIGINT;

ALTER TABLE customer
ADD UNIQUE (phone_number);

ALTER TABLE customer
ADD CONSTRAINT phone_check CHECK (phone_number > 1000000000);