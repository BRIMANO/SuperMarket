-- ***Top-Selling Products***

SELECT 
    product_name,
    SUM(quantity) AS total_quantity_sold,
    SUM(total_price) AS total_revenue
FROM sales_record
GROUP BY product_name
ORDER BY total_quantity_sold DESC
LIMIT 10;



-- ***Most Profitable Product Categories***

SELECT 
    product_category,
    SUM(total_price - tax) AS total_profit
FROM sales_record
GROUP BY product_category
ORDER BY total_profit DESC;


-- ***Analyze Reward Points by Product Category***

SELECT 
    product_category,
    SUM(reward_points) AS total_reward_points
FROM sales_record
GROUP BY product_category
ORDER BY total_reward_points DESC;


-- ***Tax Contribution by Product Category***

SELECT 
    product_category,
    SUM(tax) AS total_tax
FROM sales_record
GROUP BY product_category
ORDER BY total_tax DESC;

-- ***Most Popular Categories for Each Branch***

SELECT 
    branch,
    product_category,
    SUM(quantity) AS total_quantity_sold
FROM sales_record
GROUP BY branch, product_category
ORDER BY branch, total_quantity_sold DESC;
