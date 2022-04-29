#!/bin/bash
  
# Turn on bash's job control
set -m
  
# Start the backend REST API
python3 main.py &
  
# Start the front end
serve ./frontend/dist
  
  
# now we bring the primary process back into the foreground
# and leave it there
fg %1