## Running Spring Boot Application as Docker Container

1. ./mvnw package && java -jar target/demo-0.0.1-SNAPSHOT.jar
1. docker build -t target/spring-boot-docker-api-0.0.1.jar . (OR) docker build -t spring-boot-docker-api.jar .
2. docker run -p 8081:8080 spring-boot-docker-api

## Steps to run grafana & prometheus:

1. In Mac terminal run `./mvnw spring-boot:run` ( In Local Mac )
2. In another terminal run the below command ( Running in docker container )

```sh
docker run --rm -p 9090:9090 \
  -v $(pwd)/prometheus.yml:/etc/prometheus/prometheus.yml \
  prom/prometheus:v2.20.1
```

3. In another terminal run the below command ( Running in docker container )

```sh
docker run --rm -p 3000:3000 \
  -e GF_AUTH_DISABLE_LOGIN_FORM=true \
  -e GF_AUTH_ANONYMOUS_ENABLED=true \
  -e GF_AUTH_ANONYMOUS_ORG_ROLE=Admin \
  -v $(pwd)/datasources.yml:/etc/grafana/provisioning/datasources/datasources.yml \
  grafana/grafana:7.1.5
```



Note: the metrics path `http://localhost:8080/actuator/prometheus`



Postgres 

1. CREATE DATABASE dbuser;
2. CREATE USER dbuser;
3. GRANT ALL PRIVILEGES ON DATABASE spring_boot_demo TO dbuser;


Docker Compose

1. docker-compose up

Maven Skip Test

`./mvnw clean package -DskipTests`


### Jenkins Setup

1. Run `docker-compose -f docker-compose.build.yml up`
2. Setup credentials `ssh-keygen -t rsa -f jenkins_agent`
3. Add Credentials to scoped creds
4. Add New Node

Testing
