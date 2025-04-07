pipeline {
    environment {
        DOCKERHUB_CREDENTIALS = credentials('dhub-id')
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
        stage('Docker') {
            steps {
                sh 'sudo docker login -u ${DOCKERHUB_CREDENTIALS_USR} -p ${DOCKERHUB_CREDENTIALS_PSW}'
                sh 'sudo docker build /home/ubuntu/jenkins/workspace/Proj/ -t kaurharinder/test-image-07-04:latest'
                sh 'sudo docker push kaurharinder/test-image-07-04:latest'
            }
        }
        stage('K8S') {
            steps {
                sh 'kubectl delete deploy myapp-deployment'
                sh 'kubectl apply -f manifest/deployment.yaml'
                sh 'kubectl delete service myapp-service'
                sh 'kubectl apply -f manifest/nodeport.yaml'
            }
        }
    }
}
