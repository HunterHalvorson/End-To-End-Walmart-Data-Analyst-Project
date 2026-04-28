# 🛒 Walmart Data Analysis Project (SQL + Python + PostgreSQL)

## 📌 Overview
This project explores Walmart sales data using Python for data cleaning and PostgreSQL for SQL-based analysis. The goal is to uncover business insights such as payment trends, customer ratings, sales performance, and profitability.

---

## 🧰 Tech Stack
- Python (Pandas, SQLAlchemy, psycopg2)
- PostgreSQL
- SQL (CTEs, Window Functions, Aggregations)
- Jupyter Notebook / VSCode
- dotenv (for secure environment variables)

---

## 📂 Dataset
The dataset contains Walmart transaction-level sales data including:
- Branch
- City
- Category
- Unit Price
- Quantity
- Payment Method
- Rating
- Date

---

## ⚙️ Setup Instructions

### 1. Clone the repository
git clone <repo-url>
cd <repo-folder>

### 2. Create virtual environment
python -m venv my_env
source my_env/bin/activate   # Mac/Linux
my_env\Scripts\activate      # Windows

### 3. Install dependencies
pip install -r requirements.txt

### 4. Create `.env` file
Create a `.env` file in the root directory:

DB_USER=postgres  
DB_PASSWORD=your_password  
DB_HOST=localhost  
DB_PORT=5432  
DB_NAME=walmart_db  

### 5. Run the project
- Run the Python script / notebook to clean and load data
- Execute SQL queries in PostgreSQL / pgAdmin

---

## 🧹 Data Cleaning (Python)
- Removed duplicates
- Handled missing values
- Converted `unit_price` to numeric
- Created `total = unit_price * quantity`
- Standardized column names
- Exported cleaned dataset

---

## 🗄️ Database Loading
Data is loaded into PostgreSQL using:

df.to_sql(name="walmart", con=engine_psql, if_exists='append', index=False)

Environment variables are securely managed using `dotenv`.

---

## 📊 SQL Analysis Performed

### 1. Payment Method Analysis
- Number of transactions per payment method
- Total quantity sold per payment method

### 2. Branch Performance
- Highest rated category per branch

### 3. Time Analysis
- Busiest day of the week per branch

### 4. Product Performance
- Quantity sold by payment method
- Category-wise revenue and profit

### 5. Customer Ratings
- Average, minimum, and maximum ratings per city

### 6. Profit Analysis
- Total profit per category

### 7. Popular Payment Method
- Most common payment method per branch (using window functions)

---

## 🔐 Security Note
Do NOT push the following to GitHub:
- `.env`
- `my_env/`
- Any database credentials

These should be ignored using `.gitignore`.

---

## 📈 Key Skills Demonstrated
- Data cleaning with Pandas
- SQL aggregation & window functions
- PostgreSQL integration with Python
- Environment variable security
- Business data analysis

---

## 🚀 Future Improvements
- Add dashboards (Power BI / Tableau)
- Automate ETL pipeline
- Add visualizations in Python (Matplotlib/Seaborn)
- Deploy as a web app (Flask / FastAPI)

---

## 👤 Author
Hunter Halvorson