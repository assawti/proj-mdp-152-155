# Stage 1: Build the WAR file using Maven
FROM maven:3.8.7-eclipse-temurin-17 as builder
WORKDIR /app
COPY . .
RUN mvn clean package

# Stage 2: Deploy to Tomcat
FROM tomcat:9.0-jdk17
COPY --from=builder /app/target/*.war /usr/local/tomcat/webapps/calculator.war

EXPOSE 8080

