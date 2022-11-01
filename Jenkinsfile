pipeline {
    environment {
        registry = "sandeep4642/sangee"
        registryCredential = 'dockerhub'
        dockerImage = ''
      }
    agent any
    stages {
        stage('maven build'){
            steps{
                bat 'mvn clean install'
            }
        }
        stage('Building Docker image') {
            steps{
              script {
                dockerImage = docker.build registry + ":$BUILD_NUMBER"
              }
            }
        
        }
     }
