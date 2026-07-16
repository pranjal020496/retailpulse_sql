WITH product_seed (
    category_name,
    product_name,
    sku,
    unit_price,
    unit_cost
) AS (
    VALUES
        ('Electronics', 'Wireless Headphones', 'ELEC-HEAD-001', 89.99, 45.00),
        ('Electronics', 'Mechanical Keyboard', 'ELEC-KEY-001', 119.99, 65.00),
        ('Fashion', 'Cotton T-Shirt', 'FASH-TSH-001', 29.99, 12.00),
        ('Sports', 'Yoga Mat', 'SPORT-YOGA-001', 39.99, 18.00),
        ('Books', 'SQL Fundamentals', 'BOOK-SQL-001', 44.99, 20.00),
        ('Electronics', 'Smart Home Speaker', 'ELEC-SPKR-001', 74.99, 38.00),
        ('Home', 'Kitchen Blender', 'HOME-BLEND-001', 69.99, 34.00),
        ('Sports', 'Running Shoes', 'SPORT-RUN-001', 99.99, 50.00),
        ('Books', 'Data Science Handbook', 'BOOK-DS-001', 54.99, 24.00),
        ('Home', 'Ergonomic Office Chair', 'HOME-CHAIR-001', 249.99, 145.00),
        ('Sports', 'Fitness Tracker', 'SPORT-FIT-001', 129.99, 70.00),
        ('Fashion', 'Winter Jacket', 'FASH-JACK-001', 149.99, 80.00)
)
INSERT INTO retail.products (
    category_id,
    product_name,
    sku,
    unit_price,
    unit_cost
)
SELECT
    c.category_id,
    ps.product_name,
    ps.sku,
    ps.unit_price,
    ps.unit_cost
FROM product_seed AS ps
JOIN retail.categories AS c
    ON c.category_name = ps.category_name
ON CONFLICT (sku) DO NOTHING;
