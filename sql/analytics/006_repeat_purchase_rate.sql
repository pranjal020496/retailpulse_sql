WITH customer_order_counts AS (
    SELECT
        c.customer_id,
        COUNT(o.order_id) AS valid_order_count
    FROM retail.customers AS c
    LEFT JOIN retail.orders AS o
        ON o.customer_id = c.customer_id
        AND o.order_status IN (
            'PAID',
            'SHIPPED',
            'COMPLETED'
        )
    GROUP BY c.customer_id
)
SELECT
    COUNT(*) FILTER (
        WHERE valid_order_count >= 1
    ) AS purchasing_customers,
    COUNT(*) FILTER (
        WHERE valid_order_count >= 2
    ) AS repeat_customers,
    ROUND(
        100.0
        * COUNT(*) FILTER (
            WHERE valid_order_count >= 2
        )
        / NULLIF(
            COUNT(*) FILTER (
                WHERE valid_order_count >= 1
            ),
            0
        ),
        2
    ) AS repeat_purchase_rate_percent
FROM customer_order_counts;
