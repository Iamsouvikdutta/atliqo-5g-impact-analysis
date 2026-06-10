/*
Project: Atliqo 5G Launch Impact Analysis
Author: Souvik Dutta

Objective:
Analyze the impact of the 5G launch on business performance,
customer behavior, and growth opportunities.
*/

-- "Monthly revenue trend before vs after 5G launch”
SELECT d.month_name AS month_name, d.period,
ROUND(SUM(f.atliqo_revenue_crores),2) AS total_revenue
FROM dim_date AS d
LEFT JOIN fact_atliqometrics AS f
ON d.date = f.date
GROUP BY d.month_name, d.Period;


-- Was revenue growth after the 5G launch driven by more users, higher ARPU, or both?
WITH cte1 AS(
SELECT 
ROUND(SUM(CASE WHEN d.period = "Before 5G" THEN atliqo_revenue_crores END),2) AS revenue_before_5G,
ROUND(SUM(CASE WHEN d.period = "After 5G" THEN atliqo_revenue_crores END),2) AS revenue_after_5G,
ROUND(SUM(CASE WHEN d.period = "Before 5G" THEN active_users_lakhs END),2) AS users_before_5G,
ROUND(SUM(CASE WHEN d.period = "After 5G" THEN active_users_lakhs END),2) AS users_after_5G,
ROUND((SUM(CASE WHEN d.period = "Before 5G" THEN atliqo_revenue_crores END) / SUM(CASE WHEN d.period = "Before 5G" THEN active_users_lakhs END)),2) AS ARPU_before_5G,
ROUND((SUM(CASE WHEN d.period = "After 5G" THEN atliqo_revenue_crores END) / SUM(CASE WHEN d.period = "After 5G" THEN active_users_lakhs END)),2) AS ARPU_after_5G
FROM fact_atliqometrics
JOIN dim_date AS d
ON fact_atliqometrics.date = d.date
),cte2 AS (
SELECT "revenue" AS metric,
revenue_before_5G AS value_before_5G,
revenue_after_5G AS value_after_5G
FROM cte1
UNION ALL
SELECT "active_users",
users_before_5G,
users_after_5G
FROM cte1
UNION ALL
SELECT "ARPU",
ARPU_before_5G,
ARPU_after_5G
FROM cte1
) SELECT metric, value_before_5G, value_after_5G,
ROUND(((value_after_5G - value_before_5G) / NULLIF(value_before_5G,0)) * 100,2) AS growth_pct
FROM cte2;