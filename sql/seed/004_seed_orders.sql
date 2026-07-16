WITH order_seed (
    order_reference,
    customer_email,
    order_timestamp,
    order_status,
    shipping_amount
) AS (
    VALUES
        ('RP-1001', 'anna.mueller@example.com', TIMESTAMPTZ '2026-01-12 10:30:00+01', 'COMPLETED', 4.99),
        ('RP-1002', 'david.martin@example.com', TIMESTAMPTZ '2026-01-18 14:15:00+01', 'COMPLETED', 0.00),
        ('RP-1003', 'priya.sharma@example.com', TIMESTAMPTZ '2026-02-05 09:45:00+01', 'COMPLETED', 3.99),
        ('RP-1004', 'anna.mueller@example.com', TIMESTAMPTZ '2026-02-20 18:20:00+01', 'SHIPPED', 4.99),
        ('RP-1005', 'lucas.silva@example.com', TIMESTAMPTZ '2026-03-02 11:00:00+01', 'COMPLETED', 6.99),
        ('RP-1006', 'sofia.rossi@example.com', TIMESTAMPTZ '2026-03-16 16:40:00+01', 'CANCELLED', 4.99),
        ('RP-1007', 'emma.johnson@example.com', TIMESTAMPTZ '2026-04-04 12:10:00+02', 'COMPLETED', 0.00),
        ('RP-1008', 'david.martin@example.com', TIMESTAMPTZ '2026-04-21 08:55:00+02', 'REFUNDED', 3.99),
        ('RP-1009', 'priya.sharma@example.com', TIMESTAMPTZ '2026-05-08 19:30:00+02', 'PAID', 4.99),
        ('RP-1010', 'lina.andersson@example.com', TIMESTAMPTZ '2026-05-22 15:05:00+02', 'COMPLETED', 6.99),
        ('RP-1011', 'anna.mueller@example.com', TIMESTAMPTZ '2026-06-01 10:30:00+02', 'COMPLETED', 4.99),
        ('RP-1012', 'emma.johnson@example.com', TIMESTAMPTZ '2026-06-03 14:15:00+02', 'SHIPPED', 0.00)
)
INSERT INTO retail.orders (
    order_reference,
    customer_id,
    order_timestamp,
    order_status,
    shipping_amount
)
SELECT
    os.order_reference,
    c.customer_id,
    os.order_timestamp,
    os.order_status,
    os.shipping_amount
FROM order_seed AS os
JOIN retail.customers AS c
    ON c.email = os.customer_email
ON CONFLICT (order_reference) DO NOTHING;
