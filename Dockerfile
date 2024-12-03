# Используем доступный образ Maven с OpenJDK 17
FROM maven:3.8.7-eclipse-temurin-17 AS build
WORKDIR /usr/src/app
COPY . .
RUN mvn clean package

# Используем образ OpenJDK для запуска приложения
FROM eclipse-temurin:17-jdk
WORKDIR /usr/app
COPY --from=build /usr/src/app/target/my-maven-project-1.0-SNAPSHOT.jar app.jar
EXPOSE 8080
CMD ["java", "-jar", "app.jar"]
