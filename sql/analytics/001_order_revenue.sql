SELECT
    o.order_reference,
    c.first_name,
    c.last_name,
    o.order_status,
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
    c.first_name,
    c.last_name,
    o.order_status,
    o.shipping_amount
ORDER BY o.order_reference;
