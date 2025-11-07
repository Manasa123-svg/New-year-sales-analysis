# New-year-sales-analysis

# Project Overview: New Year Sales Analysis

This project presents a comprehensive Exploratory Data Analysis (EDA) of a New Year sales dataset. The primary objective is to clean and process the raw data, extract key business metrics, and uncover actionable insights into customer behavior. The analysis follows a complete data workflow, starting from data cleaning in Python, moving to data querying and aggregation in SQL, and culminating in a dynamic and interactive dashboard in Power BI to visualize the findings for business stakeholders.

# Tools and Technologies Used

**Python:**  data cleaning, transformation, and initial visualization.
           .Libraries: pandas, numpy, matplotlib, seaborn, sqlalchemy.
**SQL (PostgreSQL):** For storing the cleaned data, performing complex queries, and data aggregation.
**Power BI:** For creating an interactive and visually appealing dashboard to present the final insights.

# 1. Data Processing in Python (Jupyter Notebook)

The analysis begins in a Jupyter Notebook where the "New Year Sales Data.csv" is loaded and prepared for analysis.

# Data Cleaning:
. Empty columns ('Status', 'unnamed1') were dropped.
. Rows with missing 'Amount' values were removed.
. Column names were standardized to a consistent lowercase format.
# Data Transformation:
. Categorical columns like gender and marital_status were mapped from numerical/abbreviated codes to more descriptive string values (e.g., 'F' to 'Female', '0' to 'Unmarried').
. The Amount column was converted to an integer data type.
**Data Export:** The cleaned dataset was exported to a new_year_sales_data.csv file and loaded into a PostgreSQL database table named new_year for further analysis.

# 2. SQL Analysis

After loading the cleaned data into a PostgreSQL database, SQL queries were used to extract key metrics and perform deeper analysis.

-- View all data from the table

``` sql
   select * from new_year;
   ```

-- KEY METRICS --

-- Total Revenue

 ``` sql
   select Round(sum(amount)::numeric,2) as total_revenue from new_year;
   ```

-- Total Orders (based on distinct products)

``` sql
   select count(distinct product_id) as total_orders from new_year;
   ```

-- Average Order Value

``` sql
  select round(sum(amount)::numeric,2)/round(count(distinct product_id)::numeric,2) as avg_order_value from new_year;
  ```

-- Average Revenue per Order

 ``` sql
    select round(avg(amount)::numeric,2) as avg_revenue from new_year;
  ```

-- CUSTOMER DEMOGRAPHICS ANALYSIS --

-- Which gender has high purchasing power?

``` sql
   select gender, Round(sum(amount),2) as total_purchase from new_year
   group by gender order by total_purchase desc;
```

-- Total count of each gender
   ``` sql
   select gender, count(*) from new_year group by 1;
   ```

-- Count of customers by age group
``` sql
   select age_group, count(*) as total_count from new_year
   group by 1 order by 1 asc;
```

-- Total purchase amount by age group
```sql
select age_group, Round(sum(amount),2) as total_purchase from new_year
group by 1;
```

-- Number of orders in top 10 states
```sql
select state, count(orders) as total_orders from new_year
group by 1 order by total_orders desc limit 10;
```

-- Total purchase amount by top 10 states
```sql
select state, Round(sum(amount),2) as total_purchases from new_year
group by 1 order by total_purchases desc limit 10;
```

-- Count of customers by marital status
```sql
select marital_status, count(*) as total_count from new_year
group by 1;
```

-- Purchasing amount by marital status
```sql
select marital_status, Round(sum(amount),2) as total_purchases from new_year
group by 1 order by total_purchases;
```

-- BUSINESS PERFORMANCE ANALYSIS --

-- Count the number of customers by occupation
```sql
select occupation, count(*) as number_of_occupations from new_year
group by 1 order by number_of_occupations desc;
```

-- Purchasing amount by occupation
```sql
select occupation, sum(amount) as total_purchases from new_year
group by 1 order by 2 desc;
```

-- Count of product categories sold
```sql
select product_category, count(*) as total_count from new_year
group by 1 order by 2 desc;
```

-- Total amount purchased by top categories
```sql
select product_category, round(sum(amount),2) as total_purchases from new_year
group by 1 order by 2 desc;
```

# 3. Power BI Dashboard: New Year Sales

The insights derived from Python and SQL were visualized in an interactive Power BI dashboard to provide a clear and consolidated view of the sales performance.

![alt text](https://i.ibb.co/L6V6Qn0/New-Year-Sales-Dashboard.png)

# Key Insights from the Dashboard:

# Top-Level Metrics:

**Total Revenue:** 106.2M
**Total Orders:** 2.35K
**Average Revenue:** 9.45K
**Average Order Value:** 45.21K

# Customer Demographics:

**Gender:** Females are the dominant customer segment, accounting for 2.1K orders and contributing nearly 70% of the total revenue.
**Marital Status:** Unmarried customers place more orders (1,977) and contribute a larger share of the revenue (58.47%).
**Age Group:** The 26-35 age group is the most significant contributor to revenue, accounting for 51.97% of the total. This is followed by the 36-45 age group (40.46%).

**Sales Performance:**
**Occupation:** The IT Sector is the highest revenue-generating occupation (14.8M), followed by Healthcare (13.0M) and Aviation (10.8M).
**State:** Uttar Pradesh leads in total revenue (19M), followed closely by Maharashtra (14M) and Karnataka (14M).
**Product Category:** Food is the top-performing category with 34M in revenue, significantly higher than other categories like Clothing and Electronics.

# Conclusion

The comprehensive analysis across Python, SQL, and Power BI provides a unified and clear picture of the New Year sales. The findings consistently highlight that the primary driver of sales is married women between the ages of 26-35, working in the IT, Healthcare, or Aviation sectors, and residing in Uttar Pradesh, Maharashtra, or Karnataka. The most profitable product categories are Food, Clothing & Apparel, and Electronics.

These insights empower the business to make data-driven decisions for future sales events, including targeted marketing strategies, optimized inventory management, and personalized customer engagement efforts.
