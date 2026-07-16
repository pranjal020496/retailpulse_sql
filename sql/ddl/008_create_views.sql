CREATE OR REPLACE VIEW retail.vw_order_line_details AS
SELECT
    o.order_id,
    o.order_reference,
    o.order_timestamp,
    o.order_status,
    c.customer_id,
    c.first_name,
    c.last_name,
    c.email,
    c.country_code,
    p.product_id,
    p.product_name,
    p.sku,
    cat.category_id,
    cat.category_name,
    oi.quantity,
    oi.unit_price,
    p.unit_cost,
    oi.discount_amount,
    oi.quantity * oi.unit_price AS gross_line_sales,
    oi.quantity * oi.unit_price
        - oi.discount_amount AS line_revenue,
    oi.quantity * p.unit_cost AS line_cost,
    oi.quantity * oi.unit_price
        - oi.discount_amount
        - oi.quantity * p.unit_cost AS line_profit
FROM retail.orders AS o
JOIN retail.customers AS c
    ON c.customer_id = o.customer_id
JOIN retail.order_items AS oi
    ON oi.order_id = o.order_id
JOIN retail.products AS p
    ON p.product_id = oi.product_id
JOIN retail.categories AS cat
    ON cat.category_id = p.category_id;


CREATE OR REPLACE VIEW retail.vw_order_summary AS
SELECT
    o.order_id,
    o.order_reference,
    o.order_timestamp,
    o.order_status,
    c.customer_id,
    c.first_name,
    c.last_name,
    c.email,
    SUM(
        oi.quantity * oi.unit_price
        - oi.discount_amount
    ) AS item_total,
    o.shipping_amount,
    SUM(
        oi.quantity * oi.unit_price
        - oi.discount_amount
    ) + o.shipping_amount AS order_total,
    SUM(
        oi.quantity * oi.unit_price
        - oi.discount_amount
        - oi.quantity * p.unit_cost
    ) AS gross_profit_before_shipping
FROM retail.orders AS o
JOIN retail.customers AS c
    ON c.customer_id = o.customer_id
JOIN retail.order_items AS oi
    ON oi.order_id = o.order_id
JOIN retail.products AS p
    ON p.product_id = oi.product_id
GROUP BY
    o.order_id,
    o.order_reference,
    o.order_timestamp,
    o.order_status,
    c.customer_id,
    c.first_name,
    c.last_name,
    c.email,
    o.shipping_amount;
