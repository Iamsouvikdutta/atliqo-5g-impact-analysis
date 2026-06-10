/*
Project: Atliqo 5G Launch Impact Analysis
Author: Souvik Dutta

Objective:
Analyze the impact of the 5G launch on business performance,
customer behavior, and growth opportunities.
*/

-- Compare market share before vs after 5G for each company.
WITH cte1 AS (
SELECT d.period, m.city_code, m.company,m.tmv_city_crores AS total_market_value, 
(m.tmv_city_crores * m.ms_pct) / 100 AS market_revenue
FROM fact_marketshare AS m
JOIN dim_date AS d
ON d.date = m.date
), cte2 AS (
SELECT company, period, ROUND(SUM(total_market_value),0) AS total_market_value, ROUND(SUM(market_revenue),0) AS market_revenue,
ROUND((SUM(market_revenue) / SUM(total_market_value)) * 100,2) AS market_share_pct
FROM cte1
GROUP BY company, period
) SELECT company,
MAX(CASE WHEN period = "Before 5G" THEN market_share_pct END) AS ms_before_5g,
MAX(CASE WHEN period = "After 5G" THEN market_share_pct END) AS ms_after_5g,
ROUND((MAX(CASE WHEN period = "After 5G" THEN market_share_pct END) - MAX(CASE WHEN period = "Before 5G" THEN market_share_pct END)),2) AS share_change_PP
FROM cte2
GROUP BY company;

