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
                  withCredentials([usernamePassword(credentialsId: 'dockerhub-credentials', usernameVariable: 'DOCKER_USERNAME', passwordVariable: 'DOCKER_PASSWORD')]) {
                  sh "echo \$DOCKER_PASSWORD | docker login -u \$DOCKER_USERNAME --password-stdin"
                }
            }
            }
        }

        stage("Push Image") {
            steps {
                sh 'docker tag my-node-app:1.0 pushpanjay/my-node-app:1.0'
                sh 'docker push pushpanjay/my-node-app:1.0'
            }
        }
    post{
        always {
            sh 'docker logout'
         }
      }
    }
}
