-- ***Analyze Spending by Customer Type and Gender***

SELECT 
    customer_type,
    gender,
    ROUND(SUM(total_price), 0) AS total_spent,
    COUNT(sale_id) AS num_transactions
FROM sales_record
GROUP BY customer_type, gender
ORDER BY total_spent DESC;


-- The total number of customers visiting each store.

SELECT 
    city,
    COUNT(DISTINCT sale_id) AS total_customers
FROM sales_record
GROUP BY city;


-- ***Compare total spending between Member and Normal customers.***

SELECT 
    customer_type,
    ROUND(SUM(total_price), 0) AS total_spent,
    COUNT(sale_id) AS num_transactions,
    ROUND(AVG(total_price), 0) AS avg_spent_per_transaction
FROM sales_record
GROUP BY customer_type
ORDER BY total_spent DESC;


-- ***Compare total spending between male and female customers.***

SELECT 
    gender,
    ROUND(SUM(total_price), 0) AS total_spent,
    COUNT(sale_id) AS num_transactions,
    ROUND(AVG(total_price), 0) AS avg_spent_per_transaction
FROM sales_record
GROUP BY gender
ORDER BY total_spent DESC;





