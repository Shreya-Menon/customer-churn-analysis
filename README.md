## Project Title

Customer Churn Analysis – End-to-End Data Analytics Project

## Aim of the Project

The aim of this project is to analyze customer churn behavior and identify the key factors that influence customers to leave the business. The project demonstrates the complete analytics lifecycle — from raw data handling to business-driven insights and decision-making.

## Objectives

1. Understand customer demographics, services, and financial behavior
2. Clean and preprocess raw customer data for analysis
3. Identify key churn drivers using Exploratory Data Analysis (EDA)
4. Validate insights using SQL-based business analysis
5. Visualize churn patterns and revenue impact using Power BI
6. Provide actionable business recommendations to reduce churn

## Dataset Description

- The dataset contains customer-level information including:
- Demographics: Age, Gender, Marital Status, Dependents
- Geographical Data: Population (location fields removed during preprocessing)
- Service Details: Internet type, streaming services, security, support, contracts
- Financial Metrics: Monthly charges, total revenue, refunds, CLTV
- Customer Engagement: Tenure, referrals, satisfaction score
- Churn Information: Churn label, churn category, churn reason
- Each row represents a single customer, and the target variable is Churn Label.

## Tools and Technologies Used

- Python (Jupyter Notebook): Data cleaning, preprocessing, and EDA
- PostgreSQL (pgAdmin): SQL-based business analysis
- Power BI Desktop: Interactive dashboards and visual storytelling
- Git & GitHub: Version control and project hosting

## Project Workflow

1. Raw data ingestion and understanding
2. Data cleaning and preprocessing using Python
3. Exploratory Data Analysis (EDA) to identify churn patterns
4. SQL-based validation of key insights
5. Power BI dashboard creation for executive storytelling
6. Business recommendations and future enhancement planning

## Data Cleaning and Preprocessing

1. Removed identifier and high-cardinality location columns
2. Handled missing values using median (numerical) and mode/“Unknown” (categorical)
3. Converted churn labels into binary format
4. Created tenure groups to analyze churn across customer lifecycle stages
5. Engineered revenue-based metrics for deeper business insights

## Exploratory Data Analysis (EDA) Using Python

EDA was performed to understand relationships between churn and:

- Customer tenure
- Contract type
- Monthly charges
- Satisfaction score
- Service add-ons (security, support, streaming)
- Revenue and CLTV
- Multiple visualizations such as bar charts, box plots, histograms, and heatmaps were used to identify trends and patterns.

## Key Insights from Python Analysis

1. Customers with short tenure are more likely to churn
2. Month-to-month contracts show the highest churn rate
3. Higher monthly charges increase churn risk
4. Customers without premium support or security services churn more
5. Low satisfaction scores strongly correlate with churn
6. Churn leads to reduced Customer Lifetime Value (CLTV)

## SQL-Based Business Analysis

PostgreSQL was used to:
1. Calculate churn rates across customer segments
2. Analyze churn by contract type, tenure, and payment method
3. Measure revenue and CLTV impact due to churn
4. Identify high-value customers who are at churn risk
5. Prepare SQL views for Power BI reporting

## Key Insights from SQL Analysis

1. Month-to-month customers churn significantly more than long-term contract users
2. Early-stage customers contribute most to churn volume
3. Low satisfaction scores consistently predict churn
4. Churn results in substantial lifetime revenue loss
5. Premium services reduce churn probability
6. High-CLTV customers are also at risk and need proactive retention

## Power BI Dashboard Development

Page 1: Executive Overview- Overall churn rate and customer count, Revenue and average CLTV, Churn distribution and contract-wise churn
<img width="1272" height="711" alt="image" src="https://github.com/user-attachments/assets/090bea36-fee0-46f8-9c4f-cafeb80c81b1" />

Page 2: Churn Drivers Analysis- Impact of satisfaction score, monthly charges, and tenure, Service-based churn comparison, Contract vs satisfaction heatmap
<img width="1276" height="712" alt="image" src="https://github.com/user-attachments/assets/f1aa1379-814a-4e10-b1aa-dbf08669dd8b" />

Page 3: Revenue Impact & Retention Strategy- Revenue loss due to churn, CLTV vs monthly charges, Identification of high-risk, high-value customers
<img width="1157" height="710" alt="image" src="https://github.com/user-attachments/assets/e5bd279a-15d8-434d-b4f1-9f324e5c8fee" />

## Key Insights from Power BI Dashboard

- Early-tenure and month-to-month customers are the most vulnerable
- Low satisfaction amplifies churn across all contract types
- Revenue loss is driven by churn among medium and high-value customers
- Bundled services and long-term contracts improve retention

## Business Recommendations

- Improve onboarding experience for early-tenure customers
- Incentivize month-to-month customers to shift to long-term contracts
- Bundle premium support and security services
- Monitor satisfaction scores and trigger early retention campaigns
- Prioritize high-CLTV customers with proactive engagement strategies

## Conclusion

This project demonstrates an end-to-end customer churn analysis using Python, SQL, and Power BI. By combining technical analysis with business thinking, the project provides actionable insights that can help organizations reduce churn, improve customer retention, and maximize revenue.

## Future Enhancements

- Build a predictive churn model using machine learning
- Automate data refresh and dashboard updates
- Perform cohort-based churn analysis
- Integrate real-time customer feedback data
- Deploy dashboards to Power BI Service for stakeholders
