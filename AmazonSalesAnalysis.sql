

-- There are a total of 65422 orders in this Amazon Sales Report
SELECT COUNT(*)
FROM `Amazon Sales report`.`amazon sale report`;

-- THere are a total of 5834 orders that were cancelled 
SELECT Status, COUNT(*) AS total_count
FROM `Amazon Sales report`.`amazon sale report`
WHERE Status = 'cancelled';

-- Bengaluru has the highest purchase value from the list
SELECT ship_city,
      SUM(Amount) AS total_amount
FROM `Amazon Sales report`.`amazon sale report`
GROUP BY 1
ORDER BY 2 DESC; 

-- Maharashtra is the most profitable state with 7,142,644 Rupees 
SELECT ship_state, 
       SUM(Amount) AS total_amount 
FROM `Amazon Sales report`.`amazon sale report`
GROUP BY 1
ORDER BY 2 DESC; 

-- 5th of April has the highest number of sales with a value of 5584 Rupees 
SELECT Date, 
       MAX(Amount)
FROM `Amazon Sales report`.`amazon sale report`
GROUP BY 1
ORDER BY 2 DESC;

-- Sales Amount for the month of April is 882059,17 Rupees
SELECT ROUND(SUM(Amount),2) AS total_amount
FROM `Amazon Sales report`.`amazon sale report`
WHERE MONTH(DATE) = 4; 

-- Part 2

-- How many 'IN Core Free Shipping 2015/04/08 23-48-5-108' promotion id were used (24346)
SELECT COUNT(*)
FROM `Amazon Sales report`.`amazon sale report`
WHERE promotion_ids = 'IN Core Free Shipping 2015/04/08 23-48-5-108'; 

-- How many orders were made where the size of the dress was S

SELECT *
FROM `Amazon Sales report`.`amazon sale report`;

-- How many couriers had a status of shipped (59584)

SELECT courier_status, 
       COUNT(*)AS total_count
FROM `Amazon Sales report`.`amazon sale report`
WHERE courier_status = 'shipped'
GROUP BY courier_status;

-- What is the total amount of kurta sold? (11191225,95 RS)

SELECT Category, 
       ROUND(SUM(Amount),2) AS total_amount
FROM `Amazon Sales report`.`amazon sale report`
WHERE Category = 'kurta';

-- What is the date range in the database? (03-31-22 & 05-31-22)
-- March 31st 2022 - May 31st 2022

SELECT MIN(Date) AS start_date, 
       MAX(Date) AS end_date 
FROM `Amazon Sales report`.`amazon sale report`;

-- What is the total sales figure for the month of May? (950544.05 RS)
SELECT ROUND(SUM(Amount),2) AS total_Sales
FROM `Amazon Sales report`.`amazon sale report`
WHERE MONTH(DATE) = 5; 

-- What is the total sales of kurtas in the month of May?
-- The total sales of kurtas in the month of May was 270912.29 Rs


SELECT Category, 
       ROUND(SUM(Amount), 2) AS total_amount
FROM `Amazon Sales report`.`amazon sale report`
WHERE DATE IN (
    SELECT DATE
    FROM `Amazon Sales report`.`amazon sale report`
    WHERE MONTH(DATE) = 5
)
AND Category = 'kurta'
GROUP BY Category;



