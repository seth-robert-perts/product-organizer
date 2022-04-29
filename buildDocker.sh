#!/bin/bash

# Remove old containers and images (this was more for my sanity during testing)
docker rm -f server
docker rmi -f product-organizer

# Build from GitHub repo containing all files
docker build -t product-organizer https://github.com/seth-robert-perts/product-organizer.git#main