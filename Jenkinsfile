pipeline {
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
                sudo docker login -u ${DOCKERHUB_CREDENTIALS_USR} -p ${DOCKERHUB_CREDENTIALS_PSW}
                sudo docker build /home/ubuntu/jenkins/workspace/Proj/ -t intellipaatsai/test-image-07-04:latest
                sudo docker push intellipaatsai/test-image-07-04:latest
            }
        }
        stage('K8S') {
            steps {
                kubectl apply -f manifest/deployment.yaml
                kubectl apply -f manifest/nodeport.yaml
            }
        }
    }
}
