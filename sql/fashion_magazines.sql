--SELECT Add your sql here


-- Write a SQL query that returns the customer name and total amount due for the 
-- customers that have unpaid Fashion Magazine subscriptions. Note that the column 
-- names in the resulting file need to match the column names in the example below.

-- Hints
-- - Build the query piece by piece 
-- - Start with the orders table and work out from there.
-- - Filter the orders table on the `orders.order_status` column
-- - Join the customers table to the orders table to get the customer's name
-- - Join the subscriptions table to the orders table as to get the number of 
-- months and subscription length
-- - filter the orders on the `subscriptions.description` column
-- - Multiply the subscirption price with the subscription length to get the total 
-- amount due
-- - Format the total amount due as currency using the `PRINTF()` function
-- - Group By Cuustomer and sum the amount due to account for customers that have 
-- more than one unpaid Fashion Magazine subscriptions

SELECT order_status, customer_name, description, (price_per_month*subscription_length)
FROM orders
JOIN customers
    ON orders.customer_id = customers.customer_id
JOIN subscriptions
    ON orders.subscription_id = subscriptions.subscription_id
WHERE order_status="unpaid"
GROUP BY customer_name;


