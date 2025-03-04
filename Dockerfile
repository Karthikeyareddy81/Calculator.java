# Use a base image with JDK
FROM openjdk:11

# Set working directory inside the container
WORKDIR /app

# Copy all Java source files to the container
COPY . /app

# Compile the Java application
RUN javac CalculatorJava/Calculator.java

# Command to run the Java application
CMD ["java", "CalculatorJava.Calculator"]
