
--Step 1: Verify the Data Loaded Correctly
SELECT * FROM Projects;

--First Business Question
--How much have we spent?


SELECT SUM(CostAmount) AS TotalSpent
FROM ActualCosts;

--Cost by Project
SELECT
    ProjectID,
    SUM(CostAmount) AS TotalCost
FROM ActualCosts
GROUP BY ProjectID;

--Add Project Names
SELECT
    p.ProjectName,
    SUM(a.CostAmount) AS TotalCost
FROM Projects p
JOIN ActualCosts a
ON p.ProjectID = a.ProjectID
GROUP BY p.ProjectName;

--Highest Cost Project

--Management asks:

--Which project spent the most money?

SELECT
    p.ProjectName,
    SUM(a.CostAmount) AS TotalCost
FROM Projects p
JOIN ActualCosts a
ON p.ProjectID = a.ProjectID
GROUP BY p.ProjectName
ORDER BY TotalCost DESC;

--Vendor Analysis
SELECT
    v.VendorName,
    SUM(a.CostAmount) AS TotalPaid
FROM Vendors v
JOIN ActualCosts a
ON v.VendorID = a.VendorID
GROUP BY v.VendorName
ORDER BY TotalPaid DESC;

--Budget vs Actual

SELECT
    p.ProjectName,
    p.Budget,
    SUM(a.CostAmount) AS ActualSpent,
    p.Budget - SUM(a.CostAmount) AS RemainingBudget
FROM Projects p
JOIN ActualCosts a
ON p.ProjectID = a.ProjectID
GROUP BY
    p.ProjectName,
    p.Budget;


--Find Projects Exceeding Budget

SELECT
    p.ProjectName,
    p.Budget,
    SUM(a.CostAmount) AS ActualSpent
FROM Projects p
JOIN ActualCosts a
ON p.ProjectID = a.ProjectID
GROUP BY
    p.ProjectName,
    p.Budget
HAVING SUM(a.CostAmount) > p.Budget;


--Monthly Spending Trend


SELECT
    MONTH(CostDate) AS MonthNumber,
    SUM(CostAmount) AS TotalSpent
FROM ActualCosts
GROUP BY MONTH(CostDate)
ORDER BY MonthNumber;









