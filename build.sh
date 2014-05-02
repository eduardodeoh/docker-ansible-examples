#!/bin/bash

if [ $# == 0 ]
then
  echo "Use: $0 Dockerfile-xxxx"
  exit 1
fi

TAG_NAME=$(echo $1 | cut -f2 -d-)

IMAGE_NAME="eduardodeoh/docker-ansible:$TAG_NAME"

DOCKERFILE="$1"


#https://github.com/dotcloud/docker/issues/1912#issuecomment-25050020
#not work with ADD instruction
#docker.io build -t $IMAGE_NAME - < $DOCKERFILE


cp $DOCKERFILE Dockerfile
shift
docker.io build -t $IMAGE_NAME $* .
rm Dockerfile
