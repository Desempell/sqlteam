
-- city --

ALTER TABLE city
ALTER cid TYPE BIGINT USING cid::BIGINT; -- Связи в основной таблице сделаны на BIGINT, а данные на SERIAL, поэтому нужно это исправлять  @Desempell

ALTER SEQUENCE public.city_cid_seq AS BIGINT; -- Видимо тоже нужно обновлять @Desempell

ALTER TABLE city
ALTER COLUMN name
SET NOT NULL;

ALTER TABLE city
ADD UNIQUE (name);

-- category --

ALTER TABLE category
ALTER cid TYPE BIGINT USING cid::BIGINT;

ALTER SEQUENCE public.category_cid_seq AS BIGINT;

ALTER TABLE category
ALTER COLUMN category_name
SET NOT NULL;

ALTER TABLE category
ADD UNIQUE (category_name);

-- seller --

ALTER TABLE seller
ALTER sid TYPE BIGINT USING sid::BIGINT;

ALTER SEQUENCE public.seller_sid_seq AS BIGINT;

ALTER TABLE seller
ALTER COLUMN seller_name
SET NOT NULL;

ALTER TABLE seller
ALTER COLUMN seller_name
SET NOT NULL;

ALTER TABLE seller
DROP COLUMN phone_number;

ALTER TABLE seller
ADD phone_number BIGINT;

ALTER TABLE seller
ADD UNIQUE (phone_number);

ALTER TABLE seller
ADD CONSTRAINT phone_sel_check CHECK (phone_number > 1000000000);

ALTER TABLE seller
ADD UNIQUE (inn);

ALTER TABLE seller
ADD CONSTRAINT inn_check CHECK (phone_number > 1000000000); -- Для юридических лиц ИНН присваивается при постановке на учет в налоговом органе при их создании и состоит из 10 цифр. --

ALTER TABLE seller
ADD UNIQUE (pay_acc);

ALTER TABLE seller
ADD CONSTRAINT pay_acc_check CHECK (pay_acc > 10000000); -- Наше личное поле, поэтому минимум 8 цифр

-- product --

ALTER TABLE product
ALTER pid TYPE BIGINT USING pid::BIGINT;

ALTER SEQUENCE public.product_pid_seq AS BIGINT;

ALTER TABLE product
ALTER COLUMN product_name
SET NOT NULL;

ALTER TABLE product
ADD UNIQUE (product_name);

ALTER TABLE product
ALTER COLUMN description
SET DEFAULT 'Описание отсутствует';

ALTER TABLE product
ADD CONSTRAINT price_check CHECK (price > 0);

-- reservation --

ALTER TABLE reservation
ALTER rid TYPE BIGINT USING rid::BIGINT;

ALTER SEQUENCE public.reservation_rid_seq AS BIGINT;

-- pickup --

ALTER TABLE pickup
ALTER pid TYPE BIGINT USING pid::BIGINT;

ALTER SEQUENCE public.pickup_pid_seq AS BIGINT;

ALTER TABLE pickup
ALTER COLUMN addres
SET NOT NULL;

-- delivery --

ALTER TABLE delivery
ALTER did TYPE BIGINT USING did::BIGINT;

ALTER SEQUENCE public.delivery_did_seq AS BIGINT;

-- storage --

ALTER TABLE storage
ALTER sid TYPE BIGINT USING sid::BIGINT;

ALTER SEQUENCE public.storage_sid_seq AS BIGINT;

ALTER TABLE storage
ALTER COLUMN addres
SET NOT NULL;

ALTER TABLE storage
ADD UNIQUE (addres);

-- storage_product --

ALTER TABLE storage_product
ALTER spid TYPE BIGINT USING spid::BIGINT;

ALTER SEQUENCE public.storage_product_spid_seq AS BIGINT;

ALTER TABLE storage_product
ADD CONSTRAINT count CHECK (count > -1);

-- reservation_product --

ALTER TABLE reservation_product
ALTER rpid TYPE BIGINT USING rpid::BIGINT;

ALTER SEQUENCE public.reservation_product_rpid_seq AS BIGINT;

ALTER TABLE reservation_product
ADD CONSTRAINT count CHECK (count > 0);

-- product_likes --

ALTER TABLE product_likes
ALTER plid TYPE BIGINT USING plid::BIGINT;

ALTER SEQUENCE public.product_likes_plid_seq AS BIGINT;

-- product_basket --

ALTER TABLE product_basket
ALTER pbid TYPE BIGINT USING pbid::BIGINT;

ALTER SEQUENCE public.product_basket_pbid_seq AS BIGINT;

-- ------------------ --


