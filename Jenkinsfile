pipeline {
    agent any
    parameters {
        choice(name: 'ACTION', choices:['apply', 'destroy'])
    }
    stages {
        stage('git checkout') {
            steps {
                git 'https://github.com/shraddesh123/jenkins-practice.git'
            }
        }
        stage('terraform init') {
            steps {
                sh 'terraform init'
            }
        }
        stage('terraform plan') {
            steps {
                sh 'terraform plan -out=tfplan'
            }
        }
        stage('terraform apply or destroy') {
            steps {
                script {
                    if (params.ACTION == 'apply') {
                        sh 'terraform apply tfplan'
                    }
                    else {
                        sh 'terraform destroy -auto-approve'
                    }
                }
            }
        }
    }
    post {
        success {
            echo 'Successfully created IAC using Jenkinsfile'
        }
        failure {
            echo 'problem occured during creation of IAC using Jenkinsfile'
        }
    }
}
