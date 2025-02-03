# Use an OpenJDK base image
FROM openjdk:17-jdk-slim

# Set the working directory inside the container
WORKDIR /app

# Copy the WAR file from the target directory into the container
COPY target/demo-Doctor-0.0.1-SNAPSHOT.jar app.jar

# Copy the static files into the container (adjusted for the correct location)
COPY src/main/resources/static /usr/share/nginx/html/

# Expose the port the app runs on (adjust if necessary)
EXPOSE 8080

# Run the WAR file (if it's a Spring Boot app)
ENTRYPOINT ["java", "-jar", "app.jar"]
