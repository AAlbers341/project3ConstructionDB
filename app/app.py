# Import the dependencies.
import sqlalchemy
from sqlalchemy.ext.automap import automap_base
from sqlalchemy.orm import Session
from sqlalchemy import create_engine, func
import psycopg2


from flask import Flask, jsonify


#################################################
# Database Setup
#################################################

# Create an engine
user = "postgres"
password = "postgres"
host = "localhost"
port = "5432"
database = "prj3_construction_db"
schema= "OrderedTables"

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

# Create session (link) from Python to the DB
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
    return (
        f"Welcome to the API"
    )



@app.route("/api/v1.0/sizes")
def sizes_route():
    # Fetch results from sizes table
    count = session.query(func.count(sizes)).scalar()
    session.close()
    return f"Number of records in Sizes table: {count}"



# @app.route

# @app.route

# @app.route

# @app.route



if __name__ == "__main__":
    app.run(debug=True)