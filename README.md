# Structural Steel Fabrication Estimation DB

## Purpose
The Structural Steel Fabrication Estimation DB enhances the bid-winning process for businesses relying on project bids. By analyzing past estimating data, this tool aims to improve win percentages and overall profitability. It extracts data from estimating software, transforms it into easily readable information, and provides quick verification of estimate accuracy.

## Key Objectives
- Extract, Transform, and Load steel fabrication data.
- Create an Entity Relationship Diagram from cleaned CSV files.
- Develop a SQL table schema for loading data into PostgreSQL.
- Utilize Flask to create API routes.
- Enhance the user interface with event handling using jQuery in the Flask app.

## Table of Contents
1. [Tech Stack](#tech-stack)
2. [Data Sources](#data-sources)
3. [PostgreSQL](#postgresql)
4. [ERD](#erd)
5. [Table Schema](#table-schema)
6. [Flask App](#flask-app)
7. [References](#references)
8. [Data Ethics](#data-ethics)

---

## Tech Stack
- Pandas
- SQLAlchemy
- Psycopg2
- PostgreSQL
- jQuery 

## Data Sources
- [Estimate Item Labor Groups](https://github.com/AAlbers341/project3ConstructionDB/blob/main/data/cleaned/estimateitemlaborgroups.csv)
  - Labor hours for each labor group.
- [Estimate Items](https://github.com/AAlbers341/project3ConstructionDB/blob/main/data/cleaned/estimateitems.csv)
  - Describes each meterial selected for each part. 
- [Estimates](https://github.com/AAlbers341/project3ConstructionDB/blob/main/data/cleaned/estimates.csv)
  - Describes information identifying the estimate such as jobname, estimate ID, customer etc.
- [Grades](https://github.com/AAlbers341/project3ConstructionDB/blob/main/data/cleaned/grades.csv)
  - Describes the types of grades for all material shapes and sizes used within the estimate.
- [Labor Groups](https://github.com/AAlbers341/project3ConstructionDB/blob/main/data/cleaned/laborgroups.csv)
  - Describes the type of Labor Group and ID indicator.
- [Labor Rates](https://github.com/AAlbers341/project3ConstructionDB/blob/main/data/cleaned/laborrates.csv)
  - Describes the cost for each labor group. 
- [Shapes](https://github.com/AAlbers341/project3ConstructionDB/blob/main/data/cleaned/shapes.csv)
  - Describes the material shape.
- [Sizes](https://github.com/AAlbers341/project3ConstructionDB/blob/main/data/cleaned/sizes.csv)
  - Describes the size of the material.

## PostgreSQL
PostgreSQL was selected for its inherent flexibility and support for predefined schemas, enabling seamless integration and execution across multiple tables. This strategic choice facilitates efficient data management and analysis, allowing for complex operations such as joins and queries to be performed with precision and reliability.

## ERD
![ERD Diagram](https://github.com/AAlbers341/project3ConstructionDB/assets/149892097/ccaa9350-76e1-4aae-9716-e0cd703855b4)

## Table Schema
- [Link to table schema for table and data upload](https://github.com/AAlbers341/project3ConstructionDB/blob/main/ERD/CleanedData_ERD_Diagram.png)

## Flask App

### Available Routes:

- **Labor Group Summary JSON Data**: Provides a summary of labor groups involved in shop processes. Includes labor rates, hours worked, and percentage difference.
  
- **Material Summary JSON Data**: Details materials used in projects, including cost, quantity, weight, and identifiers for tracking.
  
- **Paint Labor JSON Data**: Presents information on paint labor, including description, finish type, labor hours, and surface area.

## References
1. **Development with Flask, SQLAlchemy, and psycopg2**
   
   - [SQLAlchemy 2.0 Documentation](https://docs.sqlalchemy.org/en/20/)
   - [Psycopg 2.9.9 documentation](https://www.psycopg.org/docs/)

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

## Data Ethics
In the realm of data ethics, securing consent before utilizing financial data is paramount. In the case of HME, Inc, gaining explicit consent from stakeholders ensures transparency and upholds principles of data privacy and integrity. By obtaining consent, HME, Inc demonstrates respect for individuals' autonomy over their data, fostering trust and accountability. This practice not only aligns with legal regulations such as GDPR but also reflects ethical responsibility towards data subjects. Moreover, informed consent empowers stakeholders by providing them with agency over how their financial data is used, promoting a culture of ethical data governance within Bubblebee and safeguarding against potential misuse or exploitation of sensitive information.
