FROM centos:7
MAINTAINER Vladimir Mezera <vladimir.mezera@gmail.com>

RUN yum -y install java-1.8.0-openjdk && mkdir /opt/java-app

ENV world ""

COPY app.jar /opt/java-app
RUN chown -R 1001:1001 /opt/java-app
RUN alternatives --install /usr/bin/java java /usr/java/latest/bin/java 1
WORKDIR "/opt/java-app"
# This default user is created in the openshift/base-centos7 image
USER 1001
# Set the default port for applications built using this image
EXPOSE 8080
ENTRYPOINT ["java","-jar", "app.jar"]
