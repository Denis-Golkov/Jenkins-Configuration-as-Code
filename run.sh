#!/bin/bash

mkdir -p /var/jenkins_home/jobs/Demo/builds&& \
    chown -R 1000:1000 /var/jenkins_home && \
    chmod -R 755 /var/jenkins_home

cp casc.yaml /var/jenkins_home/casc.yaml
cp init.groovy /var/jenkins_home/init.groovy
cp plugins.txt /var/jenkins_home/plugins.txt
cp config.xml /var/jenkins_home/jobs/Demo/config.xml

docker build -t jenkins:jcasc .
docker run -d -p 8080:8080 -v /var/jenkins_home:/var/jenkins_home \
--name jenkins jenkins:jcasc