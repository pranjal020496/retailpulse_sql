WITH order_totals AS (
    SELECT
        o.order_id,
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
        o.order_timestamp,
        o.shipping_amount
)
SELECT
    DATE_TRUNC('month', order_timestamp)::date AS revenue_month,
    COUNT(*) AS order_count,
    ROUND(SUM(order_total), 2) AS total_revenue,
    ROUND(AVG(order_total), 2) AS average_order_value
FROM order_totals
GROUP BY DATE_TRUNC('month', order_timestamp)
ORDER BY revenue_month;
