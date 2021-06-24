pipeline {
    agent {
        label 'ubuntu'
    }
    parameters {
        string name: 'AWS_PROFILE', trim: true
        choice choices: ['APPLY', 'DESTROY'], name: 'ACTION'
    }
    stages {
        stage('Init') {
            steps {
                sh "sed -i 's/AWS_PROFILE/${params.AWS_PROFILE}/g' main.tf"
                sh 'terraform init'
                sh 'terraform validate'
            }
        }
        stage('Apply') {
            when {
                expression {
                    return params.ACTION == 'APPLY'
                }
            }
            steps {
                sh 'terraform plan'
                sh 'terraform apply -auto-approve'
            }
        }
        stage('Destroy'){
            when {
                expression {
                    return params.ACTION == 'DESTROY'
                }
            }
            steps {
                sh 'terraform plan -destroy'
                sh 'terraform destroy -auto-approve'
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