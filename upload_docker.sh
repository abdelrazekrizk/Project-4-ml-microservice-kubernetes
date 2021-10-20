#!/usr/bin/env bash
# This file tags and uploads an image to Docker Hub

# Assumes that an image is built via `run_docker.sh`

# Step 1:
# Create dockerpath
# dockerpath=<your docker ID/path>
dockerpath="abdelrazekrizk/flask_prediction"

# Step 2:  
# Authenticate & tag
#docker tag local-image:tagname new-repo:tagname
docker login -u abdelrazekrizk
echo "Docker ID and Image: $dockerpath"

# Step 3:
# Push image to a docker repository
docker image push $dockerpath