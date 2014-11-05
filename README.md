Leather Handbags: The Demo Store
----------------------------------

TODO
-------
- [x] external sonar configuration for sonar-runner gradle plugin
- build the deployable artifact
- add build info into the artifact
- sonar-mysql and sonar data outside of containers
- expose the appliance's ports to localhost
- extend Dockerfiles to install plugins on jenkins and sonar
- add jenkins jobs to git
- scripts for windows
- scripts for linux

Questions
-----------
- docker: started on 192.168.59.103:8080; how do I expose it on lan? on internet?
- docker: how do i get it on a digitalocean instance?
- docker: how to save/provision jenkins settings, plugins, build pipelines?
- docker: linked containers dependencies when starting? can a container start it's dependencies, wait for them to be completely started, then start itself?

Appliances
--------------------------
- jenkins
- sonar-mysql
- sonar; default user and password for mysql is sonar:123qwe

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

Add docker host to hosts file
------------------------------
echo $(docker-ip) dockerhost | sudo tee -a /etc/hosts

Usefull docker scripts for your shell config
-------------------------------------------------
export DOCKER_HOST=tcp://192.168.59.103:2376
export DOCKER_CERT_PATH=/Users/emilianl/.boot2docker/certs/boot2docker-vm
export DOCKER_TLS_VERIFY=1

docker-ip() {
  boot2docker ip 2> /dev/null
}

docker-enter() {
  boot2docker ssh '[ -f /var/lib/boot2docker/nsenter ] || docker run --rm -v /var/lib/boot2docker/:/target jpetazzo/nsenter'
  boot2docker ssh -t sudo /var/lib/boot2docker/docker-enter "$@"
}

