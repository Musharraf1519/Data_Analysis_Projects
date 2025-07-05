# Project 2: Web Traffic Analytics – E-commerce Clickstream Analysis

## 🧠 Objective
Analyze clickstream and transaction data from an e-commerce platform to uncover user behavior patterns, session dynamics, and product-level performance. The goal is to identify opportunities for website optimization, improved user experience, and enhanced conversion rates.

## 📦 Dataset
- Source: [Kaggle E-commerce Clickstream and Transaction Dataset](https://www.kaggle.com/datasets/waqi786/e-commerce-clickstream-and-transaction-dataset)
- **Contents**: Simulated user interactions, including:
  - `UserID`
  - `SessionID`
  - `Timestamp`
  - `EventType` (e.g., `page view`, `click`, `product view`, `add to cart`, `purchase`)
  - `ProductID`
  - `Amount` (only for purchase events)

## 🧰 Tools & Technologies

### Power BI Desktop
- **Power Query Editor**: For robust data cleaning, transformation, and feature engineering (e.g., session duration, event sequencing)
- **DAX (Data Analysis Expressions)**: For creating advanced measures and calculated columns to derive key performance indicators
- **Visualizations**: For designing interactive dashboards to present insights

## 📊 Key Analysis Metrics
- **User Engagement**
  - Total users
  - Total sessions
  - Average session duration
  - Page views per session

- **Conversion Funnel**
  - Product view to add-to-cart rate
  - Add-to-cart to purchase rate

- **Product Performance**
  - Top viewed products
  - Top purchased products
  - Conversion rates by product

- **Traffic Patterns**
  - User activity by time of day
  - Day of week
  - Event type distribution

- **User Behavior Flow**
  - Understanding common paths users take (conceptual only in Power BI without custom visuals)

## 🎯 Deliverables
1. **Cleaned & Transformed Data Model**  
   - All necessary transformations and logic built using Power Query inside Power BI.

2. **Interactive Power BI Dashboard (.pbix)**  
   - A comprehensive dashboard visualizing key web traffic and clickstream insights.

3. **Presentation Deck (.pptx)**  
   - Summarizing the analysis, key insights, and actionable recommendations for website optimization.

4. **Project Documentation (.md files)**  
   - Detailed steps for data cleaning and transformation (Power Query)  
   - List of DAX measures with their definitions  
   - Summary of business insights and findings

