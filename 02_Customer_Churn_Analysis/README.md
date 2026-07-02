# Customer Churn Analysis and Prediction

## Project Overview

This project analyzes customer churn behavior and develops a machine learning model to predict customers who are likely to leave the company. The project combines Python, SQL Server, Power BI, and Machine Learning techniques to provide actionable business insights and recommendations.

---

## Business Problem

Customer churn significantly affects company revenue and profitability. Acquiring new customers is more expensive than retaining existing ones.

The company wants to:

- Understand why customers leave.
- Identify high-risk customers.
- Build an interactive dashboard for decision-makers.
- Predict future customer churn.

---

## Project Objectives

- Analyze customer churn patterns.
- Build an interactive Power BI dashboard.
- Identify factors affecting churn.
- Develop a predictive machine learning model.
- Provide actionable business recommendations.

---

## Tools & Technologies

- Python
- Pandas
- NumPy
- Scikit-Learn
- Google Colab
- Microsoft SQL Server
- Power BI
- DAX

---

## Project Workflow

Raw Dataset  
↓  
Data Cleaning (Python)  
↓  
SQL Analysis (SQL Server)  
↓  
Dashboard Development (Power BI)  
↓  
Business Insights  
↓  
Machine Learning Prediction  
↓  
Recommendations

---

## Dataset Information

The dataset contains:

- Customer Demographics
- Services Purchased
- Billing Information
- Contract Information
- Customer Tenure
- Customer Churn Status

---

## Data Cleaning

Performed the following tasks:

- Checked for missing values.
- Converted data types.
- Handled missing `TotalCharges` values.
- Removed duplicates.
- Performed feature engineering.
- Exported cleaned dataset.

### Python Code

```python
df['TotalCharges'] = pd.to_numeric(
    df['TotalCharges'],
    errors='coerce'
)

df['TotalCharges'].fillna(
    df['TotalCharges'].median(),
    inplace=True
)

df.to_csv(
    'cleaned_customer_churn.csv',
    index=False
)
```

---

## SQL Analysis

### Total Customers

```sql
SELECT COUNT(*) AS Total_Customers
FROM dbo.cleaned_customer_churn;
```

### Churn Rate

```sql
SELECT
    Churn,
    COUNT(*) AS Customers
FROM dbo.cleaned_customer_churn
GROUP BY Churn;
```

### Churn by Contract

```sql
SELECT
    Contract,
    Churn,
    COUNT(*) AS Customers
FROM dbo.cleaned_customer_churn
GROUP BY Contract, Churn;
```

### Churn by Internet Service

```sql
SELECT
    InternetService,
    Churn,
    COUNT(*) AS Customers
FROM dbo.cleaned_customer_churn
GROUP BY InternetService, Churn;
```

### Churn by Payment Method

```sql
SELECT
    PaymentMethod,
    Churn,
    COUNT(*) AS Customers
FROM dbo.cleaned_customer_churn
GROUP BY PaymentMethod, Churn;
```

### High-Risk Customer Segment

```sql
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
```

---

## SQL Findings

- Total Customers: 7,043
- Churned Customers: 1,869
- Churn Rate: 26.5%
- Month-to-month customers have the highest churn.
- Customers using Electronic Check have higher churn.
- Customers with shorter tenure churn more frequently.

---

## Power BI Dashboard

### KPI Cards

- Total Customers
- Churned Customers
- Churn Rate
- Average Monthly Charges
- Average Tenure

### DAX Measures

#### Total Customers

```DAX
Total Customers =
COUNTROWS('cleaned_customer_churn')
```

#### Churned Customers

```DAX
Churned Customers =
CALCULATE(
    COUNTROWS('cleaned_customer_churn'),
    'cleaned_customer_churn'[Churn] = TRUE()
)
```

#### Churn Rate

```DAX
Churn Rate =
DIVIDE(
    [Churned Customers],
    [Total Customers],
    0
)
```

#### Average Monthly Charges

```DAX
Average Monthly Charges =
AVERAGE(
    'cleaned_customer_churn'[MonthlyCharges]
)
```

#### Average Tenure

```DAX
Average Tenure =
AVERAGE(
    'cleaned_customer_churn'[tenure]
)
```

---

## Dashboard Visualizations

- Churn by Contract
- Churn by Internet Service
- Churn by Payment Method
- Churn by Gender
- Churn by Senior Citizen
- Monthly Charges Analysis

### Slicers

- Gender
- Contract
- Internet Service
- Payment Method
- Senior Citizen

---

## Dashboard Insights

- Churn Rate is approximately 26.5%.
- Month-to-month customers are the highest-risk group.
- Electronic check users churn more frequently.
- Higher monthly charges are associated with churn.
- Customers with short tenure are more likely to leave.

---

## Machine Learning Model

### Model Used

- Random Forest Classifier

### Model Workflow

1. Label Encoding
2. Train-Test Split
3. Model Training
4. Prediction
5. Evaluation

### Python Code

```python
X = df.drop('Churn', axis=1)
y = df['Churn']

X_train, X_test, y_train, y_test = train_test_split(
    X,
    y,
    test_size=0.20,
    random_state=42
)

model = RandomForestClassifier(
    n_estimators=100,
    random_state=42
)

model.fit(X_train, y_train)

y_pred = model.predict(X_test)
```

### Model Evaluation

```python
accuracy_score(y_test, y_pred)

print(classification_report(y_test, y_pred))

confusion_matrix(y_test, y_pred)
```

---

## Business Recommendations

1. Encourage customers to move to long-term contracts.
2. Improve onboarding for new customers.
3. Develop targeted retention campaigns.
4. Build an early-warning churn prediction system.

---

## Skills Demonstrated

- Python Programming
- Data Cleaning
- SQL Query Writing
- Database Management
- Power BI Dashboard Development
- DAX
- Data Visualization
- Machine Learning
- Predictive Analytics
- Business Intelligence
- Data Storytelling

---

## Project Structure

```text
02_Customer_Churn_Analysis/
│
├── Dataset/
├── Python/
├── SQL/
├── PowerBI/
├── Models/
├── Images/
├── Reports/
└── README.md
```

---

## Dashboard Preview

(Add your dashboard screenshot here.)

---

## Model Outputs

(Add screenshots of:)

- Confusion Matrix
- Classification Report
- Feature Importance Chart

---

## Author

**Atiku Abubakar**

Aspiring Data Analyst | Business Intelligence Analyst | Data Science Enthusiast
