#!/usr/bin/env bash

# This tags and uploads an image to Docker Hub

# Step 1:
# This is your Docker ID/path
# dockerpath=<>
dockerpath="abdelrazekrizk/flask_prediction"

# Step 2
# Run the Docker Hub container with kubernetes
kubectl run flaskpredictiondemo \
--image=$dockerpath \
--generator=run-pod/v1 \
--labels="app=flaskpredictiondemo,env=prod" \
--env="DNS_DOMAIN=cluster" \
--env="POD_NAMESPACE=default" \
--port=80

# Step 3:
# List kubernetes pods
kubectl get pods --sort-by='.status.containerStatuses[0].restartCount'

# Step 4:
# Forward the container port to a host
kubectl port-forward service/flaskpredictiondemo 80:8080

# Step 4:
# dump pod logs, with label name=myLabel (stdout)
#kubectl: export pod logs to file
kubectl logs -l name=flaskpredictiondemo > ./log/flask_prediction_pod.log