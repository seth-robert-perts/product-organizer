#!/bin/bash 

# Delete old container if it exists
docker rm -f server

# Run the following docker command to run the web application
docker run --name server --network=host -p 3000:3000 --mount type=bind,src=/home/ec2-user/product-organizer/database.db,dst=/opt/app/database.db product-organizer

# Print out the current containers and images on the system
docker ps -a
docker images   