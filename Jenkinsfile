pipeline {
  environment {
    DOCKERHUB_CREDENTIALS = credentialsid('dhub-id')
  }
  agent { 
    label 'K-M'
  }
  stages {
    stage('Git') {
      steps {
        git branch:'master', url:'https://github.com/Sameer-8080/app-service-web-html-get-started'
      }
     }
    stages {
    stage('Docker') {
      steps {
        sudo docker build /home/ubuntu/jenkins/workspace/Proj/ -t intellipaatsai/test-image-07-04:latest
        sudo docker login -u ${DOCKERHUB_CREDENTIALS_USR} -p ${DOCKERHUB_CREDENTIALS_PSW}
        sudo docker push intellipaatsai/test-image-07-04:latest
      }
     }
    stages {
    stage('K8s') {
      steps {
        kubectl apply -f manifest/deployment.yaml
        kubectl apply -f manifest/nodeport.yaml
      }
     }
  }
}
