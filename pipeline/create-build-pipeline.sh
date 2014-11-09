#!/bin/bash
set -e
 
SONAR_MYSQL_HASH=$(docker run -itd mercer/sonar-mysql)
SONAR_MYSQL_NAME=$(docker inspect -f "{{ .Name }}" $SONAR_MYSQL_HASH)
SONAR_HASH=$(docker run -itd -p 9000:9000 --link $SONAR_MYSQL_NAME:db mercer/sonar)
SONAR_NAME=$(docker inspect -f "{{ .Name }}" $SONAR_HASH)
ARTIFACTORY_HASH=$(docker run -itd -p 8081:8080 mercer/artifactory)
ARTIFACTORY_NAME=$(docker inspect -f "{{ .Name }}" $ARTIFACTORY_HASH)
REGISTRY_HASH=$(docker run -itd -p 5000:5000 mercer/registry)
REGISTRY_NAME=$(docker inspect -f "{{ .Name }}" $REGISTRY_HASH)
JENKINS_HASH=$(docker run -itd -p 8080:8080 -v ~/.jenkins:/var/jenkins_home --link $SONAR_MYSQL_NAME:SONAR_MYSQL --link $SONAR_NAME:SONAR --link $ARTIFACTORY_NAME:ARTIFACTORY --link $REGISTRY_NAME:REGISTRY mercer/jenkins)
JENKINS_NAME=$(docker inspect -f "{{ .Name }}" $JENKINS_HASH)

printf "\nNew containers created: $SONAR_MYSQL_NAME, $SONAR_NAME, $ARTIFACTORY_NAME, $REGISTRY_NAME, $JENKINS_NAME\n\n"
docker ps -a
