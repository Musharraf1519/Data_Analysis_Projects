# 📦 E-commerce Product Return Rate Analysis

## 📝 Project Overview
This project analyzes historical sales and return data to uncover the key drivers behind product returns. By identifying patterns across time, products, and regions, the goal is to provide **actionable insights** that help reduce return rates, optimize operational efficiency, and improve profitability and customer satisfaction.

---

## 📊 Data Source
- **Dataset:** Online Retail Dataset (`Online_Retail.xlsx`)
- **Scope:** Transactional-level data covering sales and returns.
- **Return Identification:** Returns were captured as transactions with **negative quantities**.

---

## 🔍 Key Findings

### 📌 Overall Return Impact
- **Unit Return Rate:** ~6.63%  
- **Revenue Return Rate:** ~6.04%  
- **Total Returns:** ~11,000 units  
- **Revenue Lost Due to Returns:** ₹14.43K  

These figures show a notable loss, both operationally and financially.

---

### 📅 Temporal Trends

#### Monthly Trends
- **Volatility in Early Months:** July 2010 had an unusually high unit return rate of **126.19%**.
- **Stabilization:** From January 2011 onward, return rates normalized to a consistent **0.02%–0.04%**, suggesting early resolution of process or data issues.

#### Daily Trends
- **Thursday Spike:** Return rate on Thursdays reaches **38.60%**, significantly higher than other days.
  - *Insight:* Suggests an operational or behavioral anomaly requiring targeted investigation.

---

### 📦 Product-Specific Insights

#### High Volume Returners
- `'ROTATING SILVER ANGELS T-LIG...'`: ~9.4K units returned.
  - *Implication:* Major contributor to logistics and processing burden.

#### High Proportional Returners
- `'ROTATING SILVER ANGELS T-LIG...'`: Return rate of **19500.00%**  
- `'BLUE CHARLIE+LOLA PERSONAL...'`: **15000.00%**
  - *Insight:* Suggests severe issues like quality defects, inaccurate descriptions, or packaging failures.
  - *Note:* Such high percentages may result from **very low sales volume** skewing the ratio.

---

### 🌍 Geographic Variations
- **United Kingdom (Primary Market):** ~6.78% return rate (manageable).
- **High Return Countries:**
  - **Sweden:** 200.00%
  - **Israel:** 28.24%
  - *Insight:* Indicates country-specific challenges (e.g., shipping, customs, product-market fit).

---

## ✅ Recommendations

### 1. Prioritize Problematic Products
- Conduct deep-dive analyses into top return-driving SKUs.
- Validate:
  - Product quality
  - Description accuracy
  - Packaging durability
- Consider **temporary delisting** of critically flawed items.

### 2. Optimize Thursday Operations
- Investigate all processes and customer touchpoints on Thursdays.
- Adjust:
  - Return handling workflows
  - Customer service coverage
  - Delivery scheduling

### 3. Address Geographical Discrepancies
- Focus on countries with extreme return rates.
- Improve:
  - Local logistics
  - Customs handling
  - Regionalized product-market fit and support

### 4. Implement Continuous Monitoring
- Leverage the Power BI dashboard to track key metrics in real time.
- Proactively identify new issues and monitor the impact of changes.

---

## 🛠️ Tools & Dashboard

- **Dashboard:** `Product_Return_Analysis_Dashboard.pbix`
- **Built with:** Power BI Desktop  
  - **Power Query:** Data cleaning & shaping  
  - **DAX:** KPIs & return rate calculations  
  - **Visualizations:** Return trends, anomalies, and insights

---

## 📈 Outcome
This project provides a strategic data-driven approach to reduce return-related losses and improve customer experience, while enabling continuous improvement through real-time monitoring.