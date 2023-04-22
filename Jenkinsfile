pipeline {
    environment {
        registry = "sandeep4642/hello-spring-boot-war"    
        registryCredential = 'dockerhub'
        dockerImage = ''
      }
      agent { label "docker-slave"}
    stages {
        stage('gradle build'){
            steps{
                sh 'gradle build -x test '
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
          stage('Deploy to docker-Server1'){
            steps{
                sh 'ansible-playbook deploy_docker.yaml --extra-vars "job_name=$JOB_NAME" --extra-vars "build_no=$BUILD_NUMBER"'
            }
        }
        stage('Remove Unused docker image') {
            steps{
              sh "docker rmi $registry:$BUILD_NUMBER"
            }
          }
        }  
        }
