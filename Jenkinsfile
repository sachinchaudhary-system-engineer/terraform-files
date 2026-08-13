pipeline{
    agent any

    stages{

        stage('checkout code'){
            steps{
                git branch: 'main',
                    url: 'https://github.com/sachinchaudhary-system-engineer/terraform-files.git' 
            echo "code is copied to the source"
            }
        }
        stage('aws cred check'){
            steps{
                withCredentials([
                    [$class: 'AmazonWebServicesCredentialsBinding',
                    credentialsId: 'aws-cred']
                ]) {
                sh ' aws  sts get-caller-identity'
                }
            }
        }

        stage('init'){
            steps{
                withCredentials([
                    [$class: 'AmazonWebServicesCredentialsBinding',
                    credentialsId: 'aws-cred']
                ]) {
                sh 'terraform init -backend-config=dev-backend.hcl'
                }
            }
        }

        stage('validate'){
            steps{
                sh 'terraform validate'
            }
        }
        stage('plan'){
            steps{
               withCredentials([
                    [$class: 'AmazonWebServicesCredentialsBinding',
                    credentialsId: 'aws-cred']
                ]) {
                sh 'terraform plan'
                }
            }
        }
        stage('apply'){
            steps{
               withCredentials([
                    [$class: 'AmazonWebServicesCredentialsBinding',
                    credentialsId: 'aws-cred']
                ]) {
                sh 'terraform apply -auto-approve'
                }
            }
        }
    }
    post{

        success{
            echo "pipeline is successful"
        }
        failure{
            echo "pipeline failed"
        }
    }
}
