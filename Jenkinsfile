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
        tage('Building App') {
            steps {
                sh "docker build -t ${IMAGE_NAME}:${IMAGE_TAG}"
                sh "docker tag ${IMAGE_REPO}${IMAGE_NAME}:${IMAGE_TAG} ${IMAGE_REPO}${IMAGE_NAME}:${IMAGE_TAG}"
                sh "docker push ${IMAGE_REPO}${IMAGE_NAME}:${IMAGE_TAG}"
            }
        }
        tage('Deploying App') {
            steps {
                sh "envsubst < kubernetes/jsapp-deployment.yaml | ${KUBENETES} apply -f -"
            }
        }
    }
}