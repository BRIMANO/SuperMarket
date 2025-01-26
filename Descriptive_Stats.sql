-- ***Calculate Average, Total, and Distribution***

SELECT 
    ROUND(AVG(unit_price), 2) AS avg_unit_price,
    SUM(quantity) AS total_quantity,
    ROUND(SUM(total_price), 0) AS total_revenue,
    ROUND(AVG(tax), 2) AS avg_tax
FROM sales_record;
/*
-- The average price of products sold is $10.84, indicating that most products are moderately priced.
-- A total of 20,674 units of products were sold, this indicates strong overall demand.
-- The business generated a total revenue of $237,168, with an average unit price of $10.84, this suggests a healthy balance between pricing and sales volume.
-- The average tax per transaction is $7.76, which is relatively high compared to the average unit price.
*/


-- ***Branch Performance: Compare Total Sales Across Branches***

SELECT 
    branch,
    ROUND(SUM(total_price), 0) AS total_sales,
    COUNT(sale_id) AS num_transactions
FROM sales_record
GROUP BY branch
ORDER BY total_sales DESC;

SELECT 
    city,
    ROUND(SUM(total_price), 0) AS total_revenue
FROM sales_record
GROUP BY city
ORDER BY total_revenue DESC;
/*
-- Branch A generated $165,623 with 1,348 transactions,
-- Branch B generated $71,545 with 652 transactions.
-- Chicago leads with $85,169, making it the top-performing city.
-- New York generated $80,454, slightly behind Chicago, indicating it’s a close competitor.
-- Los Angeles generated $71,545, making it the lowest-performing city.
*/

SELECT 
    city,
    ROUND(SUM(total_price),0) AS total_revenue_per_location
FROM sales_record
GROUP BY city;



-- ***Correlation Between Unit Price and Quantity Sold***

SELECT 
    unit_price,
    SUM(quantity) AS total_quantity_sold
FROM sales_record
GROUP BY unit_price
ORDER BY unit_price;


-- ***Calculate Profit for Each Product***

SELECT 
    product_name,
    product_category,
    SUM(total_price - tax) AS total_profit
FROM sales_record
GROUP BY product_name, product_category
ORDER BY total_profit DESC;
