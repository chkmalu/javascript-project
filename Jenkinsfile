library identifier: 'git@github.com:chkmalu/jenkins-shared-library.git', retriever: modernSCM([$class: 'GitSCMSource', credentialsId: 'jenkins-keyid', remote: 'git@github.com:chkmalu/jenkins-shared-library.git'])

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
                script{
                    build('chikamalu/jsapp:1.1')
                }
            }
        }
        stage('Deploy image') {
            steps {
                echo 'Deploying image on prod'
                script{
                    dockerRun = 'docker run -d --name mainjsapp -p 3080:80 chikamalu/jsapp:1.0'
                    sshagent(['Appserver-ssh-key']) {
                        sh "ssh -o StrictHostKeyChecking=no jsapp@52.207.189.206 ${dockerRun}"
                    }
                }
            }
        }
    }
}
