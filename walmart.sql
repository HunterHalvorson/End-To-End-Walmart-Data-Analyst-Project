SELECT * FROM walmart;

DROP TABLE walmart;


SELECT 
	DISTINCT payment_method 
FROM walmart;



SELECT
	payment_method,
	COUNT(*)
FROM 
	walmart
GROUP BY
	payment_method;



SELECT
	MAX(quantity), MIN(quantity)
FROM 
	walmart;

-- Business Problems
-- 1. Find different payment method and number of transactions, number of qty sold
SELECT
	payment_method,
	COUNT(*) as no_payments,
	SUM(quantity) as no_qty_sold
FROM walmart
GROUP BY payment_method

-- 2. Identify the highest rated category in each branch, displaying the branch,
-- 	  category, AVG rating
SELECT *
FROM
	(SELECT
		branch,
		category,
		AVG(rating) as avg_rating,
		RANK() OVER(PARTITION BY branch ORDER BY AVG(rating) DESC) as rank
	FROM 
		walmart
	GROUP BY 1, 2
	ORDER BY 1, 3 DESC
	)
where rank = 1;

-- 3. Identify the busiest day for each branch based on the number of transactions
SELECT *
FROM
	(SELECT 
		branch,
		TO_CHAR(TO_DATE(date, 'DD/MM/YY'), 'Day') AS day_name,
		COUNT(*) as no_transactions,
		RANK() OVER(PARTITION BY branch ORDER BY COUNT(*) DESC) as rank
	FROM 
		walmart
	GROUP BY
		1, 2
	ORDER BY
		1, 3 DESC
	)
where rank = 1;

-- 4. Calculate the total quanitity of items sold per payment method
--	  List Payment method and total quantity
SELECT 
	payment_method,
	SUM(quantity) as no_items_sold
FROM 
	walmart
GROUP BY
	payment_method;


-- 5. Determine the average, minimumn and maximum rating of
--	  product for each city
SELECT
	city,
	ROUND(AVG(rating)::numeric, 2) as avg_rating,
	MIN(rating) as min_rating,
	MAX(rating) as max_rating
FROM 
	walmart
GROUP BY
	city;


-- 6. Calculate the total profit for each category by considering total_profit as
-- (unit_price * quantity * profit_margin).
-- List category and total_profit, ordered from highgst to lowest profit.
SELECT 
	category,
	SUM(total) as total_revenue,
	SUM(total * profit_margin) as profit
FROM 
	walmart
GROUP BY
	1;

-- 8. Determine most common payment method for each branch
WITH cte AS (
    SELECT 
        branch, 
        payment_method,
        COUNT(*) AS total_trans
    FROM walmart
    GROUP BY branch, payment_method
),
ranked AS (
    SELECT *,
        RANK() OVER (
            PARTITION BY branch
            ORDER BY total_trans DESC
        ) AS rnk
    FROM cte
)
SELECT *
FROM ranked
WHERE rnk = 1;


	

	
	




