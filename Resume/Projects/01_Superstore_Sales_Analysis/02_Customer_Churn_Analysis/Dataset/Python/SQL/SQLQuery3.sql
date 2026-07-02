CREATE DATABASE CustomerChurnDB;
GO

USE CustomerChurnDB;
GO

SELECT TOP 10 *
FROM cleaned_customer_churn;


SELECT COUNT(*) AS Total_Customers
FROM cleaned_customer_churn;


--Churn Rate

SELECT
    Churn,
    COUNT(*) AS Customers,
    ROUND(
        COUNT(*) * 100.0 /
        (SELECT COUNT(*) FROM cleaned_customer_churn),
        2
    ) AS Percentage
FROM cleaned_customer_churn
GROUP BY Churn;

--Churn by Contract Type

SELECT
    Contract,
    Churn,
    COUNT(*) AS Customers
FROM cleaned_customer_churn
GROUP BY Contract, Churn
ORDER BY Contract;

--Average Monthly Charges

SELECT
    Churn,
    AVG(MonthlyCharges) AS Avg_Monthly_Charges
FROM cleaned_customer_churn
GROUP BY Churn;

--Average Tenure

SELECT
    Churn,
    AVG(tenure) AS Avg_Tenure
FROM cleaned_customer_churn
GROUP BY Churn;

--Internet Service Analysis
SELECT
    InternetService,
    Churn,
    COUNT(*) AS Customers
FROM cleaned_customer_churn
GROUP BY InternetService, Churn
ORDER BY InternetService;


--Payment Method Analysis

SELECT
    PaymentMethod,
    Churn,
    COUNT(*) AS Customers
FROM cleaned_customer_churn
GROUP BY PaymentMethod, Churn
ORDER BY PaymentMethod;

--High-Risk Customer Segment

SELECT
    Contract,
    InternetService,
    PaymentMethod,
    COUNT(*) AS Customers
FROM dbo.cleaned_customer_churn
WHERE Churn = 1
GROUP BY
    Contract,
    InternetService,
    PaymentMethod
ORDER BY Customers DESC;