# Use Maven to build the application (build stage)
FROM maven:3.8.6-openjdk-17 AS builder

# Set the working directory inside the container
WORKDIR /app

# Copy the pom.xml and download dependencies (without downloading the entire source code yet)
COPY pom.xml .
RUN mvn dependency:go-offline

# Copy the source code into the container
COPY src ./src

# Build the project and create a .war file
RUN mvn clean package -DskipTests

# Use the official Tomcat image to run the .war file (runtime stage)
FROM tomcat:8.0

# Copy the generated .war file from the builder stage to Tomcat's webapps directory
COPY --from=builder /app/target/*.war /usr/local/tomcat/webapps/

# Expose port 8080 to allow access to the application
EXPOSE 8080

# By default, Tomcat will run on port 8080, so no need for additional CMD/ENTRYPOINT
