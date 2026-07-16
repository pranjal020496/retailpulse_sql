SELECT
    (SELECT COUNT(*) FROM retail.customers) AS customer_count,
    (SELECT COUNT(*) FROM retail.categories) AS category_count,
    (SELECT COUNT(*) FROM retail.products) AS product_count,
    (SELECT COUNT(*) FROM retail.orders) AS order_count,
    (SELECT COUNT(*) FROM retail.order_items) AS order_item_count;

SELECT
    ROUND(SUM(order_total), 2) AS valid_order_revenue
FROM retail.vw_order_summary
WHERE order_status IN (
    'PAID',
    'SHIPPED',
    'COMPLETED'
);
