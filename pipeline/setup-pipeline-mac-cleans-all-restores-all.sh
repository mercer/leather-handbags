#!/bin/bash
set -e

docker stop $(docker ps -a -q)
docker rm $(docker ps -a -q)

# build pipeline
docker run --name jenkins -itdP -v ~/.jenkins:/var/jenkins_home mercer/jenkins
docker run --name sonar_mysql -itdP mercer/sonar-mysql
docker run --name sonar -itdP --link sonar_mysql:db mercer/sonar

# environment
docker run --name mysql -itdP -e MYSQL_ROOT_PASSWORD=OerXxlARZ0Ie mercer/mysql
docker run --name tomcat -itdP --link mysql:db mercer/tomcat

echo "_______________________________________________"
docker ps -a

#vboxmanage --version
#echo "_______________________________________________"
#boot2docker version
#echo "_______________________________________________"
#boot2docker info
#echo "_______________________________________________"
#docker version
#echo "_______________________________________________"
#docker info
#echo "_______________________________________________"

