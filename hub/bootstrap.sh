#! /bin/sh

# give docker image as 1st argument if provided
DOCKER=$1
DOCKER=${DOCKER:=jupyter/jupyterhub}

# get random secret strings
CONFIG1=$(cat config_template.yaml)
S1=$(openssl rand -hex 32)
S2=$(openssl rand -hex 32)

# edit and write config.yaml
CONFIG2="${CONFIG1/SECRET1/$S1}"
CONFIG3="${CONFIG2/SECRET2/$S2}"
CONFIG4="${CONFIG3/DOCKER_IMAGE/$DOCKER}"
echo "$CONFIG4" > config.yaml

# install kubectl
gcloud components install kubectl

# create cluster
gcloud container clusters create dlabhub \
        --num-nodes=3 \
        --machine-type=n1-standard-2 \
        --zone=us-central1-b

# get helm
curl https://raw.githubusercontent.com/kubernetes/helm/master/scripts/get | bash
helm init

# add jhub helm charts
helm repo add jupyterhub https://jupyterhub.github.io/helm-chart/
helm repo update

# install hub
helm install jupyterhub/jupyterhub \
    --version=v0.4 \
    --name=jhub \
    --namespace=dlabhub \
    -f config.yaml

# retry until docker image is fully pulled
while [ $? -ne 0 ]; do
    echo "Retrying..."
    helm install jupyterhub/jupyterhub \
        --version=v0.4 \
        --name=jhub \
        --namespace=dlabhub \
        -f config.yaml

    sleep 5

done

# print pods
kubectl --namespace=dlabhub get pod

# print IP
kubectl --namespace=dlabhub get svc