# Use an OpenJDK base image
FROM openjdk:17-jdk-slim

# Set the working directory inside the container
WORKDIR /app

# Copy the WAR file from the target directory into the container
COPY target/demo-Doctor-0.0.1-SNAPSHOT.jar app.jar

# If your static files are in a 'static' directory, copy them into the correct directory for the web server (e.g., Nginx or Tomcat)
COPY static /usr/share/nginx/html/

# Expose the port the app runs on (adjust if necessary)
EXPOSE 8080

# Run the WAR file (if it's a Spring Boot app, for example)
ENTRYPOINT ["java", "-jar", "app.jar"]
