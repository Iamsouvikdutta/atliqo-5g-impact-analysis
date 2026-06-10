/*
Project: Atliqo 5G Launch Impact Analysis
Author: Souvik Dutta

Objective:
Analyze the impact of the 5G launch on business performance,
customer behavior, and growth opportunities.
*/

-- Which cities are destroying the most value through customer churn after the 5G launch?
WITH cte1 AS(
SELECT c.city_name,
SUM(CASE WHEN d.period = "Before 5G" THEN f.active_users_lakhs ELSE 0 END) AS before_5G_active_users,
SUM(CASE WHEN d.period = "After 5G" THEN f.active_users_lakhs ELSE 0 END) AS after_5G_active_users,
SUM(CASE WHEN d.period = "Before 5G" THEN f.unsubscribed_users_lakhs ELSE 0 END) AS before_5G_unsubscribed_users,
SUM(CASE WHEN d.period = "After 5G" THEN f.unsubscribed_users_lakhs ELSE 0 END) AS after_5G_unsubscribed_users
FROM fact_atliqometrics AS f
JOIN dim_cities AS c
ON f.city_code = c.city_code
JOIN dim_date AS d
ON f.date = d.date
GROUP BY c.city_name
), cte2 AS(
 SELECT city_name, before_5G_active_users, before_5G_unsubscribed_users,
(before_5G_unsubscribed_users / NULLIF(before_5G_active_users,0)) * 100 AS before_churn_pct,
after_5G_active_users, after_5G_unsubscribed_users,
(after_5G_unsubscribed_users / NULLIF(after_5G_active_users,0)) * 100 AS after_churn_pct
FROM cte1
) SELECT city_name, ROUND(before_5G_active_users,2) AS before_active_users,
ROUND(before_5G_unsubscribed_users,2) AS before_unsubscribed_users,
ROUND(before_churn_pct,2) AS before_churn_pct,
ROUND(after_5G_active_users,2) AS after_active_users,
ROUND(after_5G_unsubscribed_users,2) AS after_unsubscribed_users,
ROUND(after_churn_pct,2) AS after_churn_pct,
ROUND(after_churn_pct - before_churn_pct,2) AS churn_change_pp
FROM cte2;


-- Which cities should Atliqo prioritize for retention intervention after the 5G launch?
WITH cte1 AS (
SELECT c.city_name, 
SUM(CASE WHEN d.period = 'After 5G' THEN f.atliqo_revenue_crores ELSE 0 END) AS after_revenue,
SUM(CASE WHEN d.period = 'Before 5G' THEN f.active_users_lakhs ELSE 0 END) AS before_active_users,
SUM(CASE WHEN d.period = 'After 5G' THEN f.active_users_lakhs ELSE 0 END) AS after_active_users,
SUM(CASE WHEN d.period = 'Before 5G' THEN f.unsubscribed_users_lakhs ELSE 0 END) AS before_unsubscribed_users,
SUM(CASE WHEN d.period = 'After 5G' THEN f.unsubscribed_users_lakhs ELSE 0 END) AS after_unsubscribed_users
FROM fact_atliqometrics AS f
JOIN dim_date AS d
ON f.date = d.date
JOIN dim_cities AS c
ON f.city_code = c.city_code
GROUP BY c.city_name
),cte2 AS (
SELECT city_name, after_revenue,
(SELECT SUM(after_revenue)FROM cte1) AS total_revenue,
(before_unsubscribed_users / NULLIF(before_active_users,0)) * 100 AS before_churn_pct,
(after_unsubscribed_users / NULLIF(after_active_users,0)) * 100 AS after_churn_pct
FROM cte1
),cte3 AS (
SELECT city_name,after_revenue,
ROUND((after_revenue / NULLIF(total_revenue,0)) * 100,2) AS revenue_contri_pct,
ROUND(before_churn_pct,2) AS before_churn_pct,
ROUND(after_churn_pct,2) AS after_churn_pct,
ROUND(after_churn_pct - before_churn_pct,2) AS churn_change_pp
FROM cte2
)SELECT city_name, after_revenue,revenue_contri_pct,before_churn_pct,
after_churn_pct,churn_change_pp,
CASE WHEN revenue_contri_pct > 10 AND churn_change_pp > 0 THEN 'High Risk'
WHEN revenue_contri_pct <= 10 AND churn_change_pp > 0 THEN 'Medium Risk'
ELSE 'Low Risk' END AS risk_category
FROM cte3
ORDER BY revenue_contri_pct DESC, churn_change_pp DESC;
