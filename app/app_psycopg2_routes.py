import psycopg2
from flask import Flask, jsonify, render_template

#################################################
# Database Setup
#################################################

# Define a function to establish a database connection using psycopg2
def get_db_connection():
    conn = psycopg2.connect(
        dbname='prj3_construction_db',  
        user='postgres',                
        password='postgres',            
        host='localhost',               
        port='5432'                     
    )
    return conn  # Return connection object

#################################################
# Flask Setup
#################################################

app = Flask(__name__)

#################################################
# Flask Routes
#################################################

# Define the route for home page
@app.route("/")
def home():
    # Serve 'index.html' template to client
    return render_template("index.html")

# Define route for retrieving labor group summary information
@app.route("/api/v1.0/labor_group_summary")
def labor_group_summary():
    conn = get_db_connection()  # Establish connection to the database
    cursor = conn.cursor()  # Create cursor object to execute database commands

    # calculate total man-hours across all entries
    cursor.execute("""
        SELECT SUM(el."ManHours")
        FROM "OrderedTables"."07_EstimateItems" ei
        JOIN "OrderedTables"."08_EstimateItemLabor" el ON ei."EstimateItemID" = el."EstimateItemID";
    """)
    total_man_hours_result = cursor.fetchone()  # Retrieve result of the query
    total_man_hours = total_man_hours_result[0] if total_man_hours_result else 0  # Extract total man-hours or default to 0

    # execute SQL query to retrieve labor group summary information
    cursor.execute("""
        SELECT lg."LaborGroupID", lg."Description", SUM(el."ManHours") AS "TotalManHours", lr."LaborRate"
        FROM "OrderedTables"."07_EstimateItems" ei
        JOIN "OrderedTables"."08_EstimateItemLabor" el ON ei."EstimateItemID" = el."EstimateItemID"
        JOIN "OrderedTables"."05_LaborGroups" lg ON el."LaborGroupID" = lg."LaborGroupID"
        JOIN "OrderedTables"."04_LaborRates" lr ON lg."LaborRateID" = lr."LaborRateID"
        GROUP BY lg."LaborGroupID", lg."Description", lr."LaborRate";
    """)
    rows = cursor.fetchall()  # Fetch all rows from executed query

    # Transform query results into a list of dictionaries for JSON serialization
    summary_data = [{
            "LaborGroupID": str(round(row[0], 0)),  # Convert LaborGroupID to string after rounding
            "Description": row[1],
            "LaborRate ($)": row[3],
            "Work (minutes)": round(row[2] * 60, 2),  # Convert hours to minutes
            "Work (hours)": row[2],
            "% Diff (hours)": round((row[2] / total_man_hours) * 100, 2) if total_man_hours else 0  # Calculate percentage difference if total is not zero
    } for row in rows]

    cursor.close()  # Close cursor after use
    conn.close()    # Close database connection after use
    return jsonify(summary_data)  # Return data as a JSON response

# Define route for retrieving material summary information
@app.route("/api/v1.0/material_summary")
def material_summary():
    conn = get_db_connection()  # Connect to database
    cursor = conn.cursor()  # Create new cursor
    # Execute SQL query to retrieve material summary information
    cursor.execute("""
        SELECT el."LaborGroupID", ei."EstimateID", ei."MaterialCostDate", ei."Page", 
               ei."Quantity", ei."Weight", ei."MaterialCost"
        FROM "OrderedTables"."08_EstimateItemLabor" el
        JOIN "OrderedTables"."07_EstimateItems" ei ON el."EstimateItemID" = ei."EstimateItemID";
    """)
    rows = cursor.fetchall()  # Retrieve all rows from query
    # Map query results to a list of dictionaries for JSON output
    summary_data = [{
            "Labor Group ID": round(row[0], 0),
            "Estimate ID": round(row[1], 0),
            "Material Cost Date": row[2],
            "Page": row[3],
            "Quantity": round(row[4], 0),
            "Weight (lb)": row[5],
            "Material Cost ($)": round(row[6], 2)
    } for row in rows]
    cursor.close()  # Close cursor after use
    conn.close()    # Disconnect from database
    return jsonify(summary_data)  # Serialize data to JSON and return as response

# Define route for retrieving paint labor information
@app.route("/api/v1.0/paint_labor")
def paint_labor():
    conn = get_db_connection()  # Establish database connection
    cursor = conn.cursor()  # Create cursor for database operations
    # Perform SQL query to fetch paint labor information
    cursor.execute("""
        SELECT lg."Description", el."ManHours", ei."SurfaceArea", ei."Finish"
        FROM "OrderedTables"."05_LaborGroups" lg
        JOIN "OrderedTables"."08_EstimateItemLabor" el ON lg."LaborGroupID" = el."LaborGroupID"
        JOIN "OrderedTables"."07_EstimateItems" ei ON el."EstimateItemID" = ei."EstimateItemID"
        WHERE lg."Description" = 'Paint Labor';
    """)
    rows = cursor.fetchall()  # Fetch all results of query
    # Prepare data fetched from database for JSON serialization
    summary_data = [{
            "Description": row[0],
            "ManHours": row[1],
            "SurfaceArea": row[2],
            "Finish": row[3]
    } for row in rows]
    cursor.close()  # Close database cursor
    conn.close()    # Close database connection
    return jsonify(summary_data)  # Return data as a JSON response

# Check if script is being run directly and not imported, start Flask application
if __name__ == "__main__":
    app.run(debug=True)  # Enable debug mode for the Flask application