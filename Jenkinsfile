pipeline {
    agent any
    tools {
        jdk 'jdk17'
        maven 'maven3'
    }
     environment {
        APP_NAME = "calculator-pipeline"
        RELEASE = "1.0.0"
        DOCKER_USER = "karthikeyareddy716"
        DOCKER_PASS = "dockerhub"
        IMAGE_NAME = "${DOCKER_USER}" + "/" + "${APP_NAME}"
        IMAGE_TAG = "${RELEASE}-${BUILD_NUMBER}"
    }
    stages {
        stage('Clone Repository') {
            steps {
                git 'https://github.com/Karthikeyareddy81/Calculator.java'
            }
        }
        stage('Build Application') {
            steps {
                sh './mvnw clean package -DskipTests'
            }
        }
        stage('Build Docker Image') {
            steps {
                sh 'docker build -t $DOCKER_IMAGE .'
            }
        }
        stage('Push Docker Image') {
            steps {
                withDockerRegistry([credentialsId: 'dockerhub', url: '']) {
                    sh 'docker push $DOCKER_IMAGE'
                }
            }
        }
        stage('Deploy to Kubernetes') {
            steps {
                sh 'kubectl apply -f k8s/deployment.yaml'
            }
        }
    }
}
