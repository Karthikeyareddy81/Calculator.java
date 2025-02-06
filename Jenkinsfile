pipeline {
    
    agent any
    
    tools {
      jdk 'Java17'
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
        stage("Cleanup Workspace"){
            steps {
              cleanWs()
            }
        }

        stage("Checkout from Github"){
            steps {
                git branch: 'main', credentialsId: 'git', url: 'https://github.com/Karthikeyareddy81/Calculator.java.git'
            }
        }

        stage("Build Application"){
              steps {
                  sh "mvn clean package"
              }
          }

        stage("Test Application"){
            steps {
                sh "mvn test"
            }
        }

        
        stage("Build & Push Docker Image"){
            steps {
                script{
                    docker.withRegistry('',DOCKER_PASS){
                        docker_image = docker.build "${IMAGE_NAME}"
                    }
                    docker.withRegistry('',DOCKER_PASS){
                        docker_image.push("${IMAGE_TAG}")
                        docker_image.push('latest')
                    }
                }
            }
        }
    }
}
