#!/bin/bash

mkdir -p /var/jenkins_home/jobs/Demo/builds&& \
    chown -R 1000:1000 /var/jenkins_home && \
    chmod -R 755 /var/jenkins_home
echo "Setting up Jenkins home directory permissions..."

cp casc.yaml /var/jenkins_home/casc.yaml
echo "Copying casc.yaml to Jenkins home..."
cp init.groovy /var/jenkins_home/init.groovy
echo "Copying init.groovy to Jenkins home..."
cp plugins.txt /var/jenkins_home/plugins.txt
echo "Copying plugins.txt to Jenkins home..."
cp config.xml /var/jenkins_home/jobs/Demo/config.xml
echo "Copying config.xml to Jenkins home..."

docker build -t jenkins:jcasc .
echo "Building Docker image jenkins:jcasc..."
docker run -d -p 8080:8080 -v /var/jenkins_home:/var/jenkins_home \
--name jenkins jenkins:jcasc
echo "Running Jenkins container..."