INSERT INTO retail.customers (
    first_name,
    last_name,
    email,
    country_code
)
VALUES
    ('Anna', 'Mueller', 'anna.mueller@example.com', 'DE'),
    ('David', 'Martin', 'david.martin@example.com', 'FR'),
    ('Priya', 'Sharma', 'priya.sharma@example.com', 'IN')
ON CONFLICT (email) DO NOTHING;
