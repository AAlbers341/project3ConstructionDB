# Structural Steel Fabrication Estimation DB

## Purpose
The Structural Steel Fabrication Estimation DB is designed to enhance the bid-winning process for businesses relying on project bids. By analyzing past estimating data, this tool aims to improve win percentages and overall profitability. It extracts data from estimating software, transforms it into easily readable information, and provides quick verification of estimate accuracy.

## Key Objectives
- Extract, Transform, and Load steel fabrication data
- Create an Entity Relationship Diagram from cleaned CSV files
- Develop a SQL table schema for loading data into PostgreSQL
- Utilize Flask to create API routes
- Enhance user interface with event handling using jQuery in the Flask app

## Table of Contents
1. [Tech Stack](#tech-stack)
2. [Data Sources](#data-sources)
3. [PostgreSQL](#postgresql)
4. [ERD](#erd)
5. [Table Schema](#table-schema)
6. [Flask App](#flask-app)
7. [References](#references)

---

## Tech Stack
- Pandas
- SQLAlchemy
- Autobase_map
- Session
- Func
- Create_engine
- Psycopg2
- PostgreSQL
- jQuery 
- AJAX

## Data Sources
- Estimate Item Labor Groups
- Estimate Items
- Estimates
- Grades
- Labor Groups
- Labor Rates
- Shapes
- Sizes

## PostgreSQL
[Link to PostgreSQL Documentation](https://www.postgresql.org/docs/)

## ERD
[Insert link to ERD]

## Table Schema
[Insert table schema here]

## Flask App

### Available Routes:

- **Labor Group Summary JSON Data**: Provides a summary of labor groups involved in shop processes. Includes labor rates, hours worked, and percentage difference.
  
- **Material Summary JSON Data**: Details materials used in projects, including cost, quantity, weight, and identifiers for tracking.
  
- **Paint Labor JSON Data**: Presents information on paint labor, including description, finish type, labor hours, and surface area.

## References
1. **Development with Flask, SQLAlchemy, and psycopg2**
   
   **Using SQLAlchemy:**
   [SQLAlchemy 2.0 Documentation](https://docs.sqlalchemy.org/en/20/)
   
   **Using psycopg2:**
   [Psycopg 2.9.9 documentation](https://www.psycopg.org/docs/)

2. **JavaScript and jQuery**

   - **AJAX Requests**: Script listens for clicks on summary links and makes AJAX GET requests to Flask API routes.
   
   - **Data Display**: Fetched JSON data is formatted and displayed within the `#jsonOutput` div.

3. **Interacting with the Front-end API**

   Users can interact with the API by clicking on the provided links in the web interface. Each link triggers an AJAX request to the corresponding Flask API endpoint, dynamically fetching and displaying the summary data.
## Links
   - [SQLAlchemy 2.0.28](https://pypi.org/project/SQLAlchemy/)
   - [Flask-SQLAlchemy](https://flask-sqlalchemy.palletsprojects.com/en/3.1.x/)
   - [SQLAlchemy](https://www.sqlalchemy.org/)
   - [psycopg2 2.9.9](https://pypi.org/project/psycopg2/)
