# Stage 1: Build the application
FROM eclipse-temurin:21-jdk AS build

RUN apt-get update && apt-get install -y maven git && apt-get clean

# Set the working directory
WORKDIR /app

# Copy the pom.xml and other necessary files
COPY pom.xml ./
COPY src ./src

# Package the application
RUN mvn clean package -DskipTests

# Stage 2: Create the final image
FROM eclipse-temurin:21-jre  

# Set the working directory
WORKDIR /app

# Copy the JAR file from the build stage
COPY --from=build /app/target/*.jar app.jar

# Expose the port on which the app runs (default is 8080)
EXPOSE 8080

# Command to run the application
ENTRYPOINT ["java", "-jar", "app.jar", "server.address=0.0.0.0"]
