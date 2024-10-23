pipeline {
    agent any 
    stages {
        stage("Checkout") {
            steps {
                checkout scm
            }
        }

        stage("Version Check") {
            steps {
                sh "node --version"
                sh "npm --version"
            }
        }

        stage("Test") {
            steps {
                sh 'npm install'
                sh 'npm test'
            }
        }

        stage("Build") {
            steps {
                sh 'npm run build'
            }
        }

        stage("Build Image") {
            steps {
                sh 'docker build -t my-node-app:1.0 .'
            }
        }

        stage("Login to DockerHub") {
            steps {
                script {
                    // Login to DockerHub
                    def dockerhub_creds = credentials('dockerhub-credentials')
                    sh "echo ${dockerhub_creds.password} | docker login -u ${dockerhub_creds.username} --password-stdin"
                }
            }
        }

        stage("Push Image") {
            steps {
                sh 'docker tag my-node-app:1.0 pushpanjay/my-node-app:1.0'
                sh 'docker push pushpanjay/my-node-app:1.0'
            }
        }
    }
}
