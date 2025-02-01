# Use a specific version of Tomcat to ensure consistency
FROM tomcat:8.0.53-jre8

# Set the GitHub URL for your raw index.html file
ARG GITHUB_RAW_URL=https://raw.githubusercontent.com/devsaikiran24/Docter/master/index.html

# Update package lists and install curl using a newer Debian base image
RUN apt-get update && apt-get install -y curl

# Debugging step to print curl version
RUN curl --version

# Download the index.html file from the GitHub repository and place it in the Tomcat webapps/ROOT folder
RUN curl -L $GITHUB_RAW_URL -o /usr/local/tomcat/webapps/ROOT/index.html || { echo 'Download failed'; exit 1; }

# Clean up APT when done.
RUN apt-get clean && rm -rf /var/lib/apt/lists/*

# Expose port 8080
EXPOSE 8080
