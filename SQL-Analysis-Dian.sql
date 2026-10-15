/* =====================================================================
   NIKE SALES ANALYTICS: SQL ANALYSIS
   Author  : Dian Jain
   Database: SQLite | Table: Nike_Sales (40 orders, Jan to Dec 2024)
   Contents: 14 business questions, each with its query
             (revenue, region and product performance, budget, margin,
              discount, seasonality, growth, ranking, data quality)
   ===================================================================== */

--SELECT * FROM "data" LIMIT 2000;---

/*DELETE FROM `Nike_Sales`
WHERE rowid NOT IN (
   SELECT MIN(rowid) 
    FROM `Nike_Sales`
    GROUP BY Order_ID
);*/

--select * from data--
 --alter table data rename to Nike_Sales--
--Q1) What is the Total Revenue, Total Profit and Units sold of Nike Comany for the year 2024?

 --select sum(revenue) as Revenue, sum(profit) as Profit , sum(units_sold) as units from `Nike_Sales`--

--Q2) Which Region generated the most revenue?--

/*select region, sum(revenue) as revenue from `Nike_Sales`
group by region
order by revenue desc
limit 1*/

--Q3) Which Products sells the most?

/*select Product_name, sum(units_sold) as units from `Nike_Sales`
group by Product_name
order by units desc
limit 1*/

--Q4) Which regions generate the highest total revenue and sales volume?--

/*select region, sum(revenue) as revenue , sum(units_sold) as units from `Nike_Sales`
group by region
order by revenue desc ,units desc*/

--Q5) How does actual revenue compare against the allocated budget across different regions?--

/*select region , sum(budget) as budget, sum(revenue) as revenue, Round(sum(revenue) - sum(budget),2) as difference from `Nike_Sales`
group by region
order by difference desc*/

--Q6) Which product categories and specific products yield the highest profit margins?--

/*select count(order_id) as total_orders,Product_name, Product_Category, round(avg("profit margin(%)"),2) as avg_pm from `Nike_Sales`
  GROUP BY Product_Name, Product_Category
  having total_orders>=2
order by avg_pm desc*/

--Q7) Are high-revenue products also delivering high net profit, or are high costs eating into margins?--

/*select Product_name, round(sum(revenue),2) as revenue, sum(profit) as profits, round(avg("Profit Margin(%)"),2) as profit_margin from `Nike_Sales`
group by product_name
order by revenue desc*/

--Q8) What is the correlation between the level of discount applied and the resulting profit or revenue?--
/*UPDATE Nike_Sales 
SET Discount_Applied = 0 
WHERE Discount_Applied IS NULL 
   OR Discount_Applied = 'null';
select count(order_id) as orders ,  discount_applied as discount, round(avg(revenue),2) as avg_revenue, round(avg(profit),2) as avg_profit from `Nike_Sales`
  group by discount
order by discount desc*/

--Q9) Which product categories rely the most on discounts to sell?--

/*select product_category, avg(discount_applied) as discount, units_sold, sum(discount_applied) as total_discount from `Nike_Sales`
group by product_category
order by discount desc*/

--Q10)What are the top-selling product categories and sizes broken down by gender category and department type?--

/*select product_category, gender_category,department_type, sum(revenue) as revenue from `Nike_Sales`
group by product_category, gender_category, department_type
order by revenue desc*/

--Q11)Are there seasonal or monthly trends in order volume throughout the year?
/*select strftime('%m', Order_date) as month,
  case
  when(strftime('%m',order_date) in ('01','02','03')) then 'Q1'
  when(strftime('%m',order_date) in ('04','05','06')) then 'Q2'
  when(strftime('%m',order_date) in ('07','08','09')) then 'Q3'
  Else 'Q4'
  End as Quarter,
  count(units_sold) as units_sold from `Nike_Sales`
group by Month
order by month asc;*/

--Q12)  Is revenue growing quarter on quarter? --

/*WITH QuarterlyRevenue AS(
select case
  when(strftime('%m',order_date) in ('01','02','03')) then 'Q1'
  when(strftime('%m',order_date) in ('04','05','06')) then 'Q2'
  when(strftime('%m',order_date) in ('07','08','09')) then 'Q3'
  Else 'Q4'
  End as Quarter,
  strftime('%Y', Order_Date) AS Year,
round(sum(revenue),2) as revenue from `Nike_Sales`
group by year,quarter
  )
SELECT 
    Year,
    Quarter,
    revenue,
    LAG(Revenue, 1) OVER (ORDER BY Year, Quarter) AS Prev_Quarter_Revenue,
    ROUND(((Revenue - LAG(Revenue, 1) OVER (ORDER BY Year, Quarter)) / LAG(Revenue, 1) OVER (ORDER BY Year, Quarter)) * 100, 2) AS Growth_Percentage
FROM QuarterlyRevenue;*/

--Q13) Top 3 products in each region by revenue?--

/*WITH RegionProductRevenue AS (
  select region, product_name, round(sum(revenue),2)as revenue, ROW_NUMBER() OVER (PARTITION BY Region ORDER BY SUM(Revenue) DESC) as Rank from `Nike_Sales`
group by region , product_name
  )
SELECT 
    Region,
    Product_Name,
    Revenue
FROM RegionProductRevenue
WHERE Rank <= 3
ORDER BY Region, Rank;*/

--Q14) Data quality check before reporting--

/*SELECT 'Total orders' AS check_name, COUNT(*) AS result FROM Nike_Sales
UNION ALL
SELECT 'Duplicate Order_IDs', COUNT(*) - COUNT(DISTINCT Order_ID) FROM Nike_Sales
UNION ALL
SELECT 'Missing revenue, profit or region',
       SUM(CASE WHEN Revenue IS NULL OR Revenue = '' OR Profit IS NULL OR Profit = ''
                  OR Region IS NULL OR Region = '' THEN 1 ELSE 0 END) FROM Nike_Sales*/
 
