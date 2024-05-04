FROM amazoncorretto:22-alpine3.19-jdk

COPY target/convocatoria.0.0.1-SNAPSHOT.jar app.jar

ENTRYPOINT ["java", "-jar", "app/jar"]