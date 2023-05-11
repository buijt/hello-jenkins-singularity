pipeline {
    agent any
    stages {
        stage('Build image') {
            steps {
                sh "docker build -t buijt/hello-jenkins-singularity ."
            }
        }

        stage('Test image') {
            steps {
                sh 'docker run buijt/hello-jenkins-singularity'
            }
        }
    }
}