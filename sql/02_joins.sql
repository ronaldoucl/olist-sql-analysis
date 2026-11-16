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