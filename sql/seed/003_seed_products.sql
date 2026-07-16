INSERT INTO retail.products (
    category_id,
    product_name,
    sku,
    unit_price,
    unit_cost
)
SELECT
    category_id,
    'Wireless Headphones',
    'ELEC-HEAD-001',
    89.99,
    45.00
FROM retail.categories
WHERE category_name = 'Electronics'

UNION ALL

SELECT
    category_id,
    'Mechanical Keyboard',
    'ELEC-KEY-001',
    119.99,
    65.00
FROM retail.categories
WHERE category_name = 'Electronics'

UNION ALL

SELECT
    category_id,
    'Cotton T-Shirt',
    'FASH-TSH-001',
    29.99,
    12.00
FROM retail.categories
WHERE category_name = 'Fashion'

UNION ALL

SELECT
    category_id,
    'Yoga Mat',
    'SPORT-YOGA-001',
    39.99,
    18.00
FROM retail.categories
WHERE category_name = 'Sports'

UNION ALL

SELECT
    category_id,
    'SQL Fundamentals',
    'BOOK-SQL-001',
    44.99,
    20.00
FROM retail.categories
WHERE category_name = 'Books'

ON CONFLICT (sku) DO NOTHING;
