FROM tomcat:8
MAINTAINER Mercer Traieste <mercer.traieste@gmail.com>
# RUN rm -rf /usr/local/tomcat/webapps/*
# RUN \
#  wget --quiet http://localhost:8081/artifactory/simple/libs-release-local/io/mercer/handbags/backend/1.0.32/backend-1.0.32.war -O backend.war && \
#  cp backend.war /usr/local/tomcat/webapps/ && \
#  rm backend.war
