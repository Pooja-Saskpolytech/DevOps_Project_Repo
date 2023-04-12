# Use an official Java runtime as a parent image
FROM maven:3.8.4-jdk-11-slim AS build

# Set the working directory to /app
WORKDIR /app

# Copy the current directory contents into the container at /app
COPY . .

# Run maven package
RUN mvn package -DskipTests

FROM openjdk:11-jre-slim

# Set the working directory to /app
WORKDIR /app

# Copy the current directory contents into the container at /app
COPY --from=build /app/target/maven-0.0.1-SNAPSHOT.jar ./app.jar


# Make port 8080 available to the world outside this container
EXPOSE 8080

# Run the jar file
CMD ["java", "-jar", "./app.jar"]

