# Use an OpenJDK base image
FROM openjdk:11

# Set the working directory inside the container
WORKDIR /app

# Copy only Java files first to leverage Docker caching
COPY CalculatorJava/*.java ./CalculatorJava/

# Compile the Java program
RUN javac CalculatorJava/Calculator.java

# Copy any remaining project files
COPY . .

# Run the Java application
CMD ["java", "CalculatorJava.Calculator"]

