FROM rockylinux:9.3.20231119

MAINTAINER "shivag@gmail.com"

# Install Java 17
RUN dnf install -y java-17-openjdk java-17-openjdk-devel wget tar && \
    dnf clean all

# Set environment variables
ENV JAVA_HOME=/usr/lib/jvm/java-17-openjdk
ENV PATH=$JAVA_HOME/bin:$PATH

# Download & install Tomcat 8.5.89
WORKDIR /opt
RUN wget https://downloads.apache.org/tomcat/tomcat-8/v8.5.89/bin/apache-tomcat-8.5.89.tar.gz && \
    tar -xvzf apache-tomcat-8.5.89.tar.gz && \
    mv apache-tomcat-8.5.89 tomcat && \
    rm apache-tomcat-8.5.89.tar.gz

WORKDIR /opt/tomcat/bin

# Expose Tomcat default port
EXPOSE 8080

# Start Tomcat
CMD ["./catalina.sh", "run"]
