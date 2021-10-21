# Project-4-ml-microservice-kubernetes

[![CircleCI](https://circleci.com/gh/abdelrazekrizk/Project-4-ml-microservice-kubernetes/tree/main.svg?style=svg)](https://circleci.com/gh/abdelrazekrizk/Project-4-ml-microservice-kubernetes/tree/main)

# Project Overview

In this project, you will apply the skills you have acquired in this course to operationalize a Machine Learning Microservice API.

You are given a pre-trained, `sklearn` model that has been trained to predict housing prices in Boston according to several features, such as average rooms in a home and data about highway access, teacher-to-pupil ratios, and so on. You can read more about the data, which was initially taken from Kaggle, on [the data source site](https://www.kaggle.com/c/boston-housing). This project tests your ability to operationalize a Python flask app—in a provided file, `app.py`—that serves out predictions (inference) about housing prices through API calls. This project could be extended to any pre-trained machine learning model, such as those for image recognition and data labeling.

## Project Tasks

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
 - m5.2xlarge
 - 8 CPUs
 - 32 GB memory
 - ami-0747bdcabd34c712a

* Create a Public/Private Key Pair:

          ssh-keygen -t rsa

* Add Public/Private Key Pair to github:

# Setup the Environment
## Setup using python3-venv

          sudo apt-get install python3-venv

                Reading package lists... Done
                Building dependency tree
                Reading state information... Done
                The following additional packages will be installed:
                python-pip-whl python3-distutils python3-lib2to3 python3.6-venv
                The following NEW packages will be installed:
                python-pip-whl python3-distutils python3-lib2to3 python3-venv python3.6-venv
                0 upgraded, 5 newly installed, 0 to remove and 0 not upgraded.
                Need to get 1882 kB of archives.
                After this operation, 5044 kB of additional disk space will be used.
                Do you want to continue? [Y/n] y
                Get:1 http://us-east-1.ec2.archive.ubuntu.com/ubuntu bionic-updates/universe amd64 python-pip-whl all 9.0.1-2.3~ubuntu1.18.04.5 [1653 kB]
                Get:2 http://us-east-1.ec2.archive.ubuntu.com/ubuntu bionic-updates/main amd64 python3-lib2to3 all 3.6.9-1~18.04 [77.4 kB]
                Get:3 http://us-east-1.ec2.archive.ubuntu.com/ubuntu bionic-updates/main amd64 python3-distutils all 3.6.9-1~18.04 [144 kB]
                Get:4 http://us-east-1.ec2.archive.ubuntu.com/ubuntu bionic-updates/universe amd64 python3.6-venv amd64 3.6.9-1~18.04ubuntu1.4 [6188 B]
                Get:5 http://us-east-1.ec2.archive.ubuntu.com/ubuntu bionic-updates/universe amd64 python3-venv amd64 3.6.7-1~18.04 [1208 B]
                Fetched 1882 kB in 0s (32.4 MB/s)
                Selecting previously unselected package python-pip-whl.
                (Reading database ... 85429 files and directories currently installed.)
                Preparing to unpack .../python-pip-whl_9.0.1-2.3~ubuntu1.18.04.5_all.deb ...
                Unpacking python-pip-whl (9.0.1-2.3~ubuntu1.18.04.5) ...
                Selecting previously unselected package python3-lib2to3.
                Preparing to unpack .../python3-lib2to3_3.6.9-1~18.04_all.deb ...
                Unpacking python3-lib2to3 (3.6.9-1~18.04) ...
                Selecting previously unselected package python3-distutils.
                Preparing to unpack .../python3-distutils_3.6.9-1~18.04_all.deb ...
                Unpacking python3-distutils (3.6.9-1~18.04) ...
                Selecting previously unselected package python3.6-venv.
                Preparing to unpack .../python3.6-venv_3.6.9-1~18.04ubuntu1.4_amd64.deb ...
                Unpacking python3.6-venv (3.6.9-1~18.04ubuntu1.4) ...
                Selecting previously unselected package python3-venv.
                Preparing to unpack .../python3-venv_3.6.7-1~18.04_amd64.deb ...
                Unpacking python3-venv (3.6.7-1~18.04) ...
                Setting up python-pip-whl (9.0.1-2.3~ubuntu1.18.04.5) ...
                Setting up python3.6-venv (3.6.9-1~18.04ubuntu1.4) ...
                Setting up python3-lib2to3 (3.6.9-1~18.04) ...
                Setting up python3-distutils (3.6.9-1~18.04) ...
                Setting up python3-venv (3.6.7-1~18.04) ...
                Processing triggers for man-db (2.8.3-2ubuntu0.1) ...

## Setup using Miniconda is a free minimal installer for conda. It is a small, bootstrap version of Anaconda

https://docs.conda.io/en/latest/miniconda.html#linux-installers

https://conda.io/projects/conda/en/latest/user-guide/install/linux.html

* Download Latest Miniconda Installer Links for Linux installers:

          wget https://repo.anaconda.com/miniconda/Miniconda3-py39_4.10.3-Linux-x86_64.sh

 * Installing on Linux:

          bash Miniconda3-py39_4.10.3-Linux-x86_64.sh

          . .bashrc

          conda config --set auto_activate_base false

* Create a virtualenv and activate it:

          conda create --name .devops Python=3.6.9

          conda activate .devops

          conda list


* Run `make install` to install the necessary dependencies:
* install make:

          sudo apt install make

* Verify make version:

          make --version

         Output
         GNU Make 4.2.1
                Built for x86_64-pc-linux-gnu
                Copyright (C) 1988-2016 Free Software Foundation, Inc.
                License GPLv3+: GNU GPL version 3 or later <http://gnu.org/licenses/gpl.html>
                This is free software: you are free to change and redistribute it.
                There is NO WARRANTY, to the extent permitted by law.

* Install requirements

          make install

          conda list

        Output
         # packages in environment at /home/ubuntu/miniconda3/envs/.devops:
                # Name                    Version                   Build  Channel
                _libgcc_mutex             0.1                        main
                _openmp_mutex             4.5                       1_gnu
                astroid                   2.8.3                    pypi_0    pypi
                ca-certificates           2021.9.30            h06a4308_1
                certifi                   2021.5.30        py36h06a4308_0
                click                     7.0                      pypi_0    pypi
                curl2requests             1.2                      pypi_0    pypi
                flask                     1.0.2                    pypi_0    pypi
                isort                     5.9.3                    pypi_0    pypi
                itsdangerous              1.1.0                    pypi_0    pypi
                jinja2                    2.10.3                   pypi_0    pypi
                lazy-object-proxy         1.6.0                    pypi_0    pypi
                libedit                   3.1.20210714         h7f8727e_0
                libffi                    3.2.1             hf484d3e_1007
                libgcc-ng                 9.3.0               h5101ec6_17
                libgomp                   9.3.0               h5101ec6_17
                libstdcxx-ng              9.3.0               hd4cf53a_17
                markupsafe                1.1.1                    pypi_0    pypi
                mccabe                    0.6.1                    pypi_0    pypi
                ncurses                   6.2                  he6710b0_1
                numpy                     1.17.2                   pypi_0    pypi
                openssl                   1.1.1l               h7f8727e_0
                pandas                    0.24.2                   pypi_0    pypi
                pip                       21.3                     pypi_0    pypi
                platformdirs              2.4.0                    pypi_0    pypi
                pylint                    2.11.1                   pypi_0    pypi
                python                    3.6.9                h265db76_0
                python-dateutil           2.8.0                    pypi_0    pypi
                pytz                      2019.3                   pypi_0    pypi
                readline                  7.0                  h7b6447c_5
                scikit-learn              0.20.3                   pypi_0    pypi
                scipy                     1.3.1                    pypi_0    pypi
                setuptools                58.0.4           py36h06a4308_0
                six                       1.12.0                   pypi_0    pypi
                sqlite                    3.33.0               h62c20be_0
                tk                        8.6.11               h1ccaba5_0
                toml                      0.10.2                   pypi_0    pypi
                typed-ast                 1.4.3                    pypi_0    pypi
                typing-extensions         3.10.0.2                 pypi_0    pypi
                werkzeug                  0.16.0                   pypi_0    pypi
                wheel                     0.37.0             pyhd3eb1b0_1
                wrapt                     1.13.2                   pypi_0    pypi
                xz                        5.2.5                h7b6447c_0
                zlib                      1.2.11               h7b6447c_3


## Kubernetes Steps

* Setup and Configure Docker locally:

#### Install Docker Engine on Ubuntu

https://docs.docker.com/engine/install/ubuntu/

* update instance

          sudo apt update
          sudo apt upgrade -y

* Update the apt package:

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
                "deb [arch=(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
                (lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

* Install Docker Engine:

           sudo apt-get update
           sudo apt-get install docker-ce docker-ce-cli containerd.io

* Verify Docker version:

            docker version

            Output
            Client: Docker Engine - Community
                                        Version:           20.10.9
                                        API version:       1.41
                                        Go version:        go1.16.8
                                        Git commit:        c2ea9bc
                                        Built:             Mon Oct  4 16:08:29 2021
                                        OS/Arch:           linux/amd64
                                        Context:           default
                                        Experimental:      true

                                        Server: Docker Engine - Community
                                        Engine:
                                        Version:          20.10.9
                                        API version:      1.41 (minimum version 1.12)
                                        Go version:       go1.16.8
                                        Git commit:       79ea9d3
                                        Built:            Mon Oct  4 16:06:37 2021
                                        OS/Arch:          linux/amd64
                                        Experimental:     false
                                        containerd:
                                        Version:          1.4.11
                                        GitCommit:        5b46e404f6b9f661a205e28d59c982d3634148f8
                                        runc:
                                        Version:          1.0.2
                                        GitCommit:        v1.0.2-0-g52b36a2
                                        docker-init:
                                        Version:          0.19.0
                                        GitCommit:        de40ad0

Troubleshooting Docker :

 * Error
            Got permission denied while trying to connect to the Docker daemon socket at unix:///var/run/docker.sock: Get "http://%2Fvar%2Frun%2Fdocker.sock/v1.24/version": dial unix /var/run/docker.sock: connect: permission denied

          sudo chmod 666 /var/run/docker.sock

          sudo usermod -aG docker {USER}

         #  newgrp docker



* Create Flask app Docker Images:

            . ./run_docker.sh


* Setup and Configure Kubernetes locally:

# Installing kubectl

https://docs.aws.amazon.com/eks/latest/userguide/install-kubectl.html

* Download the Amazon EKS vended kubectl binary for your cluster's Kubernetes version from Amazon S3:
* Kubernetes 1.21:

            curl -o kubectl https://amazon-eks.s3.us-west-2.amazonaws.com/1.21.2/2021-07-05/bin/linux/amd64/kubectl

* Verify the downloaded binary with the SHA-256 sum for your binary:

            openssl sha1 -sha256 kubectl

* Apply execute permissions to the binary:

            chmod +x ./kubectl

* Copy the binary to a folder in your PATH. If you have already installed a version of kubectl:

            mkdir -p HOME/bin && cp ./kubectl HOME/bin/kubectl && export PATH=PATH:HOME/bin

*  Add the HOME/bin path to your shell initialization file:

           echo 'export PATH=PATH:HOME/bin' >> ~/.bashrc

* Verify kubectl version:

            kubectl version --short --client

           Output
           Client Version: v1.21.2-13+d2965f0db10712

* Create Flask app in Container:

* Run via kubectl:

            . ./run_kubernetes.sh


# Installation minikube

            curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64
            sudo install minikube-linux-amd64 /usr/local/bin/minikube


* Start your cluster

            Start your cluster

             Output
             ubuntu@ip-172-31-27-175:~ minikube start

                😄  minikube v1.23.2 on Ubuntu 20.04
                ✨  Automatically selected the docker driver. Other choices: none, ssh
                👍  Starting control plane node minikube in cluster minikube
                🚜  Pulling base image ...
                💾  Downloading Kubernetes v1.22.2 preload ...
                > preloaded-images-k8s-v13-v1...: 511.69 MiB / 511.69 MiB  100.00% 173.76 M
                > gcr.io/k8s-minikube/kicbase: 355.39 MiB / 355.40 MiB  100.00% 44.06 MiB p
                🔥  Creating docker container (CPUs=2, Memory=3800MB) ...| Installati
                🐳  Preparing Kubernetes v1.22.2 on Docker 20.10.8 ...
                ▪ Generating certificates and keys ...
                ▪ Booting up control plane ...
                ▪ Configuring RBAC rules ...
                🔎  Verifying Kubernetes components...
                ▪ Using image gcr.io/k8s-minikube/storage-provisioner:v5
                🌟  Enabled addons: default-storageclass, storage-provisioner
                🏄  Done! kubectl is now configured to use "minikube" cluster and "default" namespace by default

                kubectl cluster-info

                        Output
                        Kubernetes control plane is running at https://192.168.49.2:8443
                        CoreDNS is running at https://192.168.49.2:8443/api/v1/namespaces/kube-system/services/kube-dns:dns/proxy

                        To further debug and diagnose cluster problems, use 'kubectl cluster-info dump'.

                  minikube dashboard

                        Output
                        🔌  Enabling dashboard ...
                        ▪ Using image kubernetesui/dashboard:v2.3.1
                        ▪ Using image kubernetesui/metrics-scraper:v1.0.7
                        🤔  Verifying dashboard health ...
                        🚀  Launching proxy ...
                        🤔  Verifying proxy health ...
                        🎉  Opening http://127.0.0.1:36001/api/v1/namespaces/kubernetes-dashboard/services/http:kubernetes-dashboard:/proxy/ in your default browser...
                        👉  http://127.0.0.1:36001/api/v1/namespaces/kubernetes-dashboard/services/http:kubernetes-dashboard:/proxy/

                  kubectl get nodes

                        Output
                        NAME       STATUS   ROLES                  AGE   VERSION
                        minikube   Ready    control-plane,master   23m   v1.22.2

                  kubectl config view

                        Output
                        apiVersion: v1
                        clusters:
                        - cluster:
                        certificate-authority: /home/ubuntu/.minikube/ca.crt
                        extensions:
                        - extension:
                                last-update: Tue, 19 Oct 2021 22:01:47 UTC
                                provider: minikube.sigs.k8s.io
                                version: v1.23.2
                        name: cluster_info
                        server: https://192.168.49.2:8443
                        name: minikube
                        contexts:
                        - context:
                        cluster: minikube
                        extensions:
                        - extension:
                                last-update: Tue, 19 Oct 2021 22:01:47 UTC
                                provider: minikube.sigs.k8s.io
                                version: v1.23.2
                        name: context_info
                        namespace: default
                        user: minikube
                        name: minikube
                        current-context: minikube
                        kind: Config
                        preferences: {}
                        users:
                        - name: minikube
                        user:
                        client-certificate: /home/ubuntu/.minikube/profiles/minikube/client.crt
                        client-key: /home/ubuntu/.minikube/profiles/minikube/client.key

#  Test  project code using hadolint
https://github.com/hadolint/hadolint/releases

* Install hadolint

              sudo wget -O /bin/hadolint https://github.com/hadolint/hadolint/releases/download/v2.7.0/hadolint-Linux-x86_64 && sudo chmod +x /bin/hadolint


Verify hadolint

             hadolint --version

             Output
             Haskell Dockerfile Linter 2.7.0-no-git

             hadolint ./Dockerfile

             Output
             ./Dockerfile:14 DL3042 warning: Avoid use of cache directory with pip. Use `pip install --no-cache-dir <package>`

             make lint
                  
                  Output
                  # See local hadolint install instructions:   https://github.com/hadolint/hadolint
                  # This is linter for Dockerfiles
                  hadolint Dockerfile
                  # This is a linter for Python source code linter: https://www.pylint.org/
                  # This should be run from inside a virtualenv
                  pylint --disable=R,C,W1203 app.py

                  ------------------------------------
                  Your code has been rated at 10.00/10

## Running `app.py`

1. Standalone:  `python app.py`
2. Run in Docker:  `./run_docker.sh`
3. Run in Kubernetes:  `./run_kubernetes.sh`
