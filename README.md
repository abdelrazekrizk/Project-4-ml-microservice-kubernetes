<include a CircleCI status badge, here>

## Project Overview

In this project, you will apply the skills you have acquired in this course to operationalize a Machine Learning Microservice API. 

You are given a pre-trained, `sklearn` model that has been trained to predict housing prices in Boston according to several features, such as average rooms in a home and data about highway access, teacher-to-pupil ratios, and so on. You can read more about the data, which was initially taken from Kaggle, on [the data source site](https://www.kaggle.com/c/boston-housing). This project tests your ability to operationalize a Python flask app—in a provided file, `app.py`—that serves out predictions (inference) about housing prices through API calls. This project could be extended to any pre-trained machine learning model, such as those for image recognition and data labeling.

### Project Tasks

Your project goal is to operationalize this working, machine learning microservice using [kubernetes](https://kubernetes.io/), which is an open-source system for automating the management of containerized applications. In this project you will:
* Test your project code using linting
* Complete a Dockerfile to containerize this application
* Deploy your containerized application using Docker and make a prediction
* Improve the log statements in the source code for this application
* Configure Kubernetes and create a Kubernetes cluster
* Deploy a container using Kubernetes and make a prediction
* Upload a complete Github repo with CircleCI to indicate that your code has been tested

You can find a detailed [project rubric, here](https://review.udacity.com/#!/rubrics/2576/view).

**The final implementation of the project will showcase your abilities to operationalize production microservices.**
---
# Setup Instance Ubuntu Server 20.04 LTS (HVM), SSD Volume Type

 - using Instance type 
 - m5.xlarge 
 - 4 CPUs 
 - 16 GB memory
 - ami-09e67e426f25ce0d7

* Create a Public/Private Key Pair

ssh-keygen -t rsa

* Add Public/Private Key Pair to github

## Setup the Environment

* using Miniconda is a free minimal installer for conda. It is a small, bootstrap version of Anaconda

https://docs.conda.io/en/latest/miniconda.html#linux-installers

https://conda.io/projects/conda/en/latest/user-guide/install/linux.html

* Download Latest Miniconda Installer Links for Linux installers

wget https://repo.anaconda.com/miniconda/Miniconda3-py39_4.10.3-Linux-x86_64.sh
 
 * Installing on Linux

bash Miniconda3-py39_4.10.3-Linux-x86_64.sh

. .bashrc 

conda config --set auto_activate_base false

* Create a virtualenv and activate it

conda create --name .devops Python=3.6.9

conda activate .devops

* Run `make install` to install the necessary dependencies
* install make

sudo apt install make

* Verify make version

make --version

make install

conda list

### Running `app.py`

1. Standalone:  `python app.py`
2. Run in Docker:  `./run_docker.sh`
3. Run in Kubernetes:  `./run_kubernetes.sh`

### Kubernetes Steps

* Setup and Configure Docker locally

#### Install Docker Engine on Ubuntu

https://docs.docker.com/engine/install/ubuntu/

* update instance

sudo apt update
sudo apt upgrade -y

* Update the apt package

sudo apt-get install \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg \
    lsb-release
* Add Docker’s official GPG key:
 curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg

* Use the following command to set up the stable repository
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
  
* Install Docker Engine

sudo apt-get update
sudo apt-get install docker-ce docker-ce-cli containerd.io

* Verify Docker version
docker version

* Create Flask app Docker Images

./run_docker.sh


* Setup and Configure Kubernetes locally

# Installing kubectl

https://docs.aws.amazon.com/eks/latest/userguide/install-kubectl.html

* Download the Amazon EKS vended kubectl binary for your cluster's Kubernetes version from Amazon S3
* Kubernetes 1.21:

curl -o kubectl https://amazon-eks.s3.us-west-2.amazonaws.com/1.21.2/2021-07-05/bin/linux/amd64/kubectl

* Verify the downloaded binary with the SHA-256 sum for your binary. 

openssl sha1 -sha256 kubectl

* Apply execute permissions to the binary.

chmod +x ./kubectl

* Copy the binary to a folder in your PATH. If you have already installed a version of kubectl

mkdir -p $HOME/bin && cp ./kubectl $HOME/bin/kubectl && export PATH=$PATH:$HOME/bin

*  Add the $HOME/bin path to your shell initialization file

echo 'export PATH=$PATH:$HOME/bin' >> ~/.bashrc

* Verify kubectl version

kubectl version --short --client

* Create Flask app in Container

* Run via kubectl

./run_kubernetes.sh

