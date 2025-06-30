# 📊 DAX Measures for Product Return Rate Analysis

This document outlines the **core DAX measures** required to analyze product return rates using Power BI. These measures help calculate return rates, total units, and revenue-related KPIs for deeper insights.

> ✅ Perform these steps in **Power BI Desktop** under the **Report View** or **Data View**.

---

## 1️⃣ Total Units Sold (for Sales)

**Action:**
- Right-click your table name (e.g., `Sheet1`) in the **Fields pane** → Select **New measure**.

**DAX Formula:**
```dax
Total Units Sold = 
CALCULATE(
    SUM('YourTableName'[Quantity]),
    'YourTableName'[TransactionType] = "Sale"
)
```
- 🔁 Replace 'YourTableName' with your actual table name (e.g., 'Sheet1').

## 2️⃣ Total Units Returned

**Action:**
- Right-click your table → New measure.

**DAX Formula:**
```dax
Total Units Returned = 
CALCULATE(
    SUM(ABS('YourTableName'[Quantity])),
    'YourTableName'[TransactionType] = "Return"
)
```
- ℹ️ We use ABS() since return quantities are stored as negative values.

## 3️⃣ Overall Return Rate (by Quantity)
**Action:**
- Right-click your table → New measure.

**DAX Formula:**
```dax
Return Rate % = 
DIVIDE([Total Units Returned], [Total Units Sold], 0)

```
- Format as Percentage:
- Select the Return Rate % measure in the Fields pane → Go to Measure Tools → Click %.

## 4️⃣ Total Revenue from Sales
**Action:**
- Right-click your table → New measure.

**DAX Formula:**
```dax
Total Revenue from Sales = 
CALCULATE(
    SUM('YourTableName'[SalesAmount]),
    'YourTableName'[TransactionType] = "Sale"
)
```

## 5️⃣ Total Revenue Lost to Returns
**Action:**
- Right-click your table → New measure.

**DAX Formula:**
```dax
Total Revenue Lost to Returns = 
CALCULATE(
    SUM('YourTableName'[SalesAmount]),
    'YourTableName'[TransactionType] = "Return"
)
```
6️⃣ Return Rate (by Revenue)
**Action:**
- Right-click your table → New measure.

**DAX Formula:**
```dax
Revenue Return Rate % = 
DIVIDE([Total Revenue Lost to Returns], [Total Revenue from Sales], 0)
```
- Format as Percentage:
- Select Revenue Return Rate % → Go to Measure Tools → Click %.