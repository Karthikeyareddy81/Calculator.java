# Use an OpenJDK base image
FROM openjdk:11

# Set the working directory inside the container
WORKDIR /app

# Copy all files from the host machine to the container
COPY . .

# Verify file structure inside the container
RUN ls -R

# Compile the Java program
RUN javac CalculatorJava/Calculator.java

# Run the Java application
CMD ["java", "CalculatorJava.Calculator"]
