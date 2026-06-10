/*
Project: Atliqo 5G Launch Impact Analysis
Author: Souvik Dutta

Objective:
Analyze the impact of the 5G launch on business performance,
customer behavior, and growth opportunities.
*/

-- Which cities experienced the highest and lowest revenue growth after 5G launch?
WITH revenue AS (
SELECT c.city_name,
ROUND(SUM(CASE WHEN d.period = "Before 5G" THEN f.atliqo_revenue_crores END),2) AS revenue_before_5g,
ROUND(SUM(CASE WHEN d.period = "After 5G" THEN f.atliqo_revenue_crores END),2) AS revenue_after_5g
FROM fact_atliqometrics AS f
JOIN dim_date AS d
ON f.date = d.date
JOIN dim_cities AS c
ON c.city_code = f.city_code
GROUP BY c.city_name
ORDER BY c.city_name
), growth_pct AS (
 SELECT city_name, revenue_before_5g, revenue_after_5g,
ROUND(((revenue_after_5g - revenue_before_5g) / revenue_before_5g * 100),2) AS growth_pct
FROM revenue
), max AS ( SELECT city_name, revenue_before_5g, revenue_after_5g, growth_pct,
MAX(growth_pct) OVER() AS global_max,
MIN(growth_pct) OVER() AS global_min
FROM growth_pct
)SELECT city_name, revenue_before_5g, revenue_after_5g, growth_pct,
CASE 
	WHEN growth_pct = global_max THEN 'Highest Growth'
	WHEN growth_pct = global_min THEN 'Lowest Growth'
    END AS performance_tier
FROM max
WHERE growth_pct = global_max 
   OR growth_pct = global_min
ORDER BY growth_pct DESC;

-- Which cities experienced the highest increase in unsubscribed users after the 5G launch?
WITH cte1 AS (
SELECT c.city_name,
ROUND(SUM( CASE WHEN d.Period = "Before 5G" THEN m.unsubscribed_users_lakhs END),2) AS before5G_unsubscribed_users,
ROUND(SUM( CASE WHEN d.period = "After 5G" THEN m.unsubscribed_users_lakhs END),2) AS after5G_unsubscribed_users
FROM fact_atliqometrics AS m
JOIN dim_date AS d
ON d.date = m.date
JOIN dim_cities AS c
ON m.city_code = c.city_code
GROUP BY c.city_name
), cte2 AS(
 SELECT city_name, before5G_unsubscribed_users, after5G_unsubscribed_users,
ROUND(((after5G_unsubscribed_users - before5G_unsubscribed_users) / before5G_unsubscribed_users) * 100,2)AS growth_pct
from cte1
) SELECT *, DENSE_RANK() OVER (ORDER BY growth_pct DESC) AS growth_pct_rank
FROM cte2
LIMIT 1;

-- Which cities gained revenue despite losing active users after the 5G launch?
WITH cte1 AS (
SELECT c.city_name, 
ROUND(SUM(CASE WHEN d.period = "Before 5G" THEN m.atliqo_revenue_crores ELSE 0 END ),2) AS before5G_revenue,
ROUND(SUM(CASE WHEN d.period = "After 5G" THEN m.atliqo_revenue_crores ELSE 0 END ),2) AS after5G_revenue,
ROUND(SUM(CASE WHEN d.period = "Before 5G" THEN m.active_users_lakhs ELSE 0 END),2) AS before5G_active_users,
ROUND(SUM(CASE WHEN d.period = "After 5G" THEN m.active_users_lakhs ELSE 0 END),2) AS after5G_active_users
FROM fact_atliqometrics AS m
JOIN dim_date AS d
ON m.date = d.date
JOIN dim_cities AS c
ON m.city_code = c.city_code
GROUP BY c.city_name
), cte2 AS (
SELECT city_name, before5G_revenue, after5G_revenue, before5G_active_users, after5G_active_users,
ROUND((( after5G_revenue - before5G_revenue) / NULLIF(before5G_revenue,0))*100,2) AS revenue_growth_pct,
ROUND((( after5G_active_users - before5G_active_users) / NULLIF(before5G_active_users,0))*100,2) AS active_users_growth_pct
FROM cte1
), cte3 AS (
SELECT *,
DENSE_RANK() OVER (ORDER BY revenue_growth_pct DESC) AS revenue_growth_rank,
DENSE_RANK() OVER (ORDER BY active_users_growth_pct ASC) AS active_users_growth_rank
FROM cte2
) SELECT *
FROM cte3 
WHERE revenue_growth_pct > 0
AND active_users_growth_pct < 0;


-- How can Atliqo segment its cities based on revenue growth and active-user growth after the 5G launch to identify the appropriate growth strategy for each market?
WITH cte1 AS (
SELECT c.city_name, 
ROUND(SUM(CASE WHEN d.period = "Before 5G" THEN f.atliqo_revenue_crores END),2) AS revenue_before_5G,
ROUND(SUM(CASE WHEN d.period = "After 5G" THEN f.atliqo_revenue_crores END),2) AS revenue_after_5G,
ROUND(SUM(CASE WHEN d.period = "Before 5G" THEN f.active_users_lakhs END),2) AS users_before_5G,
ROUND(SUM(CASE WHEN d.period = "After 5G" THEN f.active_users_lakhs END),2) AS users_after_5G
FROM fact_atliqometrics AS f
JOIN dim_date AS d
ON d.date = f.date
JOIN dim_cities AS c
ON c.city_code = f.city_code
GROUP BY c.city_name
), cte2 AS (
SELECT city_name, revenue_before_5G, revenue_after_5G,
ROUND((revenue_after_5G - revenue_before_5G) / NULLIF(revenue_before_5G,0) * 100,2) AS revenue_growth_pct,
users_before_5G, users_after_5G,
ROUND((users_after_5G - users_before_5G) / NULLIF(users_before_5G,0) * 100,2) AS users_growth_pct
FROM cte1
) SELECT city_name, revenue_before_5G, revenue_after_5G, revenue_growth_pct,
users_before_5G, users_after_5G, users_growth_pct,
CASE WHEN revenue_growth_pct >=0 AND users_growth_pct >=0 THEN "Growth Leader"
WHEN revenue_growth_pct >=0 AND users_growth_pct <0 THEN "Monetization Driven"
WHEN revenue_growth_pct <0 AND users_growth_pct >=0 THEN "Acquisation Opportunity"
ELSE "Decline Market" END AS segment
FROM cte2;