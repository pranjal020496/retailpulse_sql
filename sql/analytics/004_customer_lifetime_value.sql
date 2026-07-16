WITH order_totals AS (
    SELECT
        o.order_id,
        o.customer_id,
        o.order_timestamp,
        SUM(
            oi.quantity * oi.unit_price
            - oi.discount_amount
        ) + o.shipping_amount AS order_total
    FROM retail.orders AS o
    JOIN retail.order_items AS oi
        ON oi.order_id = o.order_id
    WHERE o.order_status IN (
        'PAID',
        'SHIPPED',
        'COMPLETED'
    )
    GROUP BY
        o.order_id,
        o.customer_id,
        o.order_timestamp,
        o.shipping_amount
)
SELECT
    c.customer_id,
    c.first_name,
    c.last_name,
    c.email,
    COUNT(ot.order_id) AS completed_order_count,
    COALESCE(ROUND(SUM(ot.order_total), 2), 0) AS lifetime_revenue,
    COALESCE(ROUND(AVG(ot.order_total), 2), 0) AS average_order_value,
    MIN(ot.order_timestamp) AS first_order_at,
    MAX(ot.order_timestamp) AS most_recent_order_at
FROM retail.customers AS c
LEFT JOIN order_totals AS ot
    ON ot.customer_id = c.customer_id
GROUP BY
    c.customer_id,
    c.first_name,
    c.last_name,
    c.email
ORDER BY
    lifetime_revenue DESC,
    c.email;
