#!/bin/sh

VERSION=1.3.1

docker build -t miradatv/alluxio .
docker tag miradatv/alluxio:latest miradatv/alluxio:$VERSION
docker push miradatv/alluxio:$VERSION
docker push miradatv/alluxio:latest

