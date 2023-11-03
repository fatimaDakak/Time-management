# Use an official Tomcat runtime as the base image
FROM tomcat:10.1-jre21

# Remove the default webapps folder
RUN rm -rf /usr/local/tomcat/webapps/*

# Copy your application WAR file into the webapps folder
COPY Time-management.war /usr/local/tomcat/webapps/Time-management.war

# Expose the default Tomcat port (note that you don't need to change the port number)
EXPOSE 8080
