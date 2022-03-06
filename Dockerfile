FROM openjdk:8
EXPOSE 8080
ADD target/demo-0.0.1-SNAPSHOT.jar spring-boot-docker-api.jar
ENTRYPOINT ["java", "-jar","/spring-boot-docker-api.jar"]