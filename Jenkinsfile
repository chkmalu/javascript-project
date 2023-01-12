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
                script{
                    sshagent(['Appserver-ssh-key']) {
                        sh 'ssh -o StrictHostKeyChecking=no ubuntu@52.207.189.206'
                        sh 'docker run -d --name jsapp -p 80:80 jsapp:1.0'
}
                }
            }
        }
    }
}
