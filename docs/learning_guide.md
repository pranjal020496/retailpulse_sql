# RetailPulse Learning Guide

## Recommended reading order

1. `sql/ddl/001_create_schema.sql`
2. `sql/ddl/002_create_customers.sql`
3. `sql/ddl/003_create_categories.sql`
4. `sql/ddl/004_create_products.sql`
5. `sql/ddl/005_create_orders.sql`
6. `sql/ddl/006_create_order_items.sql`
7. `sql/seed/`
8. `sql/analytics/`
9. `sql/ddl/007_create_indexes.sql`
10. `sql/ddl/008_create_views.sql`
11. `sql/tests/`

## Concepts

- A schema is a namespace for database objects.
- A primary key identifies a row.
- A foreign key connects related rows.
- Constraints protect data quality.
- `JOIN` combines related tables.
- `GROUP BY` produces summaries.
- CTEs give temporary result sets readable names.
- Window functions rank rows without collapsing them.
- Indexes can improve reads but add write and storage cost.

## Helpful psql commands

```text
\dt retail.*       List tables
\d retail.orders   Describe a table
\dv retail.*       List views
\di retail.*       List indexes
\q                 Exit psql
```

At a prompt ending in `%`, enter Terminal commands. At `retailpulse=#`, enter
SQL or psql meta-commands.
