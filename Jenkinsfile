pipeline {
    agent any

    stages {

        stage('Checkout Code') {
            steps {
                git branch: 'main',
                    url: 'https://github.com/sachinchaudhary-system-engineer/terraform-files.git'

                echo "Code is copied to the workspace"
            }
        }

        stage('AWS Cred Check') {
            steps {
                withCredentials([
                    [$class: 'AmazonWebServicesCredentialsBinding',
                     credentialsId: 'aws-cred']
                ]) {
                    sh 'aws sts get-caller-identity'
                }
            }
        }

        stage('Terraform Init') {
            steps {
                withCredentials([
                    [$class: 'AmazonWebServicesCredentialsBinding',
                     credentialsId: 'aws-cred']
                ]) {
                    sh 'terraform init -backend-config=dev-backend.hcl'
                }
            }
        }

        stage('Import Existing S3 Bucket') {
            steps {
                withCredentials([
                    [$class: 'AmazonWebServicesCredentialsBinding',
                     credentialsId: 'aws-cred']
                ]) {
                    sh '''
                        if ! terraform state list | grep -q 'module.dev-infra.aws_s3_bucket.my_bucket'; then
                            terraform import \
                              'module.dev-infra.aws_s3_bucket.my_bucket' \
                              dev-sachin-1999
                        else
                            echo "S3 bucket is already in Terraform state"
                        fi
                    '''
                }
            }
        }

        stage('Validate') {
            steps {
                sh 'terraform validate'
            }
        }

        stage('Plan') {
            steps {
                withCredentials([
                    [$class: 'AmazonWebServicesCredentialsBinding',
                     credentialsId: 'aws-cred']
                ]) {
                    sh 'terraform plan'
                }
            }
        }

        stage('Apply') {
            steps {
                withCredentials([
                    [$class: 'AmazonWebServicesCredentialsBinding',
                     credentialsId: 'aws-cred']
                ]) {
                    sh 'terraform apply -auto-approve'
                }
            }
        }
    }

    post {
        success {
            echo "Pipeline is successful"
        }

        failure {
            echo "Pipeline failed"
        }
    }
}
