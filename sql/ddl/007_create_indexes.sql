CREATE INDEX IF NOT EXISTS idx_products_category_id
    ON retail.products(category_id);

CREATE INDEX IF NOT EXISTS idx_orders_customer_id
    ON retail.orders(customer_id);

CREATE INDEX IF NOT EXISTS idx_orders_order_timestamp
    ON retail.orders(order_timestamp);

CREATE INDEX IF NOT EXISTS idx_orders_order_status
    ON retail.orders(order_status);

CREATE INDEX IF NOT EXISTS idx_order_items_product_id
    ON retail.order_items(product_id);
