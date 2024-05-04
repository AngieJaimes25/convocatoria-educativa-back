# Usar una imagen base que contenga Java
FROM adoptopenjdk:11-jre-hotspot

# Establecer el directorio de trabajo dentro del contenedor
WORKDIR /app

# Copiar el archivo JAR construido de tu proyecto a la imagen
COPY target/convocatoria.0.0.1-SNAPSHOT.jar app.jar

# Comando para ejecutar la aplicación Spring Boot cuando se inicie el contenedor
CMD ["java", "-jar", "app.jar"]