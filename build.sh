#!/usr/bin/env bash

echo "removing old code"
sudo rm -rf orbitera-maven-example
echo "cloning git project"
git clone https://github.com/jainishshah17/orbitera-maven-example.git
echo "building maven project"
sudo chown jenkins:jenkins -R orbitera-maven-example
cd orbitera-maven-example && mvn clean install
cd ..

echo "login into docker private registry."
docker login -u admin -p password $1:5001
echo "building docker image."
docker build --no-cache -t $1:5001/helloworld:$BUILD_NUMBER .
echo "pushing docker image to private registry."
docker push $1:5001/helloworld:$BUILD_NUMBER
echo "removing docker image."
docker rmi -f $1:5001/helloworld:$BUILD_NUMBER
