pipeline {
    agent {
        label 'ubuntu'
    }
    parameters {
        string name: 'AWS_PROFILE', trim: true
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
                sh "sed -i 's/AWS_PROFILE/${params.AWS_PROFILE}/g' main.tf"
                sh 'terraform init'
            }
        }
        stage('Format') {
            agent {
                docker {
                    args '--entrypoint=""'
                    image 'hashicorp/terraform'
                }
            }
            steps {
                sh "sed -i 's/AWS_PROFILE/${params.AWS_PROFILE}/g' main.tf"
                sh 'terraform fmt'
            }
        }
        stage('Validate') {
            agent {
                docker {
                    args '--entrypoint=""'
                    image 'hashicorp/terraform'
                }
            }
            steps {
                sh "sed -i 's/AWS_PROFILE/${params.AWS_PROFILE}/g' main.tf"
                sh 'terraform validate'
            }
        }
        stage('Apply') {
            agent {
                docker {
                    args '--entrypoint=""'
                    image 'hashicorp/terraform'
                }
            }
            steps {
                sh "sed -i 's/AWS_PROFILE/${params.AWS_PROFILE}/g' main.tf"
                sh 'terraform apply -auto-approve'
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