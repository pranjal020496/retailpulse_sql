\echo '1. Orders with missing customers: expected 0 rows'
SELECT o.*
FROM retail.orders AS o
LEFT JOIN retail.customers AS c
    ON c.customer_id = o.customer_id
WHERE c.customer_id IS NULL;

\echo '2. Order items with missing orders: expected 0 rows'
SELECT oi.*
FROM retail.order_items AS oi
LEFT JOIN retail.orders AS o
    ON o.order_id = oi.order_id
WHERE o.order_id IS NULL;

\echo '3. Order items with missing products: expected 0 rows'
SELECT oi.*
FROM retail.order_items AS oi
LEFT JOIN retail.products AS p
    ON p.product_id = oi.product_id
WHERE p.product_id IS NULL;

\echo '4. Invalid quantities, prices or discounts: expected 0 rows'
SELECT *
FROM retail.order_items
WHERE quantity <= 0
   OR unit_price < 0
   OR discount_amount < 0
   OR discount_amount > unit_price * quantity;

\echo '5. Duplicate customer emails: expected 0 rows'
SELECT email, COUNT(*) AS duplicate_count
FROM retail.customers
GROUP BY email
HAVING COUNT(*) > 1;

\echo '6. Duplicate product SKUs: expected 0 rows'
SELECT sku, COUNT(*) AS duplicate_count
FROM retail.products
GROUP BY sku
HAVING COUNT(*) > 1;

\echo '7. Duplicate order references: expected 0 rows'
SELECT order_reference, COUNT(*) AS duplicate_count
FROM retail.orders
GROUP BY order_reference
HAVING COUNT(*) > 1;

\echo '8. Orders without items: expected 0 rows for this sample'
SELECT o.order_id, o.order_reference
FROM retail.orders AS o
LEFT JOIN retail.order_items AS oi
    ON oi.order_id = o.order_id
WHERE oi.order_item_id IS NULL;

\echo '9. Products priced below cost: expected 0 rows'
SELECT *
FROM retail.products
WHERE unit_price < unit_cost;

\echo '10. Invalid order statuses: expected 0 rows'
SELECT *
FROM retail.orders
WHERE order_status NOT IN (
    'PENDING',
    'PAID',
    'SHIPPED',
    'COMPLETED',
    'CANCELLED',
    'REFUNDED'
);
