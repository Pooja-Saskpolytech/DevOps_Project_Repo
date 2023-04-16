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

# Install GUI dependencies
RUN apt-get update && \
    apt-get install -y x11-apps libxext6 libxrender1 libxtst6 && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Set display environment variable
ENV DISPLAY=107.20.55.27:0

# Make port 8081 available to the world outside this container
EXPOSE 8081

# Run the jar file
CMD ["sh", "-c", "Xvfb :0 -screen 0 1024x768x24 -ac +extension GLX +render -noreset & sleep 5; java -jar ./app.jar --server.port=8081"]
