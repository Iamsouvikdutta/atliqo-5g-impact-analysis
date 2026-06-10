/*
Project: Atliqo 5G Launch Impact Analysis
Author: Souvik Dutta

Objective:
Analyze the impact of the 5G launch on business performance,
customer behavior, and growth opportunities.
*/

-- Which cities contributed the most to Atliqo's net revenue growth after the 5G launch?
WITH cte1 AS (
SELECT c.city_name,
SUM(CASE WHEN d.period = "Before 5G" THEN f.atliqo_revenue_crores ELSE 0 END) AS revenue_before_5G,
SUM(CASE WHEN d.period = "After 5G" THEN f.atliqo_revenue_crores ELSE 0 END) AS revenue_after_5G
FROM fact_atliqometrics AS f
JOIN dim_date AS d
ON f.date = d.date
JOIN dim_cities AS c
ON f.city_code = c.city_code
GROUP BY c.city_name
), cte2 AS (
SELECT city_name, revenue_before_5G, revenue_after_5G,
(revenue_after_5G - revenue_before_5G) AS absolute_revenue_growth,
(SELECT SUM((revenue_after_5G - revenue_before_5G)) FROM cte1) AS total_growth
FROM cte1
) SELECT city_name, ROUND(revenue_before_5G,0) AS revenue_before_5G, ROUND(revenue_after_5G,0) AS revenue_after_5G,
ROUND(absolute_revenue_growth,0) AS absolute_revenue_growth,
ROUND((absolute_revenue_growth / NULLIF(total_growth,0)) * 100,2) AS growth_contri_pct
FROM cte2
ORDER BY growth_contri_pct DESC;

-- -- Which plans contributed the most to Atliqo's total revenue growth after the 5G launch?
WITH cte1 AS(
SELECT p.plans,
SUM(CASE WHEN d.period = "Before 5G" THEN plan_revenue_crores ELSE 0 END) AS revenue_before_5G,
SUM(CASE WHEN d.period = "After 5G" THEN plan_revenue_crores ELSE 0 END) AS revenue_after_5G
FROM fact_planrevenue AS p
JOIN dim_date AS d
ON p.date = d.date
GROUP BY p.plans
),cte2 AS (
 SELECT plans, revenue_before_5G, revenue_after_5G,
(revenue_after_5G - revenue_before_5G) AS absolute_growth,
(SELECT SUM((revenue_after_5G - revenue_before_5G)) FROM cte1) AS total_revenue
FROM cte1
) SELECT plans, ROUND(revenue_before_5G,2) AS revenue_before_5G, 
ROUND(revenue_after_5G,2) AS revenue_after_5G,
ROUND(absolute_growth,2) AS absolute_growth,
ROUND((absolute_growth / NULLIF(total_revenue,0)) * 100,2) AS growth_contri_pct
FROM cte2
ORDER BY growth_contri_pct DESC;


-- -- Which city-plan combinations contributed most to Atliqo's revenue growth after the 5G launch?
WITH cte1 AS(
SELECT c.city_name, p.plans,
SUM(CASE WHEN d.period = "Before 5G" THEN plan_revenue_crores ELSE 0 END) AS revenue_before_5G,
SUM(CASE WHEN d.period = "After 5G" THEN plan_revenue_crores ELSE 0 END) AS revenue_after_5G
FROM fact_planrevenue AS p
JOIN dim_date AS d
ON p.date = d.date
JOIN dim_cities AS c
ON p.city_code = c.city_code
GROUP BY c.city_name, p.plans
),cte2 AS (
 SELECT city_name, plans, revenue_before_5G, revenue_after_5G,
(revenue_after_5G - revenue_before_5G) AS absolute_growth,
(SELECT SUM((revenue_after_5G - revenue_before_5G)) FROM cte1) AS total_growth
FROM cte1
) SELECT city_name, plans, ROUND(revenue_before_5G,2) AS revenue_before_5G, 
ROUND(revenue_after_5G,2) AS revenue_after_5G,
ROUND(absolute_growth,2) AS absolute_growth,
ROUND((absolute_growth / NULLIF(total_growth,0)) * 100,2) AS growth_contri_pct
FROM cte2
ORDER BY city_name ASC, growth_contri_pct DESC;


-- Which plans contributed most to post-5G revenue growth?
WITH cte1 AS (
SELECT p.plans, 
ROUND(SUM(CASE WHEN d.period = "Before 5g" THEN p.plan_revenue_crores ELSE 0 END),2) AS revenue_before_5g,
ROUND(SUM(CASE WHEN d.period = "After 5g" THEN p.plan_revenue_crores ELSE 0 END),2) AS revenue_after_5g
FROM fact_planrevenue AS p
JOIN dim_date AS d
ON p.date = d.date
GROUP BY p.plans
), cte2 AS (
SELECT plans, revenue_before_5g, revenue_after_5g,
ROUND((SELECT SUM(revenue_before_5g) FROM cte1),2) AS total_revenue_before_5g,
ROUND((SELECT SUM(revenue_after_5g) FROM cte1),2) AS total_revenue_after_5g,
ROUND((revenue_after_5g - revenue_before_5g),2) AS absolute_growth,
ROUND((revenue_after_5g - revenue_before_5g) / NULLIF(revenue_before_5g,0) * 100,2) AS growth_pct
FROM cte1
) SELECT plans, revenue_before_5g, total_revenue_before_5g, 
ROUND((NULLIF(revenue_before_5g,0) / total_revenue_before_5g) * 100,2) AS revenue_contri_before_5g,
revenue_after_5g, total_revenue_after_5g,
ROUND((NULLIF(revenue_after_5g,0) / total_revenue_after_5g) * 100,2) AS revenue_contri_after_5g,
absolute_growth, growth_pct
FROM cte2;


