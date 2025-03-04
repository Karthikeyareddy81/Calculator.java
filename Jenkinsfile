pipeline {
    agent { label 'Dev' }  // Run on a specific slave node

    environment {
        DOCKER_IMAGE = "my-app"
        REGISTRY = "karthikeyareddy716"
        BUILD_TAG = "${env.BUILD_NUMBER}"
        TOMCAT_WEBAPPS = "/opt/tomcat9/webapps"
        DOCKER_USERNAME = credentials('docker-hub-cred')  // Store in Jenkins credentials
        DOCKER_PASSWORD = credentials('docker-hub-cred')  // Store in Jenkins credentials
    }

    stages {
        stage('SCM Checkout') {
            steps {
                script {
                    echo "Checking out source code..."
                    git branch: 'main', url: 'https://github.com/Karthikeyareddy81/Calculator.java.git'
                }
            }
        }

        stage('Maven Build') {
            steps {
                script {
                    echo "Building with Maven..."
                    sh 'mvn clean package -DskipTests'
                    sh "mv target/*.war target/app-${BUILD_TAG}.war"
                }
            }
        }

        stage('Deploy to Tomcat') {
            steps {
                script {
                    echo "Deploying to Tomcat..."
                    sh "sudo cp target/app-${BUILD_TAG}.war ${TOMCAT_WEBAPPS}/app.war"
                    
                }
            }
        }

        stage('Docker Build & Push') {
            steps {
                script {
                    echo "Building Docker image..."
                    sh "docker build -t ${REGISTRY}/${DOCKER_IMAGE}:${BUILD_TAG} ."

                    echo "Logging into Docker registry..."
                    sh "echo '${DOCKER_PASSWORD}' | docker login -u '${DOCKER_USERNAME}' --password-stdin"

                    echo "Pushing Docker image to registry..."
                    sh "docker push ${REGISTRY}/${DOCKER_IMAGE}:${BUILD_TAG}"
                }
            }
        }
    }

    post {
        success {
            echo "Build and deployment successful!"
        }
        failure {
            echo "Build failed. Check logs for details."
        }
    }
}
