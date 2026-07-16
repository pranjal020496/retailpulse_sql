INSERT INTO retail.order_items (
    order_id,
    product_id,
    quantity,
    unit_price,
    discount_amount
)
SELECT
    o.order_id,
    p.product_id,
    1,
    89.99,
    0.00
FROM retail.orders AS o
JOIN retail.products AS p
    ON p.sku = 'ELEC-HEAD-001'
WHERE o.order_reference = 'RP-1001'

UNION ALL

SELECT
    o.order_id,
    p.product_id,
    2,
    44.99,
    5.00
FROM retail.orders AS o
JOIN retail.products AS p
    ON p.sku = 'BOOK-SQL-001'
WHERE o.order_reference = 'RP-1001'

UNION ALL

SELECT
    o.order_id,
    p.product_id,
    1,
    119.99,
    10.00
FROM retail.orders AS o
JOIN retail.products AS p
    ON p.sku = 'ELEC-KEY-001'
WHERE o.order_reference = 'RP-1002'

UNION ALL

SELECT
    o.order_id,
    p.product_id,
    2,
    29.99,
    0.00
FROM retail.orders AS o
JOIN retail.products AS p
    ON p.sku = 'FASH-TSH-001'
WHERE o.order_reference = 'RP-1003'

ON CONFLICT (order_id, product_id) DO NOTHING;INSERT INTO retail.order_items (
    order_id,
    product_id,
    quantity,
    unit_price,
    discount_amount
)
SELECT
    o.order_id,
    p.product_id,
    1,
    89.99,
    0.00
FROM retail.orders AS o
JOIN retail.products AS p
    ON p.sku = 'ELEC-HEAD-001'
WHERE o.order_reference = 'RP-1001'

UNION ALL

SELECT
    o.order_id,
    p.product_id,
    2,
    44.99,
    5.00
FROM retail.orders AS o
JOIN retail.products AS p
    ON p.sku = 'BOOK-SQL-001'
WHERE o.order_reference = 'RP-1001'

UNION ALL

SELECT
    o.order_id,
    p.product_id,
    1,
    119.99,
    10.00
FROM retail.orders AS o
JOIN retail.products AS p
    ON p.sku = 'ELEC-KEY-001'
WHERE o.order_reference = 'RP-1002'

UNION ALL

SELECT
    o.order_id,
    p.product_id,
    2,
    29.99,
    0.00
FROM retail.orders AS o
JOIN retail.products AS p
    ON p.sku = 'FASH-TSH-001'
WHERE o.order_reference = 'RP-1003'

ON CONFLICT (order_id, product_id) DO NOTHING;
