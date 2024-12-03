# Используем базовый образ Maven для сборки
FROM maven:3.8.7-openjdk-17 AS build
WORKDIR /usr/src/app
COPY . .
RUN mvn clean package

# Используем легковесный образ OpenJDK для запуска приложения
FROM openjdk:17-jdk-slim
WORKDIR /app
COPY --from=build /usr/src/app/target/*.jar app.jar
CMD ["java", "-jar", "app.jar"]
