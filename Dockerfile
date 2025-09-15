# Use official Android build environment
FROM openjdk:17-jdk-slim

# Install necessary tools
RUN apt-get update && apt-get install -y \
    wget \
    unzip \
    git \
    && rm -rf /var/lib/apt/lists/*

# Set working directory
WORKDIR /app

# Copy project files
COPY . .

# Make gradlew executable
RUN chmod +x ./gradlew

# Build the APK
RUN ./gradlew assembleDebug --no-daemon --stacktrace

# Copy APK to output directory
RUN mkdir -p /output && cp app/build/outputs/apk/debug/app-debug.apk /output/

# The APK will be available in /output/app-debug.apk