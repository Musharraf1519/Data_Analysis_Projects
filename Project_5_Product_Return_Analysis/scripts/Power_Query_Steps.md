# ⚙️ Power Query Transformation Steps

This document outlines the **step-by-step actions** to clean, transform, and prepare the Online Retail dataset using **Power Query Editor** in Power BI for product return rate analysis.

---

## 1️⃣ Inspect Column Data Types and Headers

- Review each column header and the icon beside it (e.g., `ABC` for text, `123` for whole number, `1.2` for decimal, calendar for date/time).
- Ensure proper data types:
  - `InvoiceDate` → **Date/Time**
  - `Quantity` → **Whole Number**
  - `UnitPrice` → **Decimal Number**
  - `CustomerID` → Likely set to **Decimal Number** (due to blanks); will be fixed later.

---

## 2️⃣ Handle Missing Values

### 🔹 Description Column (Product Name)
- Select the **Description** column.
- Go to the `Home` tab on the Power Query ribbon.
- In the **Reduce Rows** group → Click `Remove Rows` dropdown → Select **Remove Blank Rows**.
- ✅ This will remove rows where the product description is missing. A step named `Removed Blank Rows` will appear under **APPLIED STEPS**.

### 🔹 CustomerID Column
- Select the **CustomerID** column.
- Go to the `Home` tab → `Remove Rows` → `Remove Blank Rows`.
- ✅ This ensures analysis focuses only on transactions tied to **identified customers**.

---

## 3️⃣ Filter Out Invalid / Non-Meaningful Data

### 🔹 Filter UnitPrice (Remove Zero or Negative Prices)
- Click the filter arrow next to the **UnitPrice** column header.
- Hover over **Number Filters** → Select **Greater Than…**
- In the dialog box, enter `0` → Click **OK**.
- ✅ This removes items with 0 or negative prices (e.g., samples, entry errors), which are not true sales/returns.

---

## 4️⃣ Create a `TransactionType` Column (Sales vs. Returns)

- Go to the `Add Column` tab → Click **Conditional Column**.
- In the "Add Conditional Column" dialog box:
  - **New column name:** `TransactionType`
  - **If:** `Quantity` is less than `0` → Output: `Return`
  - **Else:** Output: `Sale`
  - Click **OK**
- ✅ A new column `TransactionType` will appear, classifying each row as **Sale** or **Return**.

---

## 5️⃣ Calculate `SalesAmount` (Absolute Revenue)

- Go to the `Add Column` tab → Click **Custom Column**.
- Use the formula:
  ```m
  Number.Abs([Quantity]) * [UnitPrice]
- **New column name:** `SalesAmount`
- Click **OK**
-Change the data type of the SalesAmount column to Decimal Number (1.2).
- ✅ This calculates revenue even for returns (negative quantities) by using absolute values.


## 6️⃣ Extract Time-Based Columns (from InvoiceDate)

- Select the InvoiceDate column.
- Go to the Add Column tab → Use the Date and Time dropdowns to extract:

  - Date → Year
  - Date → Month (numeric month: 1–12)
  - Date → Name of Month
  - Date → Name of Day
  - Time → Hour (numeric hour: 0–23)
- ✅ These fields enable powerful trend, seasonal, and behavior analysis.

## 7️⃣ Final Clean-up – Change CustomerID Type
- Now that all blank CustomerID rows are removed:
- Click the icon to the left of the CustomerID column header.
- Change its type to Whole Number (123).
- ✅ This ensures clean, consistent formatting for customer identifiers.

## 8️⃣ Remove Duplicate Rows (Best Practice)
- Select all columns (Ctrl + A or click the top-left corner of the table).
- Go to the Home tab → Remove Rows → Remove Duplicates.
- ✅ This eliminates duplicate records and ensures data integrity.

## 9️⃣ Apply Changes & Load to Model
- After all transformations are complete:
- Go to the Home tab → Click Close & Apply.
- ✅ This will load the cleaned and transformed dataset into your Power BI model for further analysis and visualization.