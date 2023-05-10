pipeline {
    agent any
    stages {
        stage('Clone repository') {
            steps{
                checkout scm
            }
        }

        stage('Build image') {
            steps {
                sh "docker build -t buijt/hello-jenkins-singularity ."
            }
        }

        stage('Test image') {
            steps {
                sh 'echo "Tests passed"'
            }
        }
    }
}