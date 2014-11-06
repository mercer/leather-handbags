#!/bin/bash
set -e

vboxmanage --version
echo "_______________________________________________"
boot2docker version
echo "_______________________________________________"
boot2docker info
echo "_______________________________________________"
docker version
echo "_______________________________________________"
docker info
echo "_______________________________________________"

docker stop $(docker ps -a -q)
docker rm $(docker ps -a -q)

docker run --name jenkins -itdP -v ~/.jenkins:/var/jenkins_home mercer/jenkins
docker run --name sonar_mysql -itdP mercer/sonar-mysql
docker run --name sonar -itdP --link sonar_mysql:db mercer/sonar

echo "_______________________________________________"
docker ps -a
