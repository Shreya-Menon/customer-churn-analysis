DROP TABLE IF EXISTS customer_churn;

CREATE TABLE customer_churn (
    customer_id VARCHAR(20),
    gender VARCHAR(10),
    age INT,
    under_30 VARCHAR(5),
    senior_citizen VARCHAR(5),
    married VARCHAR(5),
    dependents VARCHAR(5),
    number_of_dependents INT,
    country VARCHAR(50),
    state VARCHAR(50),
    city VARCHAR(50),
    zip_code VARCHAR(10),
    latitude NUMERIC,
    longitude NUMERIC,
    population INT,
    quarter VARCHAR(10),
    referred_a_friend VARCHAR(5),
    number_of_referrals INT,
    tenure_in_months INT,
    offer VARCHAR(50),
    phone_service VARCHAR(5),
    avg_monthly_long_distance_charges NUMERIC,
    multiple_lines VARCHAR(10),
    internet_service VARCHAR(5),
    internet_type VARCHAR(20),
    avg_monthly_gb_download NUMERIC,
    online_security VARCHAR(5),
    online_backup VARCHAR(5),
    device_protection_plan VARCHAR(5),
    premium_tech_support VARCHAR(5),
    streaming_tv VARCHAR(5),
    streaming_movies VARCHAR(5),
    streaming_music VARCHAR(5),
    unlimited_data VARCHAR(5),
    contract VARCHAR(20),
    paperless_billing VARCHAR(5),
    payment_method VARCHAR(30),
    monthly_charge NUMERIC,
    total_charges NUMERIC,
    total_refunds NUMERIC,
    total_extra_data_charges NUMERIC,
    total_long_distance_charges NUMERIC,
    total_revenue NUMERIC,
    satisfaction_score INT,
    customer_status VARCHAR(20),
    churn_label VARCHAR(5),
    churn_score INT,
    cltv NUMERIC,
    churn_category VARCHAR(50),
    churn_reason VARCHAR(100)
);

SELECT 
    ROUND(AVG(churn_label)::numeric * 100, 2) AS churn_rate_percentage
FROM customer_churn;

SELECT 
    contract,
    COUNT(*) AS total_customers,
    SUM(churn_label) AS churned_customers,
    ROUND(AVG(churn_label)::numeric * 100, 2) AS churn_rate_percentage
FROM customer_churn
GROUP BY contract
ORDER BY churn_rate_percentage DESC;

SELECT
    CASE 
        WHEN tenure_in_months <= 12 THEN '0-1 Year'
        WHEN tenure_in_months <= 24 THEN '1-2 Years'
        WHEN tenure_in_months <= 48 THEN '2-4 Years'
        ELSE '4+ Years'
    END AS tenure_group,
    COUNT(*) AS total_customers,
    ROUND(AVG(churn_label)::numeric * 100, 2) AS churn_rate
FROM customer_churn
GROUP BY tenure_group
ORDER BY churn_rate DESC;

SELECT column_name, data_type
FROM information_schema.columns
WHERE table_name = 'customer_churn';

ALTER TABLE customer_churn
ALTER COLUMN churn_label TYPE INT
USING CASE 
    WHEN churn_label = 'Yes' THEN 1
    ELSE 0
END;

ALTER TABLE customer_churn
ALTER COLUMN monthly_charge TYPE NUMERIC USING monthly_charge::NUMERIC,
ALTER COLUMN total_revenue TYPE NUMERIC USING total_revenue::NUMERIC,
ALTER COLUMN cltv TYPE NUMERIC USING cltv::NUMERIC,
ALTER COLUMN tenure_in_months TYPE INT USING tenure_in_months::INT,
ALTER COLUMN satisfaction_score TYPE INT USING satisfaction_score::INT;

SELECT
    satisfaction_score,
    COUNT(*) AS total_customers,
    ROUND(AVG(churn_label)::numeric * 100, 2) AS churn_rate
FROM customer_churn
GROUP BY satisfaction_score
ORDER BY satisfaction_score;

SELECT
    churn_label,
    COUNT(*) AS customers,
    ROUND(AVG(total_revenue), 2) AS avg_revenue,
    ROUND(SUM(total_revenue), 2) AS total_revenue
FROM customer_churn
GROUP BY churn_label;

SELECT
    premium_tech_support,
    online_security,
    COUNT(*) AS total_customers,
    ROUND(AVG(churn_label)::numeric * 100, 2) AS churn_rate
FROM customer_churn
GROUP BY premium_tech_support, online_security
ORDER BY churn_rate DESC;

SELECT
    payment_method,
    COUNT(*) AS customers,
    ROUND(AVG(churn_label)::numeric * 100, 2) AS churn_rate
FROM customer_churn
GROUP BY payment_method
ORDER BY churn_rate DESC;

SELECT
    COUNT(*) AS high_value_churned_customers,
    ROUND(AVG(cltv), 2) AS avg_cltv
FROM customer_churn
WHERE churn_label = 1
AND cltv > (SELECT AVG(cltv) FROM customer_churn);

CREATE VIEW churn_dashboard_view AS
SELECT
    contract,
    tenure_in_months,
    monthly_charge,
    satisfaction_score,
    total_revenue,
    churn_label,
    cltv
FROM customer_churn;

