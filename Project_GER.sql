-- Top 5 Product Categories by Total Profit Across the Globe
WITH CategoryProfit AS (
    SELECT
        s.Order_Number,
        s.Quantity,
        s.ProductKey,
        p.Category,
        p.Subcategory,
        p.`Unit Cost USD`,
        p.`Unit Price USD`,
        s.Quantity * p.`Unit Price USD` AS TotalSalesUSD,
        s.Quantity * p.`Unit Cost USD`  AS TotalCostUSD,
        s.Quantity * p.`Unit Price USD` - s.Quantity * p.`Unit Cost USD` AS TotalProfitUSD
    FROM Project_GER.sales    AS s
    JOIN Project_GER.products AS p
        ON s.ProductKey = p.ProductKey
)
SELECT
    Category,
    SUM(TotalProfitUSD) AS TotalProfitUSD
FROM CategoryProfit
GROUP BY Category
ORDER BY TotalProfitUSD DESC
LIMIT 5;

-- Top 5 Countries by Total Revenue Across the Globe
WITH Countrysales AS (
    SELECT 
        s.Order_Number, 
        s.Quantity, 
        s.ProductKey, 
        p.Category, 
        p.Subcategory, 
        p.`Unit Cost USD`, 
        p.`Unit Price USD`, 
        s.Storekey, 
        s.Quantity * p.`Unit Price USD`  AS TotalSalesUSD 
    FROM Project_GER.sales AS s 
    JOIN Project_GER.products AS p ON s.ProductKey = p.ProductKey 
    JOIN Project_GER.stores AS st ON s.Storekey = st.Storekey
)
SELECT 
    st.Country, 
    SUM(cs.TotalSalesUSD) AS TotalSalesUSD 
FROM Countrysales AS cs 
JOIN Project_GER.stores AS st ON cs.Storekey = st.Storekey 
GROUP BY st.Country 
ORDER BY TotalSalesUSD DESC 
LIMIT 5;

-- Segmenting data in Low Ticket and High Ticket sales based on Unit Price and understanding the distribution across Gender
WITH AvgPrice AS (
    SELECT AVG(s2.Quantity * p2.`Unit Price USD`) AS AvgTicketPrice
    FROM Project_GER.sales AS s2 
    JOIN Project_GER.products AS p2 ON s2.ProductKey = p2.ProductKey
),
t AS (
    SELECT 
        c.Gender, 
        CASE 
            WHEN s.Quantity * p.`Unit Price USD` < (SELECT AvgTicketPrice FROM AvgPrice) THEN 'Low Ticket'
            ELSE 'High Ticket' 
        END AS SalesTicketCategory 
    FROM Project_GER.sales AS s 
    JOIN Project_GER.products AS p ON s.ProductKey = p.ProductKey 
    JOIN Project_GER.customers AS c ON s.CustomerKey = c.CustomerKey
)
SELECT 
    Gender, 
    SalesTicketCategory, 
    COUNT(*) AS TicketCount, 
    ROUND(100.0 * COUNT(*) / SUM(COUNT(*)) OVER (PARTITION BY SalesTicketCategory), 2) AS PercentageShare 
FROM t 
GROUP BY Gender, SalesTicketCategory 
ORDER BY SalesTicketCategory, Gender;

-- Time Series Analysis for Quarterly and Yearly Sales Trend Over the Years
WITH QuarterlySales AS (
    SELECT 
        YEAR(s.`Order Date`) AS SalesYear, 
        QUARTER(s.`Order Date`) AS SalesQuarter, 
        SUM(s.Quantity * p.`Unit Price USD`) AS TotalQuarterlySalesUSD 
    FROM Project_GER.sales AS s 
    JOIN Project_GER.products AS p ON s.ProductKey = p.ProductKey 
    GROUP BY YEAR(s.`Order Date`), QUARTER(s.`Order Date`)
)
SELECT 
    SalesYear, 
    SalesQuarter, 
    TotalQuarterlySalesUSD, 
    SUM(TotalQuarterlySalesUSD) OVER (PARTITION BY SalesYear) AS TotalYearlySalesUSD, 
    ROUND(
        100.0 * (TotalQuarterlySalesUSD - LAG(TotalQuarterlySalesUSD) OVER (ORDER BY SalesYear, SalesQuarter)) / 
        NULLIF(LAG(TotalQuarterlySalesUSD) OVER (ORDER BY SalesYear, SalesQuarter), 0), 2
    ) AS QoQGrowthPct, 
    ROUND(
        100.0 * (TotalQuarterlySalesUSD - LAG(TotalQuarterlySalesUSD, 4) OVER (ORDER BY SalesYear, SalesQuarter)) / 
        NULLIF(LAG(TotalQuarterlySalesUSD, 4) OVER (ORDER BY SalesYear, SalesQuarter), 0), 2
    ) AS YoYGrowthPct 
FROM QuarterlySales 
ORDER BY SalesYear, SalesQuarter;

-- Average Order Value AOV Group By Top 10 Products
WITH t AS (
    SELECT 
        s.Order_Number, 
        p.`Product Name`, 
        p.Category, 
        p.Subcategory, 
        s.Quantity * p.`Unit Price USD` AS TotalSalesUSD 
    FROM Project_GER.sales AS s 
    JOIN Project_GER.products AS p ON s.ProductKey = p.ProductKey
)
SELECT 
    `Product Name`, 
    Category, 
    Subcategory, 
    AVG(TotalSalesUSD) AS AverageOrderValueUSD 
FROM t 
GROUP BY `Product Name`, Category, Subcategory 
ORDER BY AverageOrderValueUSD DESC 
LIMIT 10;

-- Customer Retention Analysis Repeat Purchase Rate by Country
WITH CustomerRetention AS (
    SELECT 
        s.CustomerKey, 
        s.Order_Number, 
        s.StoreKey, 
        st.Country 
    FROM Project_GER.sales AS s 
    JOIN Project_GER.stores AS st ON s.StoreKey = st.StoreKey
)
SELECT 
    cr.Country, 
    COUNT(DISTINCT cr.CustomerKey) AS TotalCustomers, 
    COUNT(DISTINCT cr.Order_Number) AS TotalOrders, 
    ROUND(
        COUNT(DISTINCT cr.CustomerKey) * 100.0 / COUNT(DISTINCT cr.Order_Number), 2
    ) AS RepeatPurchaseRatePct 
FROM CustomerRetention AS cr 
GROUP BY cr.Country 
ORDER BY RepeatPurchaseRatePct DESC;

-- Sales per Square Metre across different countries
WITH SalesArea AS (
    SELECT 
        s.Order_Number, 
        s.Quantity, 
        s.StoreKey, 
        p.`Unit Price USD`, 
        st.Country, 
        st.`Square Meters`, 
        s.Quantity * p.`Unit Price USD` AS TotalSalesUSD 
    FROM Project_GER.sales AS s 
    JOIN Project_GER.products AS p ON s.ProductKey = p.ProductKey 
    JOIN Project_GER.stores AS st ON s.StoreKey = st.StoreKey
)
SELECT 
    sa.Country, 
    ROUND(SUM(sa.TotalSalesUSD) / SUM(sa.`Square Meters`), 2) AS SalesperSqmUSD 
FROM SalesArea AS sa 
GROUP BY sa.Country 
ORDER BY SalesperSqmUSD DESC;

-- Identifying Top 10 Customers by Total Spending and Their Contribution to Overall Sales
WITH CustomerSpending AS (
    SELECT 
        s.CustomerKey, 
        c.Name, 
        SUM(s.Quantity * p.`Unit Price USD`) AS TotalSpendingUSD 
    FROM Project_GER.sales AS s 
    JOIN Project_GER.products AS p ON s.ProductKey = p.ProductKey 
    JOIN Project_GER.customers AS c ON s.CustomerKey = c.CustomerKey 
    GROUP BY s.CustomerKey, c.Name
),
Ranked AS (
    SELECT 
        CustomerKey, 
        Name, 
        TotalSpendingUSD, 
        RANK() OVER (ORDER BY TotalSpendingUSD DESC) AS SpendingRank, 
        SUM(TotalSpendingUSD) OVER() AS OverallSales 
    FROM CustomerSpending
),
Top50 AS (
    SELECT 
        SpendingRank, 
        CustomerKey, 
        Name, 
        TotalSpendingUSD, 
        OverallSales,
        SUM(TotalSpendingUSD) OVER (
            ORDER BY TotalSpendingUSD DESC 
            ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
        ) AS CumulativeTop50Sales 
    FROM Ranked 
    WHERE SpendingRank <= 50
)
SELECT 
    SpendingRank, 
    CustomerKey, 
    Name, 
    TotalSpendingUSD, 
    CumulativeTop50Sales, 
    ROUND(CumulativeTop50Sales * 100.0 / OverallSales, 2) AS CumulativeSalesPercentage 
FROM Top50 
ORDER BY SpendingRank;

-- Total Number of Customers
SELECT COUNT(DISTINCT CustomerKey) AS TotalCustomers 
FROM Project_GER.customers;

