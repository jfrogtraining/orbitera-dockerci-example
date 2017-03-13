#!/usr/bin/env bash

echo "loging into docker private registry."
docker login -u admin -p password 35.185.192.88:5001
echo "building docker image."
docker build -t 35.185.192.88:5001/helloworld .
echo "pushing docker image to private registry."
docker push 35.185.192.88:5001/helloworld
echo "removing docker image."
docker rmi -f 35.185.192.88:5001/helloworld