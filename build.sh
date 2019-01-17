#!/bin/bash
export ECR=606039442951.dkr.ecr.us-east-1.amazonaws.com
export VERSION=1.3.1-SNAPSHOT
MIRADA_REVISION=1

download_release_file () { wget -qc --show-progress https://github.com/miradatv/$1/releases/download/$2/$3; }

download_release_file alluxio $VERSION alluxio-$VERSION.tar.gz

docker build \
  --build-arg ALLUXIO_VERSION=$VERSION \
  -t alluxio .

$(aws ecr get-login --region us-east-1 --no-include-email)
docker tag alluxio:latest $ECR/alluxio:$VERSION-$MIRADA_REVISION
docker tag alluxio:latest $ECR/alluxio:latest
docker push $ECR/alluxio:$VERSION-$MIRADA_REVISION
docker push $ECR/alluxio:latest
