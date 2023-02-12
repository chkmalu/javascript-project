pipeline {
    agent any
    environment {
        IMAGE_REPO = 'chikamalu/'
        IMAGE_NAME = 'jsapp'
        IMAGE_TAG = "1.0-${BUILD_NUMBER}"
        KUBECTL = '/var/jenkins_home/bin/kubectl'
    }

    stages {
        stage('Testing App') {
            steps {
                echo 'Testing App'
            }
        }
        stage('Building App') {
            steps {
                sh "docker build -t ${IMAGE_REPO}${IMAGE_NAME}:${IMAGE_TAG} ." 
                sh "docker tag ${IMAGE_REPO}${IMAGE_NAME}:${IMAGE_TAG} ${IMAGE_REPO}${IMAGE_NAME}:${IMAGE_TAG}"
                sh "docker push ${IMAGE_REPO}${IMAGE_NAME}:${IMAGE_TAG}"
            }
        }
        stage('Deploying App') {
            steps {
                sh "envsubst < kubernetes/jsapp-deployment.yaml | ${KUBECTL} apply -f -"
            }
        }
    }
}