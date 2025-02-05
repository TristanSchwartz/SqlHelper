# 📌 SQL Solutions Repository
*A collection of SQL solutions for common problems, including parsing JSON, time conversions, data transformations, and more.*

## 📖 About This Repository  
This repository contains **practical SQL solutions** for a variety of real-world problems. Each solution includes:  
- A **detailed SQL query**  
- An **explanation of the approach**  
- **Edge case handling**  
- **Best practices** for optimization  

The goal is to build a **useful reference for SQL developers**, whether you're working with **PostgreSQL, MySQL, SQL Server, or other relational databases**.

---

## 🚀 Current Solutions  

### 1️⃣ ISO 8601 Duration Parsing (`PT` Time Format to Seconds)  
📌 **Problem:** Converting time durations stored in **ISO 8601 PT format** (e.g., `PT1H30M15S`) into **total seconds**.  
✅ **Solution:** Extracts hours, minutes, and seconds using `CHARINDEX()` and `SUBSTRING()` functions.  
🔗 **File:** [`convert_pt_time_to_seconds.sql`](./solutions/convert_pt_time_to_seconds.sql)  

### 2️⃣ Extracting JSON Data in SQL (Coming Soon!)  
📌 **Problem:** Handling nested JSON data in SQL databases.  
✅ **Solution:** Using `OPENJSON()` (SQL Server) and `json_extract()` (MySQL/PostgreSQL) to parse and extract data.  
🔗 **File:** *Coming soon!*  

---

## 📂 Repository Structure  
