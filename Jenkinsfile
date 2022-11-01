pipeline {
    environment {
        registry = "sandeep4642/sangee"
        registryCredential = 'dockerhub'
        dockerImage = ''
      }
    agent { label "slave-1"}
    stages {
        stage('maven build'){
            steps{
                sh 'mvn clean install'
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
    }
