SELECT
    c.category_name,
    COUNT(DISTINCT o.order_id) AS order_count,
    COUNT(DISTINCT p.product_id) AS distinct_products_sold,
    SUM(oi.quantity) AS units_sold,
    SUM(
        oi.quantity * oi.unit_price
        - oi.discount_amount
    ) AS net_revenue,
    SUM(oi.quantity * p.unit_cost) AS total_cost,
    SUM(
        oi.quantity * oi.unit_price
        - oi.discount_amount
        - oi.quantity * p.unit_cost
    ) AS gross_profit,
    ROUND(
        100.0
        * SUM(
            oi.quantity * oi.unit_price
            - oi.discount_amount
            - oi.quantity * p.unit_cost
        )
        / NULLIF(
            SUM(
                oi.quantity * oi.unit_price
                - oi.discount_amount
            ),
            0
        ),
        2
    ) AS gross_margin_percent
FROM retail.categories AS c
JOIN retail.products AS p
    ON p.category_id = c.category_id
JOIN retail.order_items AS oi
    ON oi.product_id = p.product_id
JOIN retail.orders AS o
    ON o.order_id = oi.order_id
WHERE o.order_status IN (
    'PAID',
    'SHIPPED',
    'COMPLETED'
)
GROUP BY
    c.category_id,
    c.category_name
ORDER BY net_revenue DESC;
