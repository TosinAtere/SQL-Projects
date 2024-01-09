
--1. TOTAL SALES

SELECT SUM(Actual_Price) as TotalSales
FROM Assignment.dbo.Mocksales

--2. SALES BY COUNTRY

   --Highest Sales

SELECT TOP 1 Country, Actual_Price
FROM Assignment.dbo.Mocksales
ORDER BY 2 DESC

   --Lowest Sales

SELECT TOP 1 Country, Actual_Price
FROM Assignment.dbo.Mocksales
ORDER BY 2 ASC

--3. TOTAL SALES BY REGION

SELECT Region, sum(Actual_Price) as TotalSalesRegion
FROM Assignment.dbo.Mocksales
GROUP BY Region

--4. AVERAGE DISCOUNT

SELECT AVG(Discount) AS Average_Percentage_Discount
FROM Assignment.dbo.Mocksales2

--5. BEST SELLING ITEMS

SELECT Item, count(Item) as CountItem
FROM Assignment.dbo.Mocksales
GROUP BY Item
ORDER BY 2 DESC

SELECT TOP 1 Item, count(Item) as CountItem
FROM Assignment.dbo.Mocksales
GROUP BY Item
ORDER BY 2 DESC

--6. SALES BY STORES

SELECT Store, COUNT(Item) as CountItem, SUM(Actual_Price) as SumActualPrice
FROM Assignment.dbo.Mocksales
GROUP BY Store
ORDER BY Store

SELECT Store, Item, COUNT(Item) as CountItem, SUM(Actual_Price) as SumActualPrice
FROM Assignment.dbo.Mocksales
GROUP BY Store, Item
ORDER BY Store

--7. SALES OVER TIME

SELECT YEAR(Date) as YearDate, Count(Item) as CountItem, SUM(Actual_Price) as SumActualPrice
FROM Assignment.dbo.Mocksales
GROUP BY YEAR(Date)
ORDER BY YEAR(date)

SELECT YEAR(Date) as YearDate, Item, Actual_Price
FROM Assignment.dbo.Mocksales
ORDER BY YEAR(Date);

--8. MOST PROFITABLE ITEM

SELECT TOP 1 Item, SUM(Actual_Price) as SumActualPrice
FROM Assignment.dbo.Mocksales
GROUP BY Item
ORDER BY 2 DESC;

--9. PRICE vs DISCOUNT ?????

SELECT List_Price, Discount
FROM Assignment.dbo.Mocksales
ORDER BY 1, 2

--10. DISCOUNT IMPACT ????????

SELECT Item, Discount, Actual_Price
FROM Assignment.dbo.Mocksales2
ORDER BY 2,3

--11. SALES TRENDS BY COUNTRY

SELECT Country, YEAR(Date) as YearDate, COUNT(Item) as CountItem, SUM(Actual_Price) as Total_Actual_Price
FROM Assignment.dbo.Mocksales
GROUP BY Country, YEAR(Date)
ORDER BY 1

--12. DISCOUNT BY ITEMS: HIGHEST AND LOWEST DISCOUNT

    --LOWEST

SELECT TOP 1 Item, AVG (Discount) as Lowest_Average_Discount
FROM Assignment.dbo.Mocksales2
GROUP BY Item
ORDER BY 2 ASC

SELECT MIN(AverageDiscount) AS Lowest_Average_Discount
FROM (SELECT Item, AVG(Discount) AS AverageDiscount FROM Assignment.dbo.Mocksales2 GROUP BY Item) SUB

    --HIGHEST

SELECT TOP 1 Item, AVG (Discount) as Highest_Average_Discount
FROM Assignment.dbo.Mocksales2
GROUP BY Item
ORDER BY 2 DESC

SELECT MAX(AverageDiscount) AS Highest_Average_Discount
FROM (SELECT Item, AVG(Discount) AS AverageDiscount FROM Assignment.dbo.Mocksales2 GROUP BY Item) SUB

--13. SALES BY MONTH

    --Highest Sales

SELECT TOP 1 MONTH(Date) as Month, SUM(Actual_Price) as TotalActualPrice
FROM Assignment.dbo.Mocksales
GROUP BY MONTH(Date)
ORDER BY 2 DESC

    --Lowest Sales

SELECT TOP 1 MONTH(Date) as Month, SUM(Actual_Price) as TotalActualPrice
FROM Assignment.dbo.Mocksales
GROUP BY MONTH(Date)
ORDER BY 2 ASC

--14. STORE PERFORMANCE

SELECT TOP 1 Store, TotalSales
FROM (SELECT Store, SUM(Actual_Price) AS TotalSales FROM Assignment.dbo.Mocksales GROUP BY Store) SUB
ORDER BY 2 DESC

--15. TOP SALES DAYS

SELECT TOP 10 Date, Item, Actual_Price
FROM Assignment.dbo.Mocksales
ORDER BY Actual_Price DESC, Date

SELECT TOP 10 Date, SUM(Actual_Price) as TotalSales
FROM Assignment.dbo.Mocksales
GROUP BY Date
ORDER BY 2 DESC

--16. SALESPERSON PERFORMANCE

--Highest Total Amount Sold

SELECT TOP 1 Salesperson, SUM(Actual_Price) as TotalSales
FROM Assignment.dbo.Mocksales
GROUP BY Salesperson
ORDER BY TotalSales DESC

--Highest Number of Items Sold

SELECT TOP 1 Salesperson, Count(Item) as Count_Item_Sold
FROM Assignment.dbo.Mocksales
GROUP BY Salesperson
ORDER BY Count_Item_Sold DESC

--17. SALES BY ITEM CATEGORY ????????

SELECT Item
FROM Assignment.dbo.Mocksales
GROUP BY Item
ORDER BY Item

--18. PROFITABLE REGIONS

SELECT TOP 3 Region, SUM(Actual_Price) as TotalSales
FROM Assignment.dbo.Mocksales
GROUP BY Region
ORDER BY 2 DESC

--19. ITEM POPULARITY

SELECT TOP 5 Item, COUNT(Item) as CountItem
FROM Assignment.dbo.Mocksales
GROUP BY Item
ORDER BY CountItem DESC

--20. AVERAGE SALES PRICE

SELECT Item, AVG(Actual_Price) as Average_Sales_Price
FROM Assignment.dbo.Mocksales
GROUP BY Item
ORDER BY Average_Sales_Price DESC

--21. SALESPERSON EFFICIENCY

SELECT TOP 3 Salesperson, SUM(Actual_Price) as Total_Actual_Price, AVG(Discount) as AverageDiscount
FROM Assignment.dbo.Mocksales2
GROUP BY Salesperson
ORDER BY Total_Actual_Price DESC, AverageDiscount ASC

--22. COUNTRY PERFORMANCE ?????????????????

SELECT Country, MAX(YEAR(Date)
FROM (
SELECT Country, YEAR(Date) as YearDate, SUM(Actual_Price) as TotalSales
FROM Assignment.dbo.Mocksales
GROUP BY Country, YEAR(Date)) SUB
ORDER BY Country, YearDate ASC


SELECT Country, YEAR(Date) as YearDate, SUM(Actual_Price) as TotalSales
FROM Assignment.dbo.Mocksales
WHERE YEAR(Date) = 2014 AND YEAR(Date) = 2016 
GROUP BY Country, YEAR(Date)
ORDER BY Country, YearDate ASC


