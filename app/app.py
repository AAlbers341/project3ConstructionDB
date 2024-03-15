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
database = "Construction_DB"

engine = create_engine(f"postgresql://{user}:{password}@{host}:{port}/{database}")


# reflect an existing database into a new model
Base = automap_base()

# reflect the tables
Base.prepare(autoload_with=engine)

# Save references to each table
estimateitems = Base.classes.EstimateItems
laborgroups = Base.classes.LaborGroups
shapes = Base.classes.Shapes
estimates = Base.classes.Estimates
sizes = Base.classes.Sizes
laborrates = Base.classes.LaborRates
grades = Base.classes.Grades

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



# @app.route("/api/v1.0/sizes")
# def sizes():
#     # Fetch results from sizes table
#     session = Session(engine)

#     count = session.query(func.count(sizes)).scalar()

#     print("Number of records in Sizes table:", count)

# session.close()



# @app.route

# @app.route

# @app.route

# @app.route



if __name__ == "__main__":
    app.run(debug=True)