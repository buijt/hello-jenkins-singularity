pipeline {
    agent any

    environment {
        APPTAINER_CACHEDIR = '/data/jenkins/cache'
        APPTAINER_TMPDIR   = '/data/jenkins/tmp'
        JENKINS_BUILD_DIR  = '/data/jenkins/built'
    }

    stages {
        stage('Build image') {
            steps {
                sh "apptainer build $JENKINS_BUILD_DIR/hello_R.sif Apptainer.def"
            }
        }

        stage('Test image') {
            steps {
                sh "apptainer run $JENKINS_BUILD_DIR/hello_R.sif"
            }
        }
    }
}