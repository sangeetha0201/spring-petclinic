pipeline {
    environment {
        registry = "sandeep4642/sangee"
        registryCredential = 'dockerhub'
        dockerImage = ''
      }
    agent { label "slave-1"}
    stages {
        stage('Gradle build'){
            steps{
                sh 'gradle build'
            }
        }
        stage('Building Docker image') {
            steps{
              script {
                dockerImage = docker.build registry + ":$BUILD_NUMBER"
              }
            }
        
        }
        stage('Deploy push') {
            steps{
              script {
                docker.withRegistry( '', registryCredential ) {
                  dockerImage.push()
                }
              }
            }
          }
        stage('Remove Unused docker image') {
            steps{
              sh "docker rmi $registry:$BUILD_NUMBER"
            }
          }
     }
    }
