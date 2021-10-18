#!/usr/bin/env bash

# This tags and uploads an image to Docker Hub

# Step 1:
# This is your Docker ID/path
# dockerpath=<>
dockerpath="abdelrazekrizk/flask_prediction:version1.0"

# Step 2
# Run the Docker Hub container with kubernetes
kubectl run flask_prediction \
--image=$dockerpath \
--labels="app=flask_prediction:version1.0,env=prod" \
--env="DNS_DOMAIN=cluster" \
--env="POD_NAMESPACE=default" \
--port=80

# Step 3:
# List kubernetes pods
kubectl get pods --sort-by='.status.containerStatuses[0].restartCount'

# Step 4:
# Forward the container port to a host
kubectl port-forward service/flask_prediction:version1.0 80:8080

# Step 4:
# dump pod logs, with label name=myLabel (stdout)
#kubectl: export pod logs to file
kubectl logs -l name=flask_prediction:version1.0 > /work/Project-4-ml-microservice-kubernetes/log/flask_prediction_pod.log
