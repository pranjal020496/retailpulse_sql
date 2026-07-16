WITH order_item_seed (
    order_reference,
    sku,
    quantity,
    unit_price,
    discount_amount
) AS (
    VALUES
        ('RP-1001', 'ELEC-HEAD-001', 1, 89.99, 0.00),
        ('RP-1001', 'BOOK-SQL-001', 2, 44.99, 5.00),
        ('RP-1002', 'ELEC-KEY-001', 1, 119.99, 10.00),
        ('RP-1003', 'FASH-TSH-001', 2, 29.99, 0.00),
        ('RP-1003', 'SPORT-YOGA-001', 1, 39.99, 0.00),
        ('RP-1004', 'ELEC-SPKR-001', 1, 74.99, 5.00),
        ('RP-1004', 'BOOK-DS-001', 1, 54.99, 0.00),
        ('RP-1005', 'HOME-CHAIR-001', 1, 249.99, 20.00),
        ('RP-1005', 'ELEC-KEY-001', 1, 119.99, 0.00),
        ('RP-1006', 'FASH-JACK-001', 1, 149.99, 0.00),
        ('RP-1007', 'SPORT-RUN-001', 1, 99.99, 10.00),
        ('RP-1007', 'SPORT-FIT-001', 1, 129.99, 0.00),
        ('RP-1008', 'HOME-BLEND-001', 1, 69.99, 0.00),
        ('RP-1009', 'BOOK-SQL-001', 1, 44.99, 0.00),
        ('RP-1009', 'BOOK-DS-001', 1, 54.99, 5.00),
        ('RP-1009', 'ELEC-HEAD-001', 1, 89.99, 0.00),
        ('RP-1010', 'FASH-JACK-001', 1, 149.99, 15.00),
        ('RP-1010', 'FASH-TSH-001', 3, 29.99, 5.00),
        ('RP-1011', 'ELEC-HEAD-001', 1, 89.99, 0.00),
        ('RP-1011', 'BOOK-SQL-001', 2, 44.99, 5.00),
        ('RP-1012', 'ELEC-KEY-001', 1, 119.99, 10.00),
        ('RP-1012', 'HOME-BLEND-001', 1, 69.99, 0.00)
)
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
    ois.quantity,
    ois.unit_price,
    ois.discount_amount
FROM order_item_seed AS ois
JOIN retail.orders AS o
    ON o.order_reference = ois.order_reference
JOIN retail.products AS p
    ON p.sku = ois.sku
ON CONFLICT (order_id, product_id) DO NOTHING;
