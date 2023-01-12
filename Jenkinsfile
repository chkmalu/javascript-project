pipeline {
    agent any

    stages {
        stage('Test app') {
            steps {
                echo 'Testing application'
            }
        }
        stage('Build image') {
            steps {
                echo 'Building image'
            }
        }
        stage('Deploy image') {
            steps {
                echo 'Deploying image on prod'
                docker-run = 'docker run -d --name jsapp -p 80:80 chikamalu/jsapp:1.0'
                script{
                    sshagent(['Appserver-ssh-key']) {
                        sh "ssh -o StrictHostKeyChecking=no jsapp@52.207.189.206 ${docker-run}"
                    }
                }
            }
        }
    }
}
