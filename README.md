Leather Handbags: The Demo Store
----------------------------------

TODO
-------
- [x] external sonar configuration for sonar-runner gradle plugin
- build the deployable artifact
- add build info into the artifact
- sonar-mysql and sonar data outside of containers

Questions
-----------
- docker: started on 192.168.59.103:8080; how do I expose it on lan? on internet?
- docker: how do i get it on a digitalocean instance?
- docker: how to save/provision jenkins settings, plugins, build pipelines?

Appliances
--------------------------
docker build -t="mercer/jenkins" .
docker build -t="mercer/sonar-mysq" .
docker build -t="mercer/sonar" .

docker run -itd -p 8080:8080 -v /Users/emilianl/jenkins:/var/jenkins_home mercer/jenkins
docker run -itd -p 3306:3306 mercer/sonar-mysql
docker run -itd -p 9000:9000 --link [generated]:db mercer/sonar


Default user and password for mysql is sonar:123qwe


What if
---------
- what if we store in artifact repository only the deployable artifacts?

Issues
-------------
- [x] https://issues.gradle.org/browse/GRADLE-3062 -> upgrade to gradlew 2.2+
- VOLUME didn't work in Dockerfile

Dev env
--------
- java 1.8

Sonar local setup
------------------
CREATE DATABASE sonar;
CREATE USER 'sonar'@'localhost' IDENTIFIED BY 'sonar';
GRANT ALL PRIVILEGES ON sonar.* TO 'sonar'@'localhost';
FLUSH PRIVILEGES;

subl /usr/local/Cellar/sonar/4.x/libexec/conf/sonar.properties
subl /usr/local/Cellar/sonar-runner/2.4/libexec/conf/sonar-runner.properties
