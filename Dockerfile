# Use an official Java runtime as a parent image
FROM openjdk:11-jdk-slim

# Set the working directory to /app
WORKDIR /app

# Copy the application files
COPY MyApp.jar /app/
COPY myapp.conf /app/

# Install GUI dependencies
RUN apt-get update && \
    apt-get install -y xorg openbox && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Set display environment variable
ENV DISPLAY=host.docker.internal:0

# Expose container port
EXPOSE 8081

# Run application
CMD ["java", "-jar", "/app/MyApp.jar", "--config", "/app/myapp.conf"]
