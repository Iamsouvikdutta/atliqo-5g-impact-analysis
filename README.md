# 📶 Atliqo 5G Launch Impact Analysis

## 📌 Project Overview

Atliqo, a leading telecom service provider, launched its 5G services across multiple cities to drive growth and strengthen its market position. Following the launch, the leadership team wanted to evaluate whether the 5G initiative translated into meaningful business outcomes.

This project analyzes the impact of the 5G launch on key business metrics such as revenue, active users, ARPU, churn, market share, and plan performance. Using SQL for data analysis and Power BI for interactive storytelling, the project uncovers the drivers behind business performance and provides strategic recommendations for future growth.

---

## 🎯 Business Objectives

The analysis aims to answer the following business questions:

* Did the 5G launch improve Atliqo's overall business performance?
* Was revenue growth driven by customer acquisition or monetization?
* Which cities contributed the most to revenue growth?
* Which plans were responsible for post-5G revenue performance?
* How did Atliqo's market share change compared to competitors?
* Which cities require immediate intervention due to increasing churn?
* How can cities be segmented to determine appropriate growth strategies?

---

## 🛠️ Tools & Technologies Used

* **SQL (MySQL)** – Data extraction, transformation, and business analysis
* **Power BI** – Interactive dashboard development
* **DAX** – KPI calculations and advanced business measures
* **Data Modeling** – Building relationships between fact and dimension tables
* **Business Analytics** – Insight generation and strategic recommendations

---

## 🗂️ Data Model

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

## 📊 Dashboard Overview

### 1. Executive Overview

**Business Question:**

> Did the 5G launch improve Atliqo's overall business performance?

**Key Metrics:**

* Revenue Growth %
* Active User Growth %
* ARPU Growth %

**Key Insights:**

* Revenue remained largely stable after the 5G launch, declining marginally by **0.50%**.
* Active users declined by **8.28%**, indicating customer attrition.
* ARPU increased by **8.48%**, suggesting monetization through premium plan adoption.

---

### 2. Growth Drivers Analysis

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

### 3. Risks & Opportunities

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

### 4. Deep Dive Analysis

**Business Question:**

> How can stakeholders interactively investigate performance drivers?

**Features:**

* City-level exploration
* Plan-level performance analysis
* Revenue vs Active User Growth analysis
* Dynamic market share tracking
* Interactive slicers for detailed investigation

---

### 5. Strategic Recommendations

Based on the analysis, the following recommendations were identified:

* Strengthen retention initiatives in high-revenue cities experiencing increasing churn.
* Continue expanding premium plans that are positively impacting ARPU.
* Develop targeted acquisition strategies in cities classified as Acquisition Opportunities.
* Closely monitor competitor movements in strategically important markets.
* Prioritize intervention in cities exhibiting both declining users and increasing churn.

---

## 💡 Key Business Insights

* Revenue remained largely flat after the 5G launch (**-0.50%**).
* Active users declined significantly (**-8.28%**), indicating retention challenges.
* ARPU improved substantially (**+8.48%**), suggesting successful monetization of the existing customer base.
* Growth was concentrated within a limited number of cities.
* Several markets exhibited **Monetization Driven Growth**, highlighting a dependence on premium pricing rather than customer expansion.
* Increasing churn in key markets poses a potential threat to long-term sustainable growth.

---

## 📷 Dashboard Screenshots

### Executive Overview

![Executive Overview](dashboard-screenshots/01_Executive_Overview.png)

### Growth Drivers Analysis

![Growth Drivers Analysis](dashboard-screenshots/02_Growth_Drivers.png)

### Risks & Opportunities

![Risks & Opportunities](dashboard-screenshots/03_Risks_Opportunities.png)

### Deep Dive Analysis

![Deep Dive Analysis](dashboard-screenshots/04_Deep_Dive_Analysis.png)

### Strategic Recommendations

![Strategic Recommendations](dashboard-screenshots/05_Recommendations.png)

---

## 📁 Repository Structure

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
├── dashboard-screenshots/
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

## 🚀 Outcomes

This project demonstrates the complete analytics lifecycle:

* Business Problem Understanding
* SQL-Based Data Analysis
* Data Modeling
* DAX Measure Development
* Dashboard Design & Storytelling
* Strategic Recommendation Generation

The objective was not only to visualize data but also to translate business performance into actionable insights that support executive decision-making.

---

## 👤 About Me

**Souvik Dutta**

Business Analyst with experience in leveraging SQL, Power BI, and data-driven insights to solve business problems and support strategic decision-making.

📧 Email: *Add your email here*

🔗 LinkedIn: *Add your LinkedIn profile URL here*

💻 GitHub: *Add your GitHub profile URL here*

---

If you found this project interesting, feel free to connect or provide feedback. I'm always open to discussions around analytics, business intelligence, and data-driven problem-solving.
