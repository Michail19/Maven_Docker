FROM maven:3.8.7-openjdk-17 AS build
WORKDIR /usr/src/app
COPY . .
RUN mvn clean package

FROM openjdk:17-jdk-slim
WORKDIR /usr/app
COPY --from=build /usr/src/app/target/my-maven-project-1.0-SNAPSHOT.jar app.jar
EXPOSE 8080
CMD ["java", "-jar", "app.jar"]
