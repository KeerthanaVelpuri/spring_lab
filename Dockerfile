FROM openjdk:17-jdk-slim
 
LABEL maintainer="keerthanavelpuri@gmail.com"
 
WORKDIR /app
 
COPY target/simple-hello-keerthana-1.0.0.jar simple-hello-keerthana-1.0.0.jar
 
EXPOSE 8080
 
ENTRYPOINT [ "java", "-jar", "simple-hello-keerthana-1.0.0.jar" ]
