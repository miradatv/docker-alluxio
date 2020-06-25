#!/usr/bin/env bash

usage() {
    echo "Usage:"
    echo "        ${0}  -e ENVIRONMENT -p AWS_PROFILE"
    echo "Example:"
    echo "        ${0}  -e tvi -p perfil-pruebas"
}

MIRADA_REVISION=1
IMAGE_NAME=alluxio
IMAGE_TAG=2.2.2-$MIRADA_REVISION


ECR_URN=docker-registry.mirada.lab:5000/logiq

docker build \
    -t $IMAGE_NAME:$IMAGE_TAG .


docker tag $IMAGE_NAME:$IMAGE_TAG $ECR_URN/$IMAGE_NAME:$IMAGE_TAG
docker push $ECR_URN/$IMAGE_NAME:$IMAGE_TAG
