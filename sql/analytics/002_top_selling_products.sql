SELECT
    p.product_name,
    p.sku,
    SUM(oi.quantity) AS units_sold,
    SUM(oi.quantity * oi.unit_price) AS gross_sales,
    SUM(oi.discount_amount) AS total_discounts,
    SUM(
        oi.quantity * oi.unit_price
        - oi.discount_amount
    ) AS net_revenue,
    SUM(
        oi.quantity * oi.unit_price
        - oi.discount_amount
        - oi.quantity * p.unit_cost
    ) AS gross_profit
FROM retail.order_items AS oi
JOIN retail.orders AS o
    ON o.order_id = oi.order_id
JOIN retail.products AS p
    ON p.product_id = oi.product_id
WHERE o.order_status IN (
    'PAID',
    'SHIPPED',
    'COMPLETED'
)
GROUP BY
    p.product_id,
    p.product_name,
    p.sku
ORDER BY
    net_revenue DESC,
    units_sold DESC,
    p.product_name;
