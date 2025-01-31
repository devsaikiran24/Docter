# Use OpenJDK 17 base image
FROM openjdk:17-slim AS builder

# Install Maven manually
RUN apt-get update && apt-get install -y maven

# Set the working directory inside the container
WORKDIR /app

# Copy the pom.xml and download dependencies
COPY pom.xml .
RUN mvn dependency:go-offline

# Copy the source code into the container
COPY src ./src

# Build the project and create a .war file
RUN mvn clean package -DskipTests

# Use the official Tomcat image to run the .war file
FROM tomcat:8.0

# Copy the generated .war file from the builder stage to Tomcat's webapps directory
COPY --from=builder /app/target/*.war /usr/local/tomcat/webapps/

# Expose port 8080
EXPOSE 8080
