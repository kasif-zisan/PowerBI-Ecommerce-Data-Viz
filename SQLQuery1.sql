/*
ALTER TABLE dbo.['Ecommerce_Data-1$']
ADD Month INT

UPDATE dbo.['Ecommerce_Data-1$']
SET Month = MONTH(Date)

select * from dbo.['Ecommerce_Data-1$']*/

with data as 
(select Description, Quantity, UnitPrice, CustomerID, Country, Date, Hour, Month from dbo.['Ecommerce_Data-1$'])
select sum(Quantity*UnitPrice)  from data


/*Question 1 - Which country had the most customers?
select count(CustomerID), Country from data group by Country order by count(CustomerID) desc
*/

/*Question 2 - Which country generated the most revenue?
select sum(UnitPrice*Quantity) as "Total Revenue", Country from data group by Country order by "Total Revenue" desc
*/

/*Question 3 - Which product sold the most?
select Description, sum(Quantity) "Total number sold" from data group by Description order by "Total number sold" desc
*/

/*Question 4 - Which product generated the most revenue?
select description, sum(Quantity*UnitPrice) as "Revenue" from data group by Description order by Revenue desc
*/

/*Question 5 - Which month had the highest sales?
select count(Description) "Number of Products Sold", Month from data group by Month order by "Number of Products Sold" desc
*/

/* Question 6 - Which products were sold most in a certain month?
WITH CTE AS (
    SELECT Description, SUM(Quantity) AS TotalSold, Month	
    FROM dbo.['Ecommerce_Data-1$']
    GROUP BY Month, Description
)
SELECT Description, TotalSold, Month
FROM (
    SELECT Description, TotalSold, Month,
           ROW_NUMBER() OVER (PARTITION BY Month ORDER BY TotalSold DESC) AS rn
    FROM CTE
) AS T
WHERE rn = 1
ORDER BY Month ASC*/



