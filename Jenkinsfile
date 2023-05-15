pipeline {
    agent any
    stages {
        stage('Build image') {
            steps {
                sh "apptainer build hello_R.sif Apptainer.def"
            }
        }

        stage('Test image') {
            steps {
                sh 'apptainer run hello_R.sif'
            }
        }
    }
}