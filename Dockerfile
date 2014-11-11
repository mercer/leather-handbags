FROM tomcat:8
MAINTAINER Mercer Traieste <mercer.traieste@gmail.com>
RUN rm -rf /usr/local/tomcat/webapps/*
RUN \
  wget --quiet https://updates.jenkins-ci.org/latest/jenkins.war -O backend.war && \
  cp backend.war /usr/local/tomcat/webapps/ && \
  rm backend.war
