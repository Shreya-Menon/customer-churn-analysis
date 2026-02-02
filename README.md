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

## Hypothesis Testing

Hypothesis testing was performed to validate whether observed patterns in the data were statistically significant and not due to random chance.
| Hypothesis | Test Used      | p-value   | Effect Size | Decision  |
| ---------- | -------------- | --------- | ----------- | --------- |
| H1         | t-test         | 0.0001    | -0.45       | Reject H₀ |
| H2         | t-test         | 8.59e-73  | -2.60       | Reject H₀ |
| H3         | t-test         | 0.0003    | 0.44        | Reject H₀ |
| H4         | Mann–Whitney U | 3.38e-210 | —           | Reject H₀ |
| H5         | t-test         | 0.02      | 0.16        | Reject H₀ |

- Parametric tests : when normality assumptions were met
- Non-parametric tests : when distributions were skewed

## Statistical vs Practical Significance
While several hypotheses showed extremely low p-values, effect sizes were also analyzed to distinguish between statistical significance and real-world business impact.

## Business Interpretation of Hypothesis Testing

The hypothesis tests were conducted to validate whether observed churn patterns were statistically significant and meaningful from a business perspective. Along with p-values, effect sizes were analyzed to measure the practical impact of each factor on customer churn.

Hypothesis 1 – Moderate Negative Effect (Effect Size ~ -0.45)
- Indicates a moderate practical difference between the compared customer groups.
- This factor has a noticeable influence on churn, though it is not the strongest driver.
Business Interpretation:
Improving this factor can lead to measurable churn reduction but should be paired with stronger drivers for maximum impact.

Hypothesis 2 – Very Large Negative Effect (Effect Size ~ -2.60)
- Represents a very strong and practically significant effect, not just statistical significance.
- One of the most influential churn drivers in the dataset.
Business Interpretation:
This factor should be a top priority for retention strategies. Customers falling into this category are at extremely high risk of churn, and targeted interventions (offers, contract changes, proactive support) can deliver high ROI

Hypothesis 3 – Moderate Positive Effect (Effect Size ~ 0.45)
- Shows a moderate and meaningful difference between customer groups.
- Confirms that the factor positively correlates with churn behavior.
Business Interpretation:
This variable can be used effectively for customer segmentation and early churn prediction, especially when combined with tenure and revenue metrics.

Hypothesis 4 – Strong Statistical Significance (Mann–Whitney U Test)
- Extremely low p-value confirms a real difference in distributions between churned and non-churned customers.
- Non-parametric test was used due to skewed data distribution.
Business Interpretation:
Even without a calculated effect size, the magnitude of statistical significance indicates this factor is highly relevant and should be monitored closely in churn prevention dashboards.

Hypothesis 5 – Small Effect (Effect Size ~ 0.16)
- Indicates a small but statistically significant effect.
- This factor alone does not strongly drive churn.
Business Interpretation:
This variable should be treated as a supporting indicator rather than a primary decision variable. It adds value when combined with stronger churn predictors but does not justify standalone business actions.

## Business Takeaway
- Not all statistically significant factors are equally valuable from a business standpoint.
- Effect size analysis helped distinguish high-impact churn drivers from minor contributors.
- Retention strategies should focus primarily on factors with large to moderate effect sizes, while small-effect variables can support predictive models and monitoring.

Detailed implementation available in notebooks/hypothesis_testing.ipynb

## A/B Testing

A/B Test was performed to test whether a retention intervention reduces churn.
- Designed a randomized control experiment to evaluate retention strategies
- Simulated control and treatment groups
- Applied two-proportion z-test to measure churn reduction
- Calculated effect size and estimated business impact
- Provided statistically backed recommendations
- Conducted power analysis to determine minimum sample size
- Estimated confidence intervals for churn reduction
- Validated statistical significance and practical impact

## How This A/B Test Would Run in Production
1️. Experiment Objective
The goal of the experiment is to evaluate whether a targeted retention intervention reduces customer churn compared to the existing approach, without negatively impacting revenue or user experience.

2️. User Eligibility & Targeting
Customers are selected based on:
- High churn risk identified through historical churn analysis
- Active customers within the last 30 days

Exclusions:
- Recently churned users
- Users already receiving promotional offers

3️. Randomization Strategy
Eligible users are randomly assigned to:
- Control group (50%): No retention intervention
- Treatment group (50%): Retention offer applied
Randomization is performed at the user level using a stable hashing mechanism to prevent cross-group contamination.
Each user remains in the same group throughout the experiment.

4️. Experiment Duration
The experiment runs for 30 days to capture:
- Natural churn behavior
- Delayed user responses to the intervention
- Duration is aligned with:
- Business churn definition
- Power analysis requirements

5️. Primary & Guardrail Metrics
- Primary Metric- Churn Rate, Percentage of users who churn during the experiment window.
- Guardrail Metrics- These are monitored to prevent unintended negative impact:Average Revenue Per User (ARPU), Customer Lifetime Value (CLV), Support ticket volume, Discount cost per retained customer

6️. Data Collection & Monitoring
User events are logged in real time:
- Offer exposure
- Subscription status
- Revenue changes
- Daily monitoring dashboards track:
- Sample size balance
- Metric stability
- Early anomalies

7️. Decision Criteria
- Statistical significance evaluated at 95% confidence level
- Practical significance evaluated using: Absolute churn reduction, Confidence interval lower bound

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

Page 2: Churn Drivers Analysis- Impact of satisfaction score, monthly charges, and tenure, Service-based churn comparison, Contract analysis
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
