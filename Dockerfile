# Use a base image with JDK
FROM openjdk:11

# Set working directory inside the container
WORKDIR /app

# Copy all files to the container
COPY . /app

# Debugging: Check if files exist
RUN ls -R /app

# Compile the Java application
RUN javac CalculatorJava/Calculator.java

# Command to run the Java application
CMD ["java", "CalculatorJava.Calculator"]
