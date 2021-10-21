#!/usr/bin/env bash

# This tags and uploads an image to Docker Hub

# Step 1:
# This is your Docker ID/path
# dockerpath=<>
dockerpath="abdelrazekrizk/flask_prediction"

# Step 2
# Run the Docker Hub container with kubernetes
kubectl run flaskprediction \
    --image=$dockerpath \
    --port=8080
# Step 3
# #Creating a service Expose the kubectl pod container port=80 ,port=8080
kubectl expose pod flaskprediction \
--port=80 \
--port=8080 \
--name=flaskapp

# Step 4
# Wait until your pod is running, check for "condition=ready"
kubectl wait --for=condition=Ready pod/flaskprediction

# Step 5:
# List kubernetes pods
kubectl get pods --sort-by='.status.containerStatuses[0].restartCount'

# Step 6:
# dump pod logs, with label name=myLabel (stdout)
#kubectl: export pod logs to file
kubectl logs pod/flaskprediction

# Step 7:
# Forward the container port to a host
kubectl port-forward pod/flaskprediction 8080