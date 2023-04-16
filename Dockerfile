# Use an official Java runtime as a parent image
FROM maven:3.8.4-jdk-11-slim AS build

# Set the working directory to /app
WORKDIR /app

# Copy the current directory contents into the container at /app
COPY . .

# Run maven package
RUN mvn package -DskipTests

FROM openjdk:11-jre-slim

# Install necessary X11 components
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        xauth \
        x11-apps \
        xvfb \
        libgtk-3-0 \
        libxtst6 \
        libxrender1 \
        libxi6 \
        libfreetype6 \
        fonts-noto-cjk && \
    rm -rf /var/lib/apt/lists/*

# Set up Xvfb
ENV DISPLAY=:99
RUN Xvfb $DISPLAY -screen 0 1920x1080x24 > /dev/null 2>&1 &

# Set the working directory to /app
WORKDIR /app

# Copy the current directory contents into the container at /app
COPY --from=build /app/target/maven-0.0.1-SNAPSHOT.jar ./app.jar

# Make port 8080 available to the world outside this container
EXPOSE 8080

# Run the jar file with X11 forwarding
CMD ["java", "-Djava.awt.headless=false", "-jar", "./app.jar"]
