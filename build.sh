#!/bin/sh
export ECR=606039442951.dkr.ecr.us-east-1.amazonaws.com
export VERSION=1.5.0-SNAPSHOT

docker build -t alluxio .

$(aws ecr get-login --region us-east-1)
docker tag alluxio:latest $ECR/alluxio:$VERSION
docker tag alluxio:latest $ECR/alluxio:latest
docker push $ECR/alluxio:$VERSION
docker push $ECR/alluxio:latest

