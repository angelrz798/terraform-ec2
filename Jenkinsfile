pipeline {
    agent {
        label 'ubuntu'
    }
    stages {
        stage('Init') {
            agent {
                docker {
                    args '--entrypoint=""'
                    image 'hashicorp/terraform'
                }
            }
            steps {
                echo "$WORKSPACE"
                sh 'pwd'
                sh 'terraform init'
            }
        }
    }
    post {
        cleanup {
            dir("$WORKSPACE") {
                deleteDir()
            }
            dir("$WORKSPACE_TMP") {
                deleteDir()
            }
        }
    }
}