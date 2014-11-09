Leather Handbags: The Demo Store
----------------------------------

TODO
-------
- [x] transform the leather-handbags into web
- [x] build the deployable artifact
- [x] expose the appliance's ports to localhost
- [x] docker artifactory
- docker repository
- scripts for windows
- scripts for linux
- jenkins with java 1.8
- clean up gradle configuration
- ONBUILD trigger to pack a deployable artifact with a container (tomcat)
- add javadoc task call
- remove expose ports duplication from own Dockerfile
- cleanup all the mixes of pipeline config and env config, and all other config; remove hardcoded credentials
- [x] have sonar run on all
- have config pass guest os appliance urls and not component urls (fetch ports/host os ip)
- [x] fetch build number to version strategy
- use artifactory as proxy
- [x] fix boot2docker os system time

Broadleaf
----------
- fork DemoSite
- gradle wrapper
- gradlew init
- docker mysql container
- docker tomcat container
- broadleaf data on mysql

Fictionized lifecycle of a container
--------------------------------------
- restore state
- start container
- state backuped from time to time, serve clients
- container stopped
- state backedup or archived
- if service died, logs and such should be saved for forensics purposes
- container erased

Questions
-----------
- [x] docker: started on 192.168.59.103:8080; how do I expose it on lan? on internet?
- docker: how do i get it on a Digitalocean instance? vagrant?
- docker: how to save/provision jenkins settings, plugins, build pipelines?
- docker: linked containers dependencies when starting? can a container start it's dependencies, wait for them to be completely started, then start itself?
- how to deliver artifacts in conjunction with docker? is an artifact (war) repository still needed?
- should a container be stateless? where should all state go? db, logs, all kinds of bits and bytes
- should we or shouldn't we use latest tags? versions should be under control, no?
- when giving passwords as parameters to containers, ok in clear? where should they come from?
- when starting a container, random ports --> localhost or not?
- how to debug boot2docker? 
- how to debug containers that fail to start?
- postgres?
- add build info together with artifact?
- extend Dockerfiles to install plugins on jenkins and sonar?
- jenkins jobs to git?
- how much space do container instances occupy? what about container snapshots?

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
- [x] VOLUME didn't work in Dockerfile -> you're not supposed to do it like that, state is maneged outside Dockerfile
- when sharing a volume, owner is set to root of the container; https://github.com/docker/docker/issues/3124 and others;
  and https://groups.google.com/forum/#!topic/docker-user/cVov44ZFg_c and https://github.com/docker/docker/issues/5189
  -> only solution so far is to run the container with root :/

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

Useful docker scripts for your shell config
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

