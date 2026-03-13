alidate raw record count
SELECT COUNT(*) FROM zepto_raw;

-- Insert unique products
INSERT INTO products (product_name, category, original_price)
SELECT DISTINCT product_name, category, original_price
FROM zepto_raw;

-- Insert unique cities
INSERT INTO cities (city_name)
SELECT DISTINCT city
FROM zepto_raw;

-- Populate fact table
INSERT INTO sales (
    product_id,
    city_id,
    current_price,
    discount,
    orders_quantity,
    total_revenue,
    influencer_active
)
SELECT 
    p.product_id,
    c.city_id,
    zr.current_price,
    zr.discount,
    zr.orders,
    zr.total_revenue,
    CASE 
        WHEN zr.influencer_active = 'Yes' THEN 1
        ELSE 0
    END
FROM zepto_raw zr
JOIN products p 
    ON zr.product_name = p.product_name
   AND zr.original_price = p.original_price
JOIN cities c 
    ON zr.city = c.city_name;

-- Validate fact table load
SELECT COUNT(*) FROM sales;

-- Revenue validation check
SELECT 
    current_price,
    orders_quantity,
    total_revenue,
    (current_price * orders_quantity) AS calculated_revenue
FROM sales
LIMIT 20;