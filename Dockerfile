FROM tomcat:8
MAINTAINER Mercer Traieste <mercer.traieste@gmail.com>
RUN rm -rf /usr/local/tomcat/webapps/*
RUN \
  wget --quiet http://dockerhost:49177/artifactory/simple/libs-release-local/io/mercer/handbags/backend/1.0.57/backend-1.0.57.war -O backend.war && \
  cp backend.war /usr/local/tomcat/webapps/ && \
  rm backend.war
