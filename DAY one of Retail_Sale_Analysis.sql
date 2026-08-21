-- ==========================================
-- RETAIL SALES ANALYSIS
-- ==========================================

-- 1. BASIC DATA OVERVIEW
SELECT *
FROM sales;


-- 2. TOTAL REVENUE
SELECT
    SUM(quantity * price) AS total_revenue
FROM sales;


-- 3. AVERAGE ORDER VALUE
SELECT
    AVG(quantity * price) AS average_order_value
FROM sales;


-- 4. TOP 5 ORDERS BY REVENUE
SELECT
    order_id,
    customer_name,
    product,
    quantity * price AS revenue
FROM sales
ORDER BY revenue DESC
LIMIT 5;

-- 6. REVENUE BY CATEGORY

SELECT
    category,
    SUM(quantity * price) AS total_revenue
FROM sales
GROUP BY category
ORDER BY total_revenue DESC;

-- 8. PRODUCTS BY QUANTITY SOLD

SELECT
    product,
    SUM(quantity) AS units_sold
FROM sales
GROUP BY product
ORDER BY units_sold DESC;

-- 9. REVENUE BY CITY

SELECT
    city,
    SUM(quantity * price) AS total_revenue
FROM sales
GROUP BY city
ORDER BY total_revenue DESC;


-- 10. TOP CUSTOMERS BY REVENUE

SELECT
    customer_name,
    SUM(quantity * price) AS total_spent
FROM sales
GROUP BY customer_name
ORDER BY total_spent DESC
LIMIT 5;

-- 11. MONTHLY REVENUE

SELECT
    DATE_TRUNC('month', order_date) AS month,
    SUM(quantity * price) AS total_revenue
FROM sales
GROUP BY month
ORDER BY month;

-- 12. MONTHLY ORDER COUNT

SELECT
    DATE_TRUNC('month', order_date) AS month,
    COUNT(order_id) AS total_orders
FROM sales
GROUP BY month
ORDER BY month;

-- 13. AVERAGE ORDER VALUE BY CITY

SELECT
    city,
    AVG(quantity * price) AS average_order_value
FROM sales
GROUP BY city
ORDER BY average_order_value DESC;

-- 14. HIGH-VALUE ORDERS

SELECT
    order_id,
    customer_name,
    product,
    quantity * price AS revenue
FROM sales
WHERE quantity * price > 10000
ORDER BY revenue DESC;

-- 15. REVENUE ANALYSIS

SELECT
    order_id,
    customer_name,
    product,
    category,
    city,
    quantity,
    price,
    quantity * price AS revenue
FROM sales
ORDER BY revenue DESC;

SELECT *
FROM sales;
