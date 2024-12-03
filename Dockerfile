# Stage 1: Сборка Maven-проекта
FROM maven:3.8.7-eclipse-temurin-17 AS build
WORKDIR /usr/src/app
COPY . .

# Добавьте перед RUN mvn clean package
RUN ls -R /usr/src/app

RUN mvn clean package


# Stage 2: Запуск JAR-файла
FROM eclipse-temurin:17-jdk
WORKDIR /app
COPY --from=build /usr/src/app/target/my-maven-project-1.0-SNAPSHOT.jar app.jar
CMD ["java", "-jar", "/app/app.jar"]
