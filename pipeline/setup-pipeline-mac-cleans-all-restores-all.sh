#!/bin/bash
set -e

boot2docker version
echo "_______________________________________________"
boot2docker info
echo "_______________________________________________"
docker version
echo "_______________________________________________"
docker info
echo "_______________________________________________"

boot2docker down
boot2docker up
docker stop $(docker ps -a -q)
docker rm $(docker ps -a -q)

docker run --name jenkins -itd -p 8080:8080 -v ~/.jenkins:/var/jenkins_home mercer/jenkins
docker run --name sonar_mysql -itd -p 3306:3306 mercer/sonar-mysql
docker run --name sonar -itd -p 9000:9000 --link sonar_mysql:db mercer/sonar

echo "_______________________________________________"
docker ps -a
