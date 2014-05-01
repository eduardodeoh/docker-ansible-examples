#!/bin/bash

if [ $# == 0 ]
then
  echo "Use: $0 Dockerfile-xxxx"
  exit 1
fi


IMAGE_NAME="eduardodeoh/docker-ansible:rbenv"

DOCKERFILE="$1"


#https://github.com/dotcloud/docker/issues/1912#issuecomment-25050020
#not work with ADD instruction
#docker.io build -t $IMAGE_NAME - < $DOCKERFILE


cp $DOCKERFILE Dockerfile
docker.io build -t $IMAGE_NAME .
rm Dockerfile
