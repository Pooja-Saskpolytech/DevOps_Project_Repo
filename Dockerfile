# Use an official Java runtime as a parent image
FROM maven:3.8.4-jdk-11-slim AS build

# Set the working directory to /app
WORKDIR /app

# Copy the pom.xml file
COPY pom.xml .

# Resolve the dependencies
RUN mvn dependency:resolve

# Build the application
RUN mvn package

# Copy the JAR file
COPY target/maven-0.0.1-SNAPSHOT.jar ./app.jar

# Set the working directory to /app
WORKDIR /app

# Make port 8081 available to the world outside this container
EXPOSE 8081

# Run the jar file
CMD ["java", "-jar", "./app.jar", "--server.port=8081"]
