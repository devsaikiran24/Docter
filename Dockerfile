FROM tomcat:8.0

# Set the GitHub URL for your raw index.html file
ARG GITHUB_RAW_URL=https://raw.githubusercontent.com/devsaikiran24/Docter/master/index.html

# Download the index.html file from the GitHub repository and place it in the Tomcat webapps/ROOT folder
RUN curl -L $GITHUB_RAW_URL -o /usr/local/tomcat/webapps/index.html

# Expose port 8080
EXPOSE 8080

