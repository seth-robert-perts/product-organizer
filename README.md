# product-organizer

## Summary
Created a web application that allows for different products (and their ingredients) to be added to a database and stored. Developed in python using the flask framework for defining the HTTP requests, and leveraging SQLAlchemy for storing products in a persistent database, the backend provides a RESTful (Representational State Transfer) API (Application Programming Interface) for a user interface to connect to. A frontend designed in VueJS was implemented to allow for user interfacing and was married up to the backend to create a full stack web application.

## How to Setup
### Create database for first time (required for persistent storage)
1. Clone down this repository
2. Open the file  `main.py`
3. Uncomment line 23, `#db.create_all()`
4. Save the file
5. Run `python3 main.py`
6. Now a file called `database.db` appears in the directory
7. Control^C the python program
8. Reopen `main.py`
9. Recomment the same line 23 of `main.py`
10. Save the file

## How to Run
### Docker (Recommended)
1. Clone down repository
2. Perform setup steps listed above if not already done so
3. Build the Dockerfile by executing the build docker bash script `./buildDocker.sh`
4. Wait until finished
5. Open the file `runDocker.sh`
6. Modify line 10 and set the src path to whatever path to the database.db that was created above `src=/home/ec2-user/product-organizer/database.db` <- Enter your absolute path here
7. Save the file
8. Start the container by executing the run docker bash script `./runDocker.sh`
NOTE! The path must be set prior to starting the container otherwise the database will work correctly

## How to view the web application
1. Open a browser (please not Edge)
2. Navigate to `localhost:8080` in the URL bar
3. The application should be running!
4. Preexisting products will be shown automatically on the home page
5. Products can be created/modified by clicking the button 'Create/Update' and filling out the form

Enjoy


