INSERT INTO retail.customers (
    first_name,
    last_name,
    email,
    country_code,
    customer_status
)
VALUES
    ('Anna', 'Mueller', 'anna.mueller@example.com', 'DE', 'ACTIVE'),
    ('David', 'Martin', 'david.martin@example.com', 'FR', 'ACTIVE'),
    ('Priya', 'Sharma', 'priya.sharma@example.com', 'IN', 'ACTIVE'),
    ('Lucas', 'Silva', 'lucas.silva@example.com', 'PT', 'ACTIVE'),
    ('Sofia', 'Rossi', 'sofia.rossi@example.com', 'IT', 'ACTIVE'),
    ('Emma', 'Johnson', 'emma.johnson@example.com', 'GB', 'ACTIVE'),
    ('Noah', 'Williams', 'noah.williams@example.com', 'US', 'INACTIVE'),
    ('Lina', 'Andersson', 'lina.andersson@example.com', 'SE', 'ACTIVE')
ON CONFLICT (email) DO NOTHING;
