FROM rockylinux:9.3.20231119

MAINTAINER "harman@gmail.com"

RUN  yum install -y java-17-openjdk java-17-openjdk-devel 

COPY Dockerfile  /root/

ADD apache-tomcat-8.5.89.tar.gz  /opt

WORKDIR /opt/apache-tomcat-8.5.89/bin/

EXPOSE 8080 8085 8081 443

CMD ["/opt/apache-tomcat-8.5.89/bin/catalina.sh","run"]
