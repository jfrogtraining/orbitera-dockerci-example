#!/usr/bin/env bash

echo "loging into docker private registry."
docker login -u admin -p password $1:5001
echo "building docker image."
docker build --no-cache --add-host -t $1:5001/helloworld:$BUILD_NUMBER .
echo "pushing docker image to private registry."
docker push $1:5001/helloworld:$BUILD_NUMBER
echo "removing docker image."
docker rmi -f $1:5001/helloworld:$BUILD_NUMBER
