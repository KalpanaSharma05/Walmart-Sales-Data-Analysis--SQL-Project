Create database saleswalmart;
use saleswalmart;
SELECT * FROM saleswalmart.`walmartsalesdata.csv`;

-- Adding New Column Time_of_day --

alter table saleswalmart.`walmartsalesdata.csv`
add column time_of_day varchar(20);
UPDATE saleswalmart.`walmartsalesdata.csv`
SET time_of_day = (
	CASE
		WHEN `time` BETWEEN "00:00:00" AND "12:00:00" THEN "Morning"
        WHEN `time` BETWEEN "12:01:00" AND "16:00:00" THEN "Afternoon"
        ELSE "Evening"
    END
);

-- Adding New Column Dayname --

SELECT date, DAYNAME(date)
FROM saleswalmart.`walmartsalesdata.csv`;

-- Adding New Column Monthname --

SELECT date, Monthname(date)
FROM saleswalmart.`walmartsalesdata.csv`;

------------------------------------------------------------------------------------------------------------
-- Generic Question

-- Q1) How many unique cities does the data have?

select distinct city from saleswalmart.`walmartsalesdata.csv`;

-- Q2)In which city is each branch?

select distinct city, branch from saleswalmart.`walmartsalesdata.csv`;

-----------------------------------------------------------------------------------------------------------
-- Product

-- Q1) How many unique product lines does the data have?

select count(distinct `product line`) from saleswalmart.`walmartsalesdata.csv`;
select distinct `product line` from saleswalmart.`walmartsalesdata.csv`;

-- Q2) What is the most common payment method?

select payment, count(payment) from saleswalmart.`walmartsalesdata.csv` group by payment 
order by count(payment) desc limit 1;

-- Q3) What is the most selling product line?

select `product line`, sum(quantity) from saleswalmart.`walmartsalesdata.csv` group by `product line`
order by sum(quantity) desc limit 1;

-- Q4) What is the total revenue by month?

select floor(sum(total)) as total_revenue, monthname(date) as month from saleswalmart.`walmartsalesdata.csv`
 group by monthname(date);
 
 -- Q5) What month had the largest COGS?
 
 select floor(sum(cogs)) , monthname(date) as month from saleswalmart.`walmartsalesdata.csv`
 group by monthname(date) order by floor(sum(cogs)) desc limit 1;
 
 -- Q6) What product line had the largest revenue?
 
 select `product line` , sum(total) as Revenue from saleswalmart.`walmartsalesdata.csv` group by `product line`
order by sum(total) desc limit 1;

-- Q7) What is the city with the largest revenue?

select city, sum(total) as Revenue from saleswalmart.`walmartsalesdata.csv` group by city;

-- Q8) What product line had the largest VAT?

select `product line` , sum(`Tax 5%`) as VAT from saleswalmart.`walmartsalesdata.csv` group by `product line`
order by sum(`Tax 5%`) desc limit 1;

-- Q9) Fetch each product line and add a column to those product line showing "Good", "Bad". 
-- Good if its greater than average sales

SELECT 
    `unit price`, 
    quantity, 
    CASE 
        WHEN  quantity > (SELECT AVG(quantity) FROM saleswalmart.`walmartsalesdata.csv`) 
        THEN 'Good' 
        ELSE 'Bad' 
    END AS performance
FROM saleswalmart.`walmartsalesdata.csv`;

-- Q10) Which branch sold more products than average product sold?

SELECT branch, SUM(quantity) AS qnty
FROM saleswalmart.`walmartsalesdata.csv`
GROUP BY branch
HAVING SUM(quantity) > (SELECT AVG(quantity) FROM saleswalmart.`walmartsalesdata.csv`);

-- Q11) What is the most common product line by gender?

select `product line` ,count(gender), gender  from saleswalmart.`walmartsalesdata.csv` 
group by `product line`, gender 
order by count(gender) desc;

-- Q12) What is the average rating of each product line?

select `product line`, avg(rating) from saleswalmart.`walmartsalesdata.csv`group by `product line`;

------------------------------------------------------------------------------------------------------------
-- Sales
-- Q1) Number of sales made in each time of the day per weekday

select count(quantity),time_of_day, weekday(date) as wday from saleswalmart.`walmartsalesdata.csv`
group by time_of_day, wday;

-- Q2) Which of the customer types brings the most revenue?

select `customer type`, sum(total) as revenue from saleswalmart.`walmartsalesdata.csv`
group by `customer type` order by revenue desc;

-- Q3) Which city has the largest tax percent/ VAT (Value Added Tax)?

select city, sum(`tax 5%`) as vat from saleswalmart.`walmartsalesdata.csv`
group by city order by vat desc limit 1;

-- Q4) Which customer type pays the most in VAT? 
select `customer type`, max(`tax 5%`) as Maximum_VAT
from saleswalmart.`walmartsalesdata.csv` group by `customer type` ; 

--------------------------------------------------------------------------------------------------------
-- Customer
-- Q1) How many unique customer types does the data have?

select distinct `customer type` from saleswalmart.`walmartsalesdata.csv` ;

-- Q2) How many unique payment methods does the data have?

select distinct payment from saleswalmart.`walmartsalesdata.csv` ;

-- Q3) What is the most common customer type?

select  `customer type` , count(`customer type`) from saleswalmart.`walmartsalesdata.csv` 
group by `customer type`;

-- Q4) Which customer type buys the most?

select  `customer type` , sum(quantity) from saleswalmart.`walmartsalesdata.csv` 
group by `customer type`;

-- Q5) What is the gender of most of the customers?

SELECT `customer type`, gender, COUNT(gender) AS gender_count 
FROM saleswalmart.`walmartsalesdata.csv` 
GROUP BY `customer type`, gender;

-- Q6) What is the gender distribution per branch?

SELECT branch, gender, COUNT(gender) AS gender_count
FROM saleswalmart.`walmartsalesdata.csv` 
GROUP BY branch, gender
order by branch, gender_count;

-- Q7) Which time of the day do customers give most ratings?

SELECT time_of_day, COUNT(rating) 
FROM saleswalmart.`walmartsalesdata.csv` 
GROUP BY time_of_day;

-- Q8) Which time of the day do customers give most ratings per branch?

SELECT branch, time_of_day, COUNT(rating) as total_ratings 
FROM saleswalmart.`walmartsalesdata.csv` 
GROUP BY branch, time_of_day
ORDER BY branch, total_ratings DESC;

-- Q9) Which day fo the week has the best avg ratings?

SELECT  dayofweek(date) as day_of_week, avg(rating) as avg_ratings 
FROM saleswalmart.`walmartsalesdata.csv` 
GROUP BY day_of_week
ORDER BY  avg_ratings DESC;


-- Q10) Which day of the week has the best average ratings per branch?

SELECT  branch , dayofweek(date) as day_of_week, avg(rating) as avg_ratings 
FROM saleswalmart.`walmartsalesdata.csv` 
GROUP BY branch, day_of_week
ORDER BY  branch, avg_ratings DESC;

---------------------------------------------------------------------------

