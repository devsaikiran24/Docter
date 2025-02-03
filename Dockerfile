# Use an OpenJDK base image
FROM openjdk:17-jdk-slim

# Set the working directory inside the container
WORKDIR /app

# Copy the JAR file from the target directory into the container
COPY target/demo-Doctor-0.0.1-SNAPSHOT.jar app.jar

# Copy static files into the container (Spring Boot will automatically serve them)
COPY src/main/resources/static /app/static

# Expose the port Spring Boot runs on (default is 8080)
EXPOSE 8080

# Run the Spring Boot JAR file
ENTRYPOINT ["java", "-jar", "app.jar"]
