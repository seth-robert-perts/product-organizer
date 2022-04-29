#!/bin/bash 

# Delete old container if it exists
docker rm -f server

# Run the following docker command to run the web application
#   NOTE!!!!!!!!
#   The bind mount depends upon the database.db being in the correct location
#   Ensure that database.db exists before running the docker container otherwise there will be no data saved between runs
docker run --name server --network=host -p 3000:3000 --mount type=bind,src=/home/ec2-user/product-organizer/database.db,dst=/opt/app/database.db product-organizer

# Print out the current containers and images on the system
docker ps -a
docker images   