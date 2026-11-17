SELECT o.order_id,
       o.order_status,
       c.customer_city,
       p.product_category_name,
       oi.price
FROM orders o
INNER JOIN customers c ON o.customer_id = c.customer_id
INNER JOIN order_items oi ON o.order_id = oi.order_id
INNER JOIN products p ON oi.product_id = p.product_id
LIMIT 10;


SELECT * FROM orders o
INNER JOIN order_reviews ore ON o.order_id = ore.order_id;


SELECT COUNT(o.order_id) FROM orders o
LEFT JOIN order_items oi ON o.order_id = oi.order_id
WHERE oi.order_id IS NULL;

SELECT o.order_id, o.order_status
FROM orders o
LEFT JOIN order_items oi ON o.order_id = oi.order_id
WHERE oi.order_id IS NULL
LIMIT 20;

SELECT o.order_id, o.order_status
FROM order_items oi 
RIGHT JOIN orders o ON oi.order_id = o.order_id
WHERE oi.order_id IS NULL
LIMIT 20;


SELECT DISTINCT
       p.product_category_name  AS en_products,
       t.product_category_name  AS en_translation
FROM products p
FULL JOIN category_translation t
    ON p.product_category_name = t.product_category_name
WHERE p.product_category_name IS NOT NULL AND t.product_category_name IS NULL;

SELECT oi2.order_id AS order_id, oi1.product_id AS product_id_1, oi2.product_id AS product_id_2 FROM order_items oi1
INNER JOIN order_items oi2
    ON oi1.order_id = oi2.order_id
    AND oi1.product_id <> oi2.product_id
    LIMIT 20;

SELECT COUNT(*) FROM order_items oi1
INNER JOIN order_items oi2
    ON oi1.order_id = oi2.order_id
    AND oi1.product_id < oi2.product_id;

SELECT COUNT(*) FROM order_items oi1
INNER JOIN order_items oi2
    ON oi1.order_id = oi2.order_id
    AND oi1.product_id <> oi2.product_id;


SELECT o.order_id, o.order_status 
FROM orders o
LEFT JOIN order_payments op ON o.order_id = op.order_id
WHERE op.order_id IS NULL
LIMIT 20;

SELECT o.order_id, c.customer_state, ct.product_category_name_english, oi.price
FROM orders o
INNER JOIN order_items oi ON o.order_id = oi.order_id
INNER JOIN customers c ON o.customer_id = c.customer_id
INNER JOIN products p ON oi.product_id = p.product_id
LEFT JOIN category_translation ct ON p.product_category_name = ct.product_category_name
WHERE o.order_status = 'delivered'
LIMIT 10;