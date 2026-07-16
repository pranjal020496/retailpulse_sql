WITH product_sales AS (
    SELECT
        c.category_name,
        p.product_name,
        p.sku,
        SUM(oi.quantity) AS units_sold,
        SUM(
            oi.quantity * oi.unit_price
            - oi.discount_amount
        ) AS net_revenue
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
        c.category_name,
        p.product_name,
        p.sku
)
SELECT
    category_name,
    product_name,
    sku,
    units_sold,
    net_revenue,
    DENSE_RANK() OVER (
        PARTITION BY category_name
        ORDER BY net_revenue DESC
    ) AS revenue_rank_in_category
FROM product_sales
ORDER BY
    category_name,
    revenue_rank_in_category,
    product_name;
