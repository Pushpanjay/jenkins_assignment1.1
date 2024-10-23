pipeline{
    agent any 
    stages{
        stage("checkout"){
            steps{
                checkout scm
            }
        }

        stage ("version check"){
            steps{
                sh "node --version"
                sh "npm --version"
            }
        }

        stage("Test"){
            steps{
                sh 'npm install'
                sh 'npm test'
     //         sh 'npx mocha'
            }
        }

        stage("Build"){
            steps{
                sh 'npm run build'
            }
        }

        stage("Build Image" ){
            steps{
                sh 'docker build -t my-node-app:1.0 .'
            }
        
        }
    }
}
