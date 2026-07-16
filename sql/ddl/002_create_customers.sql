CREATE TABLE IF NOT EXISTS retail.customers (
    customer_id BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,

    first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100) NOT NULL,
    email VARCHAR(255) NOT NULL UNIQUE,

    country_code CHAR(2),
    customer_status VARCHAR(20) NOT NULL DEFAULT 'ACTIVE',

    created_at TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT chk_customer_status
        CHECK (
            customer_status IN (
                'ACTIVE',
                'INACTIVE',
                'BLOCKED'
            )
        )
);
