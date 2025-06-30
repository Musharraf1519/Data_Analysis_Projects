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
