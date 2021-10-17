#!/usr/bin/env bash

## Complete the following steps to get Docker running locally

# Step 1:
# Build image and add a descriptive tag
docker build . -t flask_prediction:version1.0

# Step 2:
#Tag image
#docker tag flask_prediction:latest flask_prediction:version1.0

# Step 3: 
# List docker images
docker images 

# Step 4: 
# Run flask app
docker run -p 127.0.0.1:80:8080/tcp flask_prediction
