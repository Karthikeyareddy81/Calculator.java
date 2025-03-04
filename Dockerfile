# Use OpenJDK as the base image
FROM openjdk:17

# Set the working directory inside the container
WORKDIR /app

# Copy the Java source files into the container
COPY . /app

# Compile the Java application
RUN javac CalculatorJava/Calculator.java

# Command to run the Java application
CMD ["java", "CalculatorJava.Calculator"]
