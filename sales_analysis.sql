-- SQL SALES DATA ANALYSIS PROJECT

USE sales_analysis;


-- DATA OVERVIEW

SELECT *
FROM sales
LIMIT 10;


SELECT COUNT(*) AS total_orders
FROM sales;


-- KEY PERFORMANCE INDICATORS

SELECT
    COUNT(*) AS total_orders,
    ROUND(SUM(Sales), 2) AS total_sales,
    ROUND(SUM(Profit), 2) AS total_profit,
    SUM(Quantity) AS total_quantity,
    COUNT(DISTINCT Customer) AS total_customers,
    ROUND(AVG(Sales), 2) AS average_order_value
FROM sales;


-- PRODUCT ANALYSIS

SELECT
    Product,
    ROUND(SUM(Sales), 2) AS total_sales
FROM sales
GROUP BY Product
ORDER BY total_sales DESC;


SELECT
    Product,
    ROUND(SUM(Profit), 2) AS total_profit
FROM sales
GROUP BY Product
ORDER BY total_profit DESC;


-- CATEGORY ANALYSIS


SELECT
    Category,
    ROUND(SUM(Sales), 2) AS total_sales,
    ROUND(SUM(Profit), 2) AS total_profit
FROM sales
GROUP BY Category
ORDER BY total_sales DESC;


-- REGION ANALYSIS


SELECT
    Region,
    ROUND(SUM(Sales), 2) AS total_sales,
    ROUND(SUM(Profit), 2) AS total_profit
FROM sales
GROUP BY Region
ORDER BY total_sales DESC;


-- CITY ANALYSIS


SELECT
    City,
    ROUND(SUM(Sales), 2) AS total_sales
FROM sales
GROUP BY City
ORDER BY total_sales DESC
LIMIT 5;


-- CUSTOMER ANALYSIS


SELECT
    Customer,
    ROUND(SUM(Sales), 2) AS total_sales
FROM sales
GROUP BY Customer
ORDER BY total_sales DESC
LIMIT 5;


-- MONTHLY ANALYSIS


SELECT
    DATE_FORMAT(Order_Date, '%Y-%m') AS month,
    ROUND(SUM(Sales), 2) AS total_sales,
    ROUND(SUM(Profit), 2) AS total_profit
FROM sales
GROUP BY DATE_FORMAT(Order_Date, '%Y-%m')
ORDER BY month;



-- SALES PERFORMANCE

SELECT
    Order_ID,
    Product,
    Sales,
    CASE
        WHEN Sales >= 500 THEN 'High'
        WHEN Sales >= 200 THEN 'Medium'
        ELSE 'Low'
    END AS sales_level
FROM sales;


-- PROFIT STATUS

SELECT
    Order_ID,
    Product,
    Sales,
    Profit,
    CASE
        WHEN Profit > 100 THEN 'High Profit'
        WHEN Profit > 0 THEN 'Profit'
        ELSE 'Loss'
    END AS profit_status
FROM sales;



-- PRODUCT RANKING

SELECT
    Product,
    ROUND(SUM(Sales), 2) AS total_sales,
    RANK() OVER (
        ORDER BY SUM(Sales) DESC
    ) AS sales_rank
FROM sales
GROUP BY Product;