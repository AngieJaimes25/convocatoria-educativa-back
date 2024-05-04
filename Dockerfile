# Usar una imagen base que contenga Java
FROM amazoncorretto:22-alpine3.19-jdk

# Copiar el archivo JAR construido de tu proyecto a la imagen
COPY target/convocatoria-0.0.1-SNAPSHOT.jar app.jar

# Comando para ejecutar la aplicación Spring Boot cuando se inicie el contenedor
CMD ["java", "-jar", "app.jar"]