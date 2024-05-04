FROM ubuntu:latest as build
RUN apt-get update
RUN apt-get install apenjdk-21-jdk -y
COPY ..
RUN ./mvnw spring-boot:run

FROM openjdk:21-jdk.slim
EXPOSE 8080
COPY --from=build /build/libs/convocatoriaBackend-main0.0.1.jar app.jar

ENTRYPOINT ["java","-jar","app.jar"]