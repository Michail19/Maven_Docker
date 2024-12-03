# Используем базовый образ Maven для сборки
FROM maven:3.8.7-eclipse-temurin-17 AS build
WORKDIR /usr/src/app
COPY . .

# Запуск Maven для сборки
RUN mvn clean install

# Используем легковесный образ OpenJDK для запуска приложения
FROM eclipse-temurin:17-jdk
WORKDIR /app
COPY --from=build /usr/src/app/target/*.jar app.jar

# Указываем команду для запуска приложения
CMD ["java", "-jar", "app.jar"]
