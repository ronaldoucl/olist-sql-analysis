CREATE TABLE customers (
    customer_id              TEXT,
    customer_unique_id       TEXT,
    customer_zip_code_prefix TEXT,
    customer_city            TEXT,
    customer_state           TEXT
);

COPY customers
FROM '/data/olist_customers_dataset.csv'
WITH (FORMAT csv, HEADER true);

CREATE TABLE sellers (
    seller_id              TEXT,
    seller_zip_code_prefix TEXT,
    seller_city            TEXT,
    seller_state           TEXT
);

COPY sellers
FROM '/data/olist_sellers_dataset.csv'
WITH (FORMAT csv, HEADER true);

CREATE TABLE orders (
    order_id                TEXT,
    customer_id             TEXT,
    order_status            TEXT,
    order_purchase_timestamp TIMESTAMP,
    order_approved_at       TIMESTAMP,
    order_delivered_carrier_date TIMESTAMP,
    order_delivered_customer_date TIMESTAMP,
    order_estimated_delivery_date TIMESTAMP
);

COPY orders
FROM '/data/olist_orders_dataset.csv'
WITH (FORMAT csv, HEADER true);

CREATE TABLE order_items (
    order_id                TEXT,
    order_item_id           INT,
    product_id              TEXT,
    seller_id               TEXT,
    shipping_limit_date     TIMESTAMP,
    price                   NUMERIC(10, 2),
    freight_value           NUMERIC(10, 2)
);

COPY order_items
FROM '/data/olist_order_items_dataset.csv'
WITH (FORMAT csv, HEADER true);

CREATE TABLE order_payments (
    order_id                TEXT,
    payment_sequential      INT,
    payment_type            TEXT,
    payment_installments    INT,
    payment_value           NUMERIC(10, 2)
);

COPY order_payments
FROM '/data/olist_order_payments_dataset.csv'
WITH (FORMAT csv, HEADER true);

CREATE TABLE order_reviews (
    review_id               TEXT,
    order_id                TEXT,
    review_score            INT,
    review_comment_title    TEXT,
    review_comment_message  TEXT,
    review_creation_date    TIMESTAMP,
    review_answer_timestamp TIMESTAMP
);

COPY order_reviews
FROM '/data/olist_order_reviews_dataset.csv'
WITH (FORMAT csv, HEADER true);

CREATE TABLE products (
    product_id              TEXT,
    product_category_name   TEXT,
    product_name_length     INT,
    product_description_length INT,
    product_photos_qty      INT,
    product_weight_g        NUMERIC(10, 2),
    product_length_cm       NUMERIC(10, 2),
    product_height_cm       NUMERIC(10, 2),
    product_width_cm        NUMERIC(10, 2)
);

COPY products
FROM '/data/olist_products_dataset.csv'
WITH (FORMAT csv, HEADER true);

CREATE TABLE geolocation (
    geolocation_zip_code_prefix TEXT,
    geolocation_lat             NUMERIC,
    geolocation_lng             NUMERIC,
    geolocation_city            TEXT,
    geolocation_state           TEXT
);

COPY geolocation
FROM '/data/olist_geolocation_dataset.csv'
WITH (FORMAT csv, HEADER true);

CREATE TABLE category_translation (
    product_category_name TEXT,
    product_category_name_english TEXT
);

COPY category_translation
FROM '/data/product_category_name_translation.csv'
WITH (FORMAT csv, HEADER true);


