# E-Commerce Database SQL Engineering Project

## Project Overview

This project simulates a production-style e-commerce database designed to demonstrate advanced SQL skills required for Data Engineering, Backend Development, and Analytics roles.

The database solves real business problems such as customer analytics, revenue tracking, product performance analysis, and inventory monitoring using advanced SQL techniques.

This project focuses on writing production-quality SQL rather than just academic queries.

---

## Objectives

Design a relational database schema

Practice advanced SQL queries

Solve real business problems using SQL

Implement database programming concepts

Demonstrate query optimization techniques

Build a strong SQL portfolio project

---

## Database Architecture

### Core Tables

Customers → Customer information

Orders → Order transactions

Order_Items → Product level details

Products → Product catalog

Categories → Product classification

Payments → Payment transactions

---

## Entity Relationship Flow

Customers → Orders → Order_Items → Products → Categories

Orders → Payments

---

## SQL Concepts Implemented

### SQL Fundamentals

SELECT  
GROUP BY  
HAVING  
ORDER BY  
Subqueries  

### Joins

INNER JOIN  
LEFT JOIN  
Multi-table joins  

### Window Functions

ROW_NUMBER()

RANK()

DENSE_RANK()

LAG()

LEAD()

Running totals

Partition analytics

### Analytical SQL

Revenue analysis

Customer lifetime value

Repeat customer detection

Customer segmentation

Product performance analysis

Inventory alerts

Sales trend analysis

### Advanced SQL

CTEs

Nested queries

Case statements

Ranking problems

Top N problems

Gaps and islands logic

### Database Programming

Stored Procedures

Functions

Triggers

Views

Transactions

### Performance Optimization

Index creation

Query design practices

Aggregation optimization

---

## Business Case Problems Implemented

Top revenue generating customers

Customer churn detection

Best selling products

Revenue trend analysis

Customer segmentation (Premium / Gold / Regular)

Inventory risk detection

Customer lifetime value calculation

Peak sales identification

Customer engagement analysis

Product revenue contribution analysis

---

## Product Company Style SQL Problems

The project also includes SQL problems similar to those asked in:

Amazon

Flipkart

Walmart

Uber

Swiggy

Meesho

Microsoft

Google

Problem types include:

Top N per group

Nth highest value

Running totals

Session analysis

Revenue contribution %

Customer behaviour patterns

Ranking problems

---

## Project Structure

---

## How to Run This Project

### Step 1 Create Database

Run:

```sql
CREATE DATABASE ecommerce;

```
### Step 2 Select Database 
```sql
USE ecommerce;
```

### Step 3 Create Tables
```sql
schema/create_tables.sql
```

### Step 4 Insert Sample Data
```sql
data/sample_data.sql
```

### Step 5 Run Queries
Run files from:
```sql
queries/
```
### Step 6 Test Stored Procedures
```sql
procedures/stored_procedures.sql
```
### Step 7 Test View
```sql
views/sales_view.sql
```

### Step 8 Test Trigger
```sql
triggers/order_trigger.sql
```
### Step 9 Test Function
```sql
functions/customer_value_function.sql
```
### Step 10 Test Transaction
```sql
transactions/order_transaction.sql
```


