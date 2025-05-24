# Use official Tomcat base image
FROM tomcat:9.0-jdk17

# Copy the WAR file into Tomcat’s webapps directory
COPY WebAppCal-1.3.5.war /usr/local/tomcat/webapps/calculator.war

# Expose Tomcat's default port
EXPOSE 8080

