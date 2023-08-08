-- Find Total Revenue
SELECT SUM(total_price) as Total_Revenue FROM pizza_sales;
-- Find Avg order value
SELECT (SUM(total_price)/COUNT(DISTINCT order_id)) as Average_Order FROM pizza_sales;
-- Total pizza sold
SELECT SUM(quantity) as Total_Pizza_Sold FROM pizza_sales;
-- Total Orders
SELECT COUNT(DISTINCT order_id) as Total_Order FROM pizza_sales;
-- Avg pizza per order
SELECT CAST(CAST(SUM(quantity) AS DECIMAL(10,2)) / 
CAST(COUNT(DISTINCT order_id) AS DECIMAL(10,2)) AS DECIMAL(10,2))
AS Avg_Pizzas_per_order
FROM pizza_sales;
-- Daily Trend for total orders
SELECT DISTINCT 
    CASE 
        WHEN EXTRACT(DOW FROM order_date) = 0 THEN 'Sunday'
        WHEN EXTRACT(DOW FROM order_date) = 1 THEN 'Monday'
        WHEN EXTRACT(DOW FROM order_date) = 2 THEN 'Tuesday'
        WHEN EXTRACT(DOW FROM order_date) = 3 THEN 'Wednesday'
        WHEN EXTRACT(DOW FROM order_date) = 4 THEN 'Thursday'
        WHEN EXTRACT(DOW FROM order_date) = 5 THEN 'Friday'
        WHEN EXTRACT(DOW FROM order_date) = 6 THEN 'Saturday'
    END AS day_of_week, 
    COUNT(DISTINCT order_id) AS total_order
FROM pizza_sales 
GROUP BY day_of_week;
-- Hourly trend for Order
SELECT EXTRACT(HOUR FROM order_time) as order_hours, COUNT(DISTINCT order_id) as total_orders
FROM pizza_sales
GROUP BY order_hours
ORDER BY order_hours;
-- % of Sales by Pizza Category
SELECT pizza_category, CAST(SUM(total_price) AS DECIMAL(10,2)) as total_revenue,
CAST(SUM(total_price) * 100 / (SELECT SUM(total_price) from pizza_sales) AS DECIMAL(10,2)) AS Percentage
FROM pizza_sales
GROUP BY pizza_category;
-- % of Sales by Pizza Size
SELECT pizza_size, CAST(SUM(total_price) AS DECIMAL(10,2)) as total_revenue,
CAST(SUM(total_price) * 100 / (SELECT SUM(total_price) from pizza_sales) AS DECIMAL(10,2)) AS Percentage
FROM pizza_sales
GROUP BY pizza_size
ORDER BY pizza_size;
-- Total Pizzas Sold by Pizza Category
SELECT pizza_category, SUM(quantity) as Total_Quantity_Sold
FROM pizza_sales
GROUP BY pizza_category
ORDER BY Total_Quantity_Sold DESC;
-- Top 5 Best Sellers by Total Pizzas Sold
SELECT pizza_name, SUM(quantity) AS Total_Pizza_Sold
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Pizza_Sold DESC LIMIT 5;
-- Bottom 5 Best Sellers by Total Pizzas Sold
SELECT pizza_name, SUM(quantity) AS Total_Pizza_Sold
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Pizza_Sold ASC LIMIT 5;






