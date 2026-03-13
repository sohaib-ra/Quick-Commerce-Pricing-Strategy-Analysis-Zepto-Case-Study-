CREATE DATABASE zepto_analysis;
USE zepto_analysis;

-- Dimension: Products
CREATE TABLE products (
    product_id INT AUTO_INCREMENT PRIMARY KEY,
    product_name VARCHAR(255),
    category VARCHAR(100),
    original_price DECIMAL(10,2)
);

-- Dimension: Cities
CREATE TABLE cities (
    city_id INT AUTO_INCREMENT PRIMARY KEY,
    city_name VARCHAR(100)
);

-- Fact Table: Sales
CREATE TABLE sales (
    sale_id INT AUTO_INCREMENT PRIMARY KEY,
    product_id INT,
    city_id INT,
    current_price DECIMAL(10,2),
    discount DECIMAL(5,2),
    orders_quantity INT,
    total_revenue DECIMAL(12,2),
    influencer_active BOOLEAN,
    FOREIGN KEY (product_id) REFERENCES products(product_id),
    FOREIGN KEY (city_id) REFERENCES cities(city_id)
);

-- Raw staging table
CREATE TABLE zepto_raw (
    product_name VARCHAR(255),
    category VARCHAR(100),
    city VARCHAR(100),
    original_price DECIMAL(10,2),
    current_price DECIMAL(10,2),
    discount DECIMAL(5,2),
    orders INT,
    total_revenue DECIMAL(12,2),
    influencer_active VARCHAR(10)
);