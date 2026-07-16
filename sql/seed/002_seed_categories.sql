INSERT INTO retail.categories (
    category_name,
    category_description
)
VALUES
    ('Electronics', 'Computers, devices and accessories'),
    ('Home', 'Home, kitchen and household products'),
    ('Fashion', 'Clothing and fashion accessories'),
    ('Sports', 'Sports and fitness equipment'),
    ('Books', 'Printed and digital books')
ON CONFLICT (category_name) DO NOTHING;
