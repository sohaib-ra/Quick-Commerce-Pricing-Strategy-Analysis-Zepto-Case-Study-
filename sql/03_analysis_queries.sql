-- 1. Top products by order volume

SELECT 
    p.product_name,
    SUM(s.orders_quantity) AS total_orders
FROM sales s
JOIN products p 
    ON s.product_id = p.product_id
GROUP BY p.product_name
ORDER BY total_orders DESC
LIMIT 10;



-- 2. Top products by total revenue

SELECT 
    p.product_name,
    SUM(s.total_revenue) AS total_revenue
FROM sales s
JOIN products p 
    ON s.product_id = p.product_id
GROUP BY p.product_name
ORDER BY total_revenue DESC
LIMIT 10;



-- 3. Discount vs Order Volume

SELECT 
    discount,
    SUM(orders_quantity) AS total_orders
FROM sales
GROUP BY discount
ORDER BY discount;



-- 4. Discount vs Revenue Impact

SELECT 
    discount,
    SUM(total_revenue) AS total_revenue
FROM sales
GROUP BY discount
ORDER BY discount;



-- 5. Category-Level Price Sensitivity

SELECT 
    p.category,
    s.discount,
    SUM(s.total_revenue) AS revenue
FROM sales s
JOIN products p
    ON s.product_id = p.product_id
GROUP BY p.category, s.discount
ORDER BY p.category, s.discount;