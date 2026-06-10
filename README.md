# 📶 Atliqo 5G Launch Impact Analysis

## Executive Summary

Atliqo, a leading telecom service provider, launched its 5G services across multiple cities to accelerate growth and strengthen its competitive position in the market. Following the rollout, the leadership team sought to understand whether the 5G initiative translated into meaningful business outcomes.

This project evaluates the impact of the 5G launch on critical business metrics, including revenue performance, active users, ARPU (Average Revenue Per User), churn trends, market share dynamics, and plan adoption patterns. Using SQL for data analysis and Power BI for executive storytelling, the project identifies growth drivers, emerging risks, and strategic opportunities to support data-driven decision-making.

---

## Business Problem

Following the nationwide 5G rollout, Atliqo's leadership team needed answers to several strategic questions:

* Did the 5G launch improve overall business performance?
* Was growth driven by customer acquisition or premium monetization?
* Which cities demonstrated sustainable growth opportunities?
* Which markets required immediate intervention due to rising churn?
* How should future investments be prioritized to maximize long-term profitability?

The objective was to transform operational and customer data into actionable insights that support strategic business decisions.

---

## Project Objectives

This analysis addresses the following stakeholder questions:

* Did the 5G launch improve Atliqo's overall business performance?
* Was revenue growth driven by customer acquisition or monetization?
* Which cities contributed the most to revenue growth?
* Which plans were responsible for post-5G revenue performance?
* How did Atliqo's market share change compared to competitors?
* Which cities require immediate intervention due to increasing churn?
* How can cities be segmented to determine appropriate growth strategies?

---

## Tools & Technologies Used

* **SQL (MySQL)** – Data extraction, transformation, and business analysis
* **Power BI** – Interactive dashboard development and storytelling
* **DAX** – KPI calculations and advanced business measures
* **Data Modeling** – Building relationships between fact and dimension tables
* **Business Analytics** – Insight generation and strategic recommendations

---

## Analytical Techniques Used

* Revenue Trend Analysis
* Churn Analysis
* Market Share Analysis
* Customer Segmentation
* Growth Driver Analysis
* City Risk Classification
* KPI Development and Performance Tracking
* Strategic Recommendation Framework

---

## Data Model

The project follows a star schema data model consisting of:

### Fact Tables

* `fact_atliqometrics`
* `fact_marketshare`
* `fact_planrevenue`

### Dimension Tables

* `dim_date`
* `dim_cities`
* `dim_plan`

---

## Dashboard Overview

### 1️⃣ Executive Overview

**Business Question:**

> Did the 5G launch improve Atliqo's overall business performance?

**Key Metrics:**

* Revenue Growth %
* Active User Growth %
* ARPU Growth %

**Key Insights:**

* Despite the 5G rollout, overall revenue remained relatively stable, declining marginally by **0.50%**.
* Active users declined by **8.28%**, indicating emerging customer retention challenges.
* ARPU increased by **8.48%**, suggesting successful monetization through premium plan adoption.

---

### 2️⃣ Growth Drivers Analysis

**Business Question:**

> What drove Atliqo's post-5G business performance?

**Analysis Performed:**

* Revenue growth contribution by city
* Revenue growth contribution by plan
* City segmentation based on revenue and active-user growth

#### City Segmentation Framework

| Revenue Growth | User Growth | Segment                 |
| -------------- | ----------- | ----------------------- |
| Positive       | Positive    | Growth Leader           |
| Positive       | Negative    | Monetization Driven     |
| Negative       | Positive    | Acquisition Opportunity |
| Negative       | Negative    | Decline Market          |

---

### 3️⃣ Risks & Opportunities

**Business Question:**

> Which markets require immediate attention?

**Analysis Performed:**

* Market share movement against competitors
* Churn analysis across cities
* Risk categorization based on revenue contribution and churn deterioration

#### Risk Categories

* 🔴 High Risk
* 🟠 Medium Risk
* 🟢 Low Risk

---

### 4️⃣ Deep Dive Analysis

**Business Question:**

> How can stakeholders interactively investigate performance drivers?

**Features:**

* City-level exploration
* Plan-level performance analysis
* Revenue vs Active User Growth analysis
* Dynamic market share tracking
* Interactive slicers for detailed investigation

---

## Key Business Insights

* Revenue remained largely flat after the 5G launch (**-0.50%**), indicating limited overall business uplift.
* Active users declined significantly (**-8.28%**), highlighting customer retention challenges.
* ARPU improved substantially (**+8.48%**), suggesting effective premium plan monetization.
* Growth was concentrated within a limited number of cities, indicating uneven market performance.
* Several markets exhibited **Monetization Driven Growth**, highlighting dependence on premium pricing rather than customer expansion.
* Increasing churn in strategically important markets poses a significant threat to sustainable long-term growth.

---

## Strategic Recommendations

* Strengthen retention initiatives in high-value cities experiencing increasing churn to protect long-term revenue streams.
* Continue expanding premium plans that are positively impacting ARPU and customer value realization.
* Develop targeted acquisition campaigns in cities classified as **Acquisition Opportunities**.
* Closely monitor competitor activity in strategically important markets to safeguard market share.
* Prioritize intervention in cities exhibiting both declining users and increasing churn to prevent further deterioration.

---

## Business Impact

This analysis enables leadership teams to:

* Identify markets requiring immediate intervention.
* Differentiate between acquisition-driven and monetization-driven growth.
* Prioritize customer retention initiatives in high-value regions.
* Optimize plan strategies based on customer adoption patterns.
* Support data-driven investment decisions for future 5G expansion.

---

## Dashboard Screenshots

### Executive Overview

![Executive Overview](./Dashboard%20Screenshots/01_Executive_Overview.png)

### Growth Drivers Analysis

![Growth Drivers Analysis](./Dashboard%20Screenshots/02_Growth_Drivers.png)

### Risks & Opportunities

![Risks & Opportunities](./Dashboard%20Screenshots/03_Risks_Opportunities.png)

### Deep Dive Analysis

![Deep Dive Analysis](./Dashboard%20Screenshots/04_Deep_Dive_Analysis.png)

### Strategic Recommendations

![Strategic Recommendations](./Dashboard%20Screenshots/05_Recommendations.png)

---

## Repository Structure

```text
atliqo-5g-impact-analysis/
│
├── README.md
│
├── SQL Analysis/
│   ├── 01_Executive_Overview.sql
│   ├── 02_Growth_Drivers.sql
│   ├── 03_Market_Share_Analysis.sql
│   ├── 04_Churn_Analysis.sql
│   └── 05_City_Segmentation.sql
│
├── Power BI Dashboard/
│   ├── Atliqo_5G_Impact_Analysis.pbix
│   └── Dashboard.pdf
│
├── Dashboard Screenshots/
│   ├── 01_Executive_Overview.png
│   ├── 02_Growth_Drivers.png
│   ├── 03_Risks_Opportunities.png
│   ├── 04_Deep_Dive_Analysis.png
│   └── 05_Recommendations.png
│
└── Dataset/
    └── dataset_source.txt
```

---

## Key Learnings

Through this project, I strengthened my ability to:

* Translate executive business questions into analytical frameworks.
* Perform end-to-end SQL-based business analysis.
* Design interactive Power BI dashboards for stakeholder consumption.
* Derive strategic recommendations from complex datasets.
* Communicate insights that support business decision-making.

This project demonstrates how analytics can move beyond reporting to drive strategic business actions.

---

## About Me

**Souvik Dutta**

Analytics professional with 8+ years of experience across e-commerce and operations leadership roles, currently transitioning into Business Analytics. Passionate about leveraging SQL, Power BI, and data-driven insights to solve business problems and support strategic decision-making.

🔗 LinkedIn: https://www.linkedin.com/in/iamsouvikdutta/

💻 GitHub: https://github.com/Iamsouvikdutta

---

If you found this project interesting, feel free to connect or provide feedback. I'm always open to discussions around analytics, business intelligence, and data-driven problem-solving.
