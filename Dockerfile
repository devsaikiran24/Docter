FROM tomcat:8.0
COPY ./target/*.war /usr/local/tomcat/webapps/index.war
EXPOSE 8080
