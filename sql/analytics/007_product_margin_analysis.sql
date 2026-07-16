SELECT
    p.product_name,
    p.sku,
    p.unit_price AS current_catalogue_price,
    p.unit_cost,
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
    ) AS realised_margin_percent
FROM retail.products AS p
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
    p.product_id,
    p.product_name,
    p.sku,
    p.unit_price,
    p.unit_cost
ORDER BY gross_profit DESC;
