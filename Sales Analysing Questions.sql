use sales
Select * From SalesAnalysis;


/* Data Analysing   */ 

/* Find the number of orders, customers, cities, and states */

SELECT Count(distinct(Order_ID)) AS TotalOrder_ID,
Count(Distinct(Ship_Date)) AS TotalOrder_Ship_Date,
Count(Distinct(State)) AS Total_States,
Count(Distinct(City)) AS Total_Cities
FROM
SalesAnalysis;

/* Find the top 10 profitable states & cities */

SELECT State, City, 
count(distinct(Ship_Date)) AS Total_Shipdate, 
count(profit) AS Total_Profit,
count(Quantity) AS Products_Sold
FROM SalesAnalysis
GROUP BY State, City
ORDER BY Total_Profit DESC
Limit 10;

/* Check the monthly profitability and monthly quantity sold to see if there are patterns in the dataset */

select concat(Ship_Date(Order_Date),"-",Year(Order_Date)) AS Month_Year, 
SUM(Profit) AS TotalProfit, 
SUM(Quantity) AS TotalQuantitySold
FROM SalesAnalysis
group by Ship_Date;

/*   Calculating Percentage of Total Sales by Category   */

SELECT Category,
SUM(sales) AS Total_Sales, 
round((SUM(sales) * 100.0 / (SELECT SUM(sales) FROM SalesAnalysis)), 2) AS Percent_Total_Sales
FROM SalesAnalysis
GROUP BY Category
order by Percent_Total_Sales DESC;


/* Calculating the Percentage of Total Sales by Category and SubCategory and also calculating subtotals */

SELECT Category, Sub_Category,
SUM(Sales) AS Total_Sales, 
round((SUM(Sales) * 100.0 / (SELECT SUM(Sales) FROM SalesAnalysis)), 2) AS Percent_Total_Sales
FROM SalesAnalysis
GROUP BY Category, Sub_Category
WITH rollup
order by Category; 

select Customer_ID, count(distinct(Order_ID)) AS No_of_Orders
FROM
SalesAnalysis
group by 
order by No_of_Orders DESC;
Limit 5;


/* Top 5 Cities with the most no. of orders   */

select City, count(distinct(Order_ID)) AS No_of_Orders
FROM
SalesAnalysis
group by City
order by No_of_Orders DESC
Limit 5;


/* Find the total revenue for each day of the week  */

select Order_ID(Order_date) AS Day, sum(Sales) AS Revenue
from SalesAnalysis
group by Ship_Date
order by 
CASE Day
WHEN 'Sunday' THEN 1
WHEN 'Monday' THEN 2
WHEN 'TUESDAY' THEN 3
WHEN 'WEDNESDAY' THEN 4
WHEN 'THURSDAY' THEN 5
WHEN 'FRIDAY' THEN 6
WHEN 'SATURDAY' THEN 7
END;

/* Total profit by each month  */

SELECT Order_Date AS Month_Name,
sum(Profit) AS Total_Profit,
from SalesAnalysis
group by Ship_Date
having Total_Profit > 0
order by Total_Profit DESC;









