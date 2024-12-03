# Используем официальный образ Maven
FROM maven:3.9.4-eclipse-temurin-17

# Указываем рабочую директорию
WORKDIR /usr/src/app

# Копируем проект в контейнер
COPY . .

# Выполняем команду сборки при запуске контейнера
CMD ["mvn", "clean", "package"]
