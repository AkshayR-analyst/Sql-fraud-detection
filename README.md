# 🏦 SQL Fraud Detection System

A comprehensive MySQL database project that detects suspicious banking activity using advanced SQL concepts — built as a data analytics portfolio project.

## 📌 Project Overview
This project simulates a real-world banking fraud detection system. It uses pattern analysis across transactions, logins, devices, and risk scores to flag suspicious customer activity — similar to systems used by actual banks.

## 🛠️ Tools Used
- MySQL
- MySQL Workbench

## 📁 Database Structure — 15 Tables
1. customers
2. accounts
3. transactions
4. login_logs
5. fraud_alerts
6. branches
7. cards
8. beneficiaries
9. devices
10. otps
11. blacklist
12. investigation
13. notifications
14. risk_scores
15. audit_logs

## 🔍 Queries (36 Total)

**Basic Fraud Detection**
1. Multiple Locations in Short Time
2. Large Amount Transactions
3. Multiple Failed Logins
4. Blocked Account Activity
5. High Risk Alerts Summary
6. Customer Wise Fraud Report

**Using Extended Tables**
7. Blocked Cards Activity
8. Blacklisted Customers Report
9. High Risk Score Customers
10. Unread Fraud Notifications
11. Beneficiaries Added by Each Customer
12. Expired OTPs
13. Critical Investigations Report
14. Suspicious Devices Report

**Subqueries**
15. Above Average Transaction Amount
16. Customers Above Average Balance
17. Accounts with Below Average Transactions
18. Customer with Highest Risk Score
19. Customers with Most Fraud Alerts

**LIKE Operator**
20. Search Customers by City
21. Suspicious Transactions by Location
22. Customers Worse than Average Risk Score
23. All Fraud Related to Mumbai

**Triggers**
24. Auto Update Fraud Alert Status
25. Auto Blacklist High Risk Customer

**Stored Procedure**
26. Get Customer Fraud Report

**Window Functions**
27. RANK() — Rank Transactions by Amount
28. LAG() — Compare with Previous Transaction
29. SUM() OVER() — Running Total

**Advanced Combined Concepts**
30. Rank Branches by Total Account Balance
31. Customers Whose Risk Score Increased Over Time
32. Devices Used by High Risk Customers
33. Customers with Increasing Transaction Amounts
34. Top 3 Customers by Total Transaction Value
35. Customer with Highest Risk Score in Their City (Correlated Subquery)
36. Fraud Alerts Count vs System Average

## ⚙️ SQL Concepts Covered
- DDL & DML (CREATE, INSERT)
- JOINs (Inner, Multiple, Left)
- GROUP BY, HAVING
- CASE WHEN
- Subqueries (Simple, Nested, Correlated)
- LIKE Operator
- Window Functions (RANK, DENSE_RANK, LAG, SUM OVER)
- Triggers
- Stored Procedures
- Indexing

## 🚀 How to Run
1. Run `fraud_detection_tables.sql` first (creates database, tables, and inserts data)
2. Run `fraud_detection_queries.sql` next (runs all queries, triggers, and procedures)

 ## 👤 Author
**Akshay R**
Aspiring Data Analyst | SQL & Database Design
GitHub: [AkshayR-analyst](https://github.com/AkshayR-analyst)
