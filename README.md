
# Global Electronic Retail Customer and Sales Analysis

This project implements a full end-to-end analytics workflow to analyze the Global Electronics Retailer dataset, encompassing transactions, products, customers, stores, and countries.

## Business Problem

The "Global Electronic Retailer" platform experienced peak performance in 2019 but faced a significant decline in sales thereafter. Currently, the organization lacks a centralized, automated analytics workflow to identify the root causes of this downturn or to pinpoint shifting customer behaviors across different geographies.

Key stakeholders—including Executive Sponsors and Sales, Marketing, and Operations managers—require a data-driven solution to understand these trends and identify growth opportunities to remain competitive in the global electronics market.




## Project Objectives

The primary goal of this analysis is to implement a full analytics workflow that provides timely, accurate insights into global sales performance. The specific objectives include:

* Analyze Sales Contraction: Identify the specific factors and trends contributing to the substantial decline in sales following the 2019 peak.

* Identify Growth Levers: Segment performance by product, customer, and geography to pinpoint high-potential areas for targeted marketing and expansion.

* Establish Core KPIs: Define and calculate standardized metrics, including Total Sales, Total Profit, Year-over-Year (YoY) Growth, and Customer Retention.

* Demonstrate Technical Excellence: Showcase a professional end-to-end data solution involving data ingestion, cleansing, and transformation using SQL and Python.

* Empower Stakeholders: Deliver intuitive, interactive Tableau dashboards to provide managers and analysts with on-demand reporting and quick market-trend response capabilities.


## Tools Used 🛠️



* Python: Data cleaning (Pandas), handling missing values, and Exploratory Data Analysis (EDA).

* SQL: Data extraction, joining 5+ tables, and calculating the business insights.

Tableau: Interactive dashboarding to visualize regional performance and customer behaviour.

![]https://private-user-images.githubusercontent.com/87649792/530704771-a56771e1-7a4a-4333-b857-e88f0cc397ff.png?jwt=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJnaXRodWIuY29tIiwiYXVkIjoicmF3LmdpdGh1YnVzZXJjb250ZW50LmNvbSIsImtleSI6ImtleTUiLCJleHAiOjE3NjcwMTA4MzQsIm5iZiI6MTc2NzAxMDUzNCwicGF0aCI6Ii84NzY0OTc5Mi81MzA3MDQ3NzEtYTU2NzcxZTEtN2E0YS00MzMzLWI4NTctZTg4ZjBjYzM5N2ZmLnBuZz9YLUFtei1BbGdvcml0aG09QVdTNC1ITUFDLVNIQTI1NiZYLUFtei1DcmVkZW50aWFsPUFLSUFWQ09EWUxTQTUzUFFLNFpBJTJGMjAyNTEyMjklMkZ1cy1lYXN0LTElMkZzMyUyRmF3czRfcmVxdWVzdCZYLUFtei1EYXRlPTIwMjUxMjI5VDEyMTUzNFomWC1BbXotRXhwaXJlcz0zMDAmWC1BbXotU2lnbmF0dXJlPTIwNWMwZTFiMzhmYjE2NjUyOTFkOThiMmM1MmY1ODBiMDY5OGEwYWUzMGYxYmIyNWY1OWJkNGRkYzE3YTlmOGQmWC1BbXotU2lnbmVkSGVhZGVycz1ob3N0In0.99T1nGoQyXGU9GxbsKC-ACReduqsoMtpBOCuL01Dv-M

## Insights & Analytics 📊


*  Critical Revenue Volatility & Category Pivot

While sales peaked in 2019 led by Home Appliances, the 2020 fiscal year saw a drastic shift toward mobile tech (smartphones/touchscreens). Despite a long-term 79% decline in sales volume since 2016, identifying the transition from high-AOV appliances to high-frequency mobile devices is vital for future inventory forecasting.

*  Profitability Drivers & Product Performance

The most profitable categories are concentrated in high-tech sectors, specifically Computers, Home Appliances, and Cameras. While Home Appliances maintain the highest Average Order Value (AOV), Computers lead in total volume, particularly in the US market, suggesting a "volume-plus-value" strategy is necessary for margin growth.

*  Regional Retention & Digital Channel Supremacy

Online customers exhibit the highest brand loyalty with an 81% repeat purchase rate, significantly outperforming physical stores in the USA (46%) and UK (51%). This data suggests a strategic need to pivot marketing spend toward digital channels to capture more predictable, recurring revenue streams.

*  Strategic Geographic Prioritization

North America (USA and Canada) remains the primary revenue driver, with the USA and Germany dominating the "Top 5 Customer" tier. To maintain this lead, data indicates that English-speaking markets (USA, UK, Australia) require larger physical store footprints to successfully convert high-value sales.

*  Demographic Neutrality & Economic Indicators

The customer base shows a balanced gender distribution, indicating broad product appeal. Notably, the lack of "young" customers suggests that purchasing power is tied strictly to independent earners, suggesting that marketing campaigns should be targeted toward established professionals rather than a general youth demographic.

*  Operational Excellence in Logistics

Data indicates a consistent year-over-year improvement in logistics and delivery speed. This operational efficiency provides a competitive advantage that can be leveraged to offset the lower repeat purchase rates in high-volume regions like the USA through "faster-than-market" fulfillment promises.

*  Customer Fragmentation & Market Reach

The business possesses a highly diversified customer base of over 15,000 individuals, with the top 50 customers contributing only 3% of total sales. This low concentration risk is a strength, protecting the business from the loss of any single major account, though it necessitates a robust mass-market acquisition strategy.

![] https://private-user-images.githubusercontent.com/87649792/530704827-b5ab0324-bf65-4e38-916b-9e65aef8b888.png?jwt=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJnaXRodWIuY29tIiwiYXVkIjoicmF3LmdpdGh1YnVzZXJjb250ZW50LmNvbSIsImtleSI6ImtleTUiLCJleHAiOjE3NjcwMTA4MzQsIm5iZiI6MTc2NzAxMDUzNCwicGF0aCI6Ii84NzY0OTc5Mi81MzA3MDQ4MjctYjVhYjAzMjQtYmY2NS00ZTM4LTkxNmItOWU2NWFlZjhiODg4LnBuZz9YLUFtei1BbGdvcml0aG09QVdTNC1ITUFDLVNIQTI1NiZYLUFtei1DcmVkZW50aWFsPUFLSUFWQ09EWUxTQTUzUFFLNFpBJTJGMjAyNTEyMjklMkZ1cy1lYXN0LTElMkZzMyUyRmF3czRfcmVxdWVzdCZYLUFtei1EYXRlPTIwMjUxMjI5VDEyMTUzNFomWC1BbXotRXhwaXJlcz0zMDAmWC1BbXotU2lnbmF0dXJlPWFlNmZhMDBmY2IyN2E2YjM1NzVhNjU5MDM3YTU2MTAwNGE4M2M5NTliODZhYzVjNDBkNDYyMDA2NmIxZjhmMjMmWC1BbXotU2lnbmVkSGVhZGVycz1ob3N0In0.5sreHrCqRSs2rZxtzyrnBLjA-fe9pB4ZGDbmnG5stLU

## Recommendations 🚀

*  Execute a "Digital-First" Retention Strategy

Since Online customers demonstrate a dominant 81% repeat purchase rate compared to just 46% in the US physical stores, the business should prioritize digital loyalty programs.

Action: Transition underperforming physical store marketing budgets in the USA and UK toward personalized email marketing and "Online-Only" bundles to capitalize on high-retention behavior.

* Portfolio Pivot: Mobile & Touchscreen Integration

With the 2020 data showing a sharp decline in Home Appliances and a surge in Smartphone and Touchscreen demand, the product mix must be rebalanced.

Action: Shift inventory investment from traditional appliances toward mobile technology and camcorders. Given the high order value of appliances, use them as "anchor products" while focusing on high-frequency mobile tech to drive consistent monthly revenue.

*  Regional Store Optimization in English-Speaking Markets

The analysis shows that the USA, UK, and Australia require significantly more store area to generate sales.

Action: Conduct a footprint audit in these regions. Instead of opening more stores, focus on "Experience Centers"—larger, flagship-style locations in North America that allow customers to interact with high-tech products like projectors and home theater systems before purchasing.

*  Demographic Targeting: Focus on "The Independent Earner"

The data suggests that youth (non-earners) are not a primary driver of sales, regardless of gender.

Action: Direct advertising spend away from platforms like TikTok (youth-heavy) and toward LinkedIn or professional-targeted Google Ads. Marketing messaging should focus on "Utility," "Home Efficiency," and "Professional Tech" to appeal to the established earners who are actually completing the purchases.

![] https://private-user-images.githubusercontent.com/87649792/530704864-bcf73f97-bc41-4c76-9b17-359b9f77bf4b.png?jwt=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJnaXRodWIuY29tIiwiYXVkIjoicmF3LmdpdGh1YnVzZXJjb250ZW50LmNvbSIsImtleSI6ImtleTUiLCJleHAiOjE3NjcwMTA4MzQsIm5iZiI6MTc2NzAxMDUzNCwicGF0aCI6Ii84NzY0OTc5Mi81MzA3MDQ4NjQtYmNmNzNmOTctYmM0MS00Yzc2LTliMTctMzU5YjlmNzdiZjRiLnBuZz9YLUFtei1BbGdvcml0aG09QVdTNC1ITUFDLVNIQTI1NiZYLUFtei1DcmVkZW50aWFsPUFLSUFWQ09EWUxTQTUzUFFLNFpBJTJGMjAyNTEyMjklMkZ1cy1lYXN0LTElMkZzMyUyRmF3czRfcmVxdWVzdCZYLUFtei1EYXRlPTIwMjUxMjI5VDEyMTUzNFomWC1BbXotRXhwaXJlcz0zMDAmWC1BbXotU2lnbmF0dXJlPWIxY2NlNGFjNTk5YzZhYThkM2I3NjkyMmY2NmRmNGY4ZDQxM2IxZTYwODFlMjFlOWQ3NDg5M2M5MDY5NzdhNDAmWC1BbXotU2lnbmVkSGVhZGVycz1ob3N0In0.D3oPerSJfMtRcAbAElLfD4a5FRkaC2_ua7Eal5QnJFE
