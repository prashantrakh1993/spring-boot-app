# Use a base image with a JDK and a JRE pre-installed
FROM adoptopenjdk/openjdk11:alpine-jre


# Set the working directory for the application
WORKDIR /app

# Copy the Spring Boot application JAR file into the container
COPY build/libs/demo-0.0.1-SNAPSHOT.jar /app/demo-0.0.1-SNAPSHOT.jar

# Expose the port on which the application will run
EXPOSE 8080

# Set the command to run the application
CMD ["java", "-jar", "demo-0.0.1-SNAPSHOT.jar"]

