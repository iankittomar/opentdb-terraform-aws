#!/bin/bash

sudo apt-get update

sudo apt-get install docker.io -y 

sudo apt install openjdk-8-jdk -y

sudo apt-get install maven -y

sudo chmod 777 /var/run/docker.sock

sudo wget -q -O - https://pkg.jenkins.io/debian/jenkins-ci.org.key | sudo apt-key add -

sudo sh -c 'echo deb http://pkg.jenkins.io/debian-stable binary/ > /etc/apt/sources.list.d/jenkins.list'
sudo apt-get update
sudo apt-get install jenkins -y 

