# Use a more recent Tomcat version based on a supported Debian release
FROM tomcat:9.0-jre8

# Set the working directory
WORKDIR /usr/local/tomcat

# Optional: Copy your WAR file to the Tomcat webapps directory
# COPY path_to_your_war_file.war /usr/local/tomcat/webapps/

# Install curl (since the default image might not have it)
RUN apt-get update && apt-get install -y curl && apt-get clean

# Expose the default Tomcat port
EXPOSE 8080

# Optional: Run a custom command or your app (if necessary)
# CMD ["catalina.sh", "run"]
