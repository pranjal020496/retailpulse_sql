INSERT INTO retail.orders (
    order_reference,
    customer_id,
    order_timestamp,
    order_status,
    shipping_amount
)
SELECT
    'RP-1001',
    customer_id,
    TIMESTAMPTZ '2026-06-01 10:30:00+02',
    'COMPLETED',
    4.99
FROM retail.customers
WHERE email = 'anna.mueller@example.com'

UNION ALL

SELECT
    'RP-1002',
    customer_id,
    TIMESTAMPTZ '2026-06-03 14:15:00+02',
    'SHIPPED',
    0.00
FROM retail.customers
WHERE email = 'david.martin@example.com'

UNION ALL

SELECT
    'RP-1003',
    customer_id,
    TIMESTAMPTZ '2026-06-05 09:45:00+02',
    'PAID',
    3.99
FROM retail.customers
WHERE email = 'priya.sharma@example.com'

ON CONFLICT (order_reference) DO NOTHING;
