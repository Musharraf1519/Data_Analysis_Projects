use customer_segmentation;
CREATE TABLE customers (
customer_id INT PRIMARY KEY,
age INT,
gender VARCHAR(10),
marital_status VARCHAR(20),
education_level VARCHAR(50),
geographic_info VARCHAR(100),
occupation VARCHAR(50),
income_level INT,
preffered_channel VARCHAR(50),
preffered_contact_time VARCHAR(50),
preffered_language VARCHAR(20),
customer_preferences VARCHAR(100),
segmentation_group VARCHAR(20)
);
CREATE TABLE transactions (
    transaction_id INT AUTO_INCREMENT PRIMARY KEY, -- Use AUTO_INCREMENT for MySQL
    customer_id INT,
    transaction_date DATE,
    coverage_amount INT,
    premium_amount INT,
    policy_type VARCHAR(50),
    insurance_products_owned VARCHAR(100),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);


SELECT * FROM customers;
SELECT * FROM transactions;

-- =====================================
-- CUSTOMER SEGMENTATION PROJECT (MySQL)
-- =====================================

-- SECTION 1: Total Spend Query
-- So we know who the high-value customers are. Power BI will later visualize the top spenders.
SELECT 
    c.customer_id,
    SUM(t.premium_amount) AS total_coverage
FROM 
    customers c
JOIN 
    transactions t ON c.customer_id = t.customer_id
GROUP BY 
    c.customer_id
ORDER BY 
    total_coverage DESC;

-- SECTION 2: RFM Scoring Query
-- What is RFM Scoring?
-- RFM stands for:
-- Recency (R): How recently a customer made a purchase (the more recent, the more engaged).
-- Frequency (F): How often they make purchases (loyalty).
-- Monetary (M): How much they spend (customer value).
-- The idea is to score each customer based on these factors, allowing you to group them into segments like:
-- Champions (recent, frequent, high spend)
-- Loyalists (frequent, but less recent or lower spend)
-- At-risk (infrequent or inactive, but with high spend in the past)
-- New customers, etc. 
 
WITH rfm_base AS (
	SELECT 
		t.customer_id, 
        DATEDIFF(NOW(),MAX(t.transaction_date)) AS recency, 
		COUNT(t.transaction_id) AS frequency, 
		SUM(t.premium_amount) AS monetary
	FROM 
		transactions t
	GROUP BY 
		t.customer_id
)

SELECT 
    customer_id,
    NTILE(4) OVER (ORDER BY recency DESC) AS r_score,  -- lower recency gets better score
    NTILE(4) OVER (ORDER BY frequency DESC) AS f_score, -- Higher frequency gets better score
    NTILE(4) OVER (ORDER BY monetary DESC) AS m_score  -- Higher monetary gets better score
FROM rfm_base;

-- SECTION 3: CLV Query

-- ✅ What is CLV?
-- Customer Lifetime Value is the total revenue a customer brings during their relationship with the business.
-- In your insurance dataset, we’ll calculate CLV as:
-- The total premium paid by a customer
-- Optionally, average premium per month to see consistency

SELECT 
t.customer_id,
COUNT(t.transaction_id) AS total_transactions,
SUM(t.premium_amount) AS total_lifetime_value,
COUNT(DISTINCT DATE_FORMAT(t.transaction_date, '%Y-%m')) AS active_months,
ROUND(SUM(t.premium_amount)/NULLIF(COUNT(DISTINCT DATE_FORMAT(t.transaction_date, '%Y-%m')),0),2) AS avg_monthly_value
FROM
transactions t
GROUP BY t.customer_id;

-- SECTION 4: Create Views (for Power BI)
-- Why this is better:
-- ✅ Cleaner: You define logic in SQL once and just import results.
-- ✅ Faster: Power BI only queries simple SELECT * from views.
-- ✅ Reusable: The same views can be used by other tools (e.g., Tableau, Excel).
-- ✅ Easier to manage: Less SQL writing in Power BI, fewer errors.

CREATE OR REPLACE VIEW total_customer_spend AS
SELECT 
    c.customer_id,
    SUM(t.premium_amount) AS total_spent
FROM 
    customers c
JOIN 
    transactions t ON c.customer_id = t.customer_id
GROUP BY 
    c.customer_id;
    

CREATE OR REPLACE VIEW rfm_scores AS
WITH rfm_base AS (
	SELECT 
		t.customer_id, 
		DATEDIFF(NOW(), MAX(t.transaction_date)) AS recency, 
		COUNT(t.transaction_id) AS frequency, 
		SUM(t.premium_amount) AS monetary
	FROM transactions t
	GROUP BY t.customer_id
)
SELECT 
    customer_id,
    NTILE(4) OVER (ORDER BY recency DESC) AS r_score,
    NTILE(4) OVER (ORDER BY frequency DESC) AS f_score,
    NTILE(4) OVER (ORDER BY monetary DESC) AS m_score
FROM rfm_base;

CREATE OR REPLACE VIEW customer_lifetime_value AS
SELECT 
    t.customer_id,
    COUNT(t.transaction_id) AS total_transactions,
    SUM(t.premium_amount) AS total_lifetime_value,
    COUNT(DISTINCT DATE_FORMAT(t.transaction_date, '%Y-%m')) AS active_months,
    ROUND(SUM(t.premium_amount) / NULLIF(COUNT(DISTINCT DATE_FORMAT(t.transaction_date, '%Y-%m')), 0), 2) AS avg_monthly_value
FROM 
    transactions t
GROUP BY 
    t.customer_id;







