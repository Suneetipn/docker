# Use the official OpenJDK image from the Docker Hub
FROM openjdk:21-jdk-slim

# Set the working directory inside the container
WORKDIR /app

# Copy the JAR file into the container at /app
COPY target/*.jar app.jar

# Expose the port on which the app runs (default is 8080)
EXPOSE 8010

# Command to run the application
ENTRYPOINT ["java", "-jar", "app.jar"]
