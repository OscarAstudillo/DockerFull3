# Etapa 1: Construcción (Builder)
# Usamos una imagen con Maven y Java 21 para compilar el código
FROM maven:3.9.9-eclipse-temurin-21 AS builder
WORKDIR /app
# Copiamos el archivo de configuración de dependencias
COPY pom.xml .
# Copiamos todo el código fuente
COPY src ./src
# Compilamos el proyecto saltando los tests para ir más rápido
RUN mvn clean package -DskipTests

# Etapa 2: Imagen de ejecución (Runtime)
# Usamos un JRE (Java Runtime Environment) más ligero
FROM eclipse-temurin:21-jre
WORKDIR /app
# Traemos el archivo .jar generado en la etapa anterior
COPY --from=builder /app/target/*.jar app.jar
# Exponemos el puerto 8080 que usa Spring Boot por defecto
EXPOSE 8080
# Comando para iniciar la aplicación
ENTRYPOINT ["java", "-jar", "app.jar"]