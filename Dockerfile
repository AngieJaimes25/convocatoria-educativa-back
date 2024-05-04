# FROM ubuntu:latest AS build
# RUN apt-get update 
# RUN apt-get install openjdk-21-jdk -y
# COPY . .
# 
# FROM openjdk:18-jdk-slim
# COPY --from=build /target/convocatoria-0.0.1-SNAPSHOT.jar app.jar
# EXPOSE 8080
# 
# ENTRYPOINT [ "java", "-jar", "app.jar" ]



# FROM maven:3.8.5-openjdk-18 AS build
# COPY . .
# RUN mvnw clean package -DskipTests
# 
# FROM openjdk:18-jdk-slim
# COPY --from=build /target/convocatoria-0.0.1-SNAPSHOT.jar app.jar
# EXPOSE 8080
# 
# ENTRYPOINT [ "java", "-jar", "app.jar" ]



FROM maven:3.8.5-openjdk-18 AS build
WORKDIR /app
COPY . /app/
RUN mvn clean package

FROM openjdk:18-jdk-alpine
WORKDIR /app
COPY --from=build /app/target/*.jar /app/app.jar

EXPOSE 8080 
ENTRYPOINT [ "java", "-jar", "app.jar" ]