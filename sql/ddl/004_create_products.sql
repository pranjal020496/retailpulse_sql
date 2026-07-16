CREATE TABLE IF NOT EXISTS retail.products (
    product_id BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,

    category_id BIGINT NOT NULL,

    product_name VARCHAR(150) NOT NULL,
    sku VARCHAR(50) NOT NULL UNIQUE,

    unit_price NUMERIC(10, 2) NOT NULL,
    unit_cost NUMERIC(10, 2) NOT NULL,

    is_active BOOLEAN NOT NULL DEFAULT TRUE,
    created_at TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT fk_products_category
        FOREIGN KEY (category_id)
        REFERENCES retail.categories(category_id),

    CONSTRAINT chk_product_price
        CHECK (unit_price >= 0),

    CONSTRAINT chk_product_cost
        CHECK (unit_cost >= 0),

    CONSTRAINT chk_price_above_cost
        CHECK (unit_price >= unit_cost)
);
