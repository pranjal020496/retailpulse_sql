CREATE TABLE IF NOT EXISTS retail.orders (
    order_id BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,

    order_reference VARCHAR(50) NOT NULL UNIQUE,
    customer_id BIGINT NOT NULL,

    order_timestamp TIMESTAMPTZ NOT NULL,
    order_status VARCHAR(20) NOT NULL DEFAULT 'PENDING',

    shipping_amount NUMERIC(10, 2) NOT NULL DEFAULT 0,
    created_at TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT fk_orders_customer
        FOREIGN KEY (customer_id)
        REFERENCES retail.customers(customer_id),

    CONSTRAINT chk_order_status
        CHECK (
            order_status IN (
                'PENDING',
                'PAID',
                'SHIPPED',
                'COMPLETED',
                'CANCELLED',
                'REFUNDED'
            )
        ),

    CONSTRAINT chk_shipping_amount
        CHECK (shipping_amount >= 0)
);
