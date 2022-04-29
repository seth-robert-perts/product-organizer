#!/bin/bash

docker rm -f server
docker rmi product-organizer

docker build -t product-organizer .

docker run --name server --network=host -p 5000:5000 --mount type=bind,src=/home/ec2-user/product-organizer/database.db,dst=/opt/app/database.db product-organizer

#docker rmi product-organizer

docker ps -a
docker images   