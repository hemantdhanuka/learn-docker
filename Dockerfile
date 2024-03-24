# Use OpenJDK 17 as the base image
FROM openjdk:17-alpine AS builder

# Set the working directory inside the container
WORKDIR /app

# Copy the Gradle build files and source code
COPY . .

# Build the application using Gradle
RUN ./gradlew  build -x test

# Create a new stage for the runtime image
FROM openjdk:17-alpine

# Install curl, extra by me as curl was not found
RUN apk update && apk add --no-cache curl

# Set the working directory inside the container
WORKDIR /app

# Copy the built JAR file from the builder stage
COPY --from=builder /app/build/libs/learn-docker-0.0.1-SNAPSHOT.jar app.jar

# Expose port 8080 (or any other port your application listens on)
EXPOSE 9090

# Define the command to run the Spring Boot application
CMD ["java", "-jar", "app.jar"]