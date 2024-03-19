# Import the dependencies.
import sqlalchemy
from sqlalchemy.ext.automap import automap_base
from sqlalchemy.orm import Session
from sqlalchemy import create_engine, func
import psycopg2
from datetime import datetime


from flask import Flask, jsonify, render_template


#################################################
# Database Setup
#################################################

# Create an engine
user = "postgres"
password = "postgres"
host = "localhost"
port = "5432"
database = "prj3_construction_db"
schema = "OrderedTables"

engine = create_engine(f"postgresql://{user}:{password}@{host}:{port}/{database}")

# reflect an existing database into a new model
Base = automap_base()

# reflect the tables
Base.prepare(autoload_with=engine, schema=schema)

# Save references to each table
estimateitems = Base.classes['07_EstimateItems']
laborgroups = Base.classes['05_LaborGroups']
shapes = Base.classes['01_Shapes']
estimates = Base.classes['06_Estimates']
sizes = Base.classes['02_Sizes']
laborrates = Base.classes['04_LaborRates']
grades = Base.classes['03_Grades']
estimateitemlabor = Base.classes['08_EstimateItemLabor']

# Create session to the DB
session = Session(engine)

#################################################
# Flask Setup
#################################################
app = Flask(__name__)


#################################################
# Flask Routes
#################################################


@app.route("/")
def home():
    return render_template("index.html")


@app.route("/api/v1.0/labor_group_summary")
def labor_group_summary():
    # summary of Labor Groups, work in minutes and hours, % differences

    # query the database
    query_result = session.query(

        # select columns
        laborgroups.LaborGroupID,
        laborgroups.Description,
        func.sum(estimateitemlabor.ManHours),
        laborrates.LaborRate

        # join tables
    ).join(estimateitemlabor, laborgroups.LaborGroupID == estimateitemlabor.LaborGroupID) \
     .join(laborrates, laborgroups.LaborRateID == laborrates.LaborRateID) \
     .group_by(laborgroups.LaborGroupID, laborgroups.Description, laborrates.LaborRate).all()

    # total ManHours from the laborgroups table
    total_man_hours = session.query(func.sum(estimateitemlabor.ManHours)).scalar()

    # convert query result into JSON format
    summary_data = [
        {
            "LaborGroupID": round(row[0],0),
            "Description": row[1],
            "LaborRate ($)": row[3],
            "Work (minutes)": (row[2] * 60), # convert hours to minutes
            "Work (hours)": row[2],
            "% Diff (hours)": round((row[2] / total_man_hours) * 100, 2) # % Diff for each labourgroup
        } for row in query_result
    ]

    # Return the JSON data
    return jsonify(summary_data)

# close session with database
session.close()


@app.route("/api/v1.0/material_summary")
def material_summary():

    # Create session to the DB
    session = Session(engine)

    # query the database
    query_result = session.query(

        # select columns
        estimateitemlabor.LaborGroupID,
        estimateitems.EstimateID,
        estimateitems.MaterialCostDate,
        estimateitems.Page,
        estimateitems.Quantity,
        estimateitems.Weight,
        estimateitems.MaterialCost

        # join tables
    ).join(estimateitems, estimateitemlabor.EstimateItemID == estimateitems.EstimateItemID).all()

    # convert query result into JSON format
    summary_data = [
        {
            "Labor Group ID": round(row[0], 0),
            "Estimate ID": round(row[1], 0),
            "Material Cost Date": row[2],
            "Structure Type": row[3],
            "Quantity": round(row[4], 0),
            "Weight (lb)": row[5],
            "Material Cost ($)": round(row[6], 2)
        } for row in query_result
    ]

    # return the JSON data
    return jsonify(summary_data)

# close session with database
session.close()


@app.route("/api/v1.0/paint_labor")
def page_summary():

    # Create session to the DB
    session = Session(engine)

    # Query the database
    query_result = session.query(
        laborgroups.Description,
        estimateitemlabor.ManHours,
        estimateitems.SurfaceArea,
        estimateitems.Finish
    ).join(estimateitemlabor, laborgroups.LaborGroupID == estimateitemlabor.LaborGroupID)\
     .join(estimateitems, estimateitemlabor.EstimateItemID == estimateitems.EstimateItemID)\
     .filter(laborgroups.Description == "Paint Labor").all()

    # Close session with database
    session.close()

    # Convert query result into JSON format
    summary_data = [
        {
            "Description": row[0],
            "ManHours": row[1],
            "SurfaceArea": row[2],
            "Finish": row[3]
        } for row in query_result
    ]

    # Return the JSON data
    return jsonify(summary_data)


if __name__ == "__main__":
    app.run(debug=True)