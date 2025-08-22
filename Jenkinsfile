
pipeline {
    agent any
    tools {
        maven 'maven'
    }
    environment {
        IMAGE_NAME = "keerthana978/lab:springboot"
    }
    stages {
        stage('Checkout') {
            steps {
                git branch: 'main', credentialsId: 'github', url: 'https://github.com/KeerthanaVelpuri/spring_lab.git'
                sh 'ls -la'
            }
        }

        stage('Build') {
            steps {
                sh 'mvn clean install'
            }
        }

        stage('Package') {
            steps {
                sh 'mvn package'
            }
        }

        stage('Docker Build and Push') {
            steps {
                script {
                    docker.withRegistry('https://index.docker.io/v1/', 'docker') {
                        def app = docker.build("${IMAGE_NAME}")
                        app.push()
                    }
                }
            }
        }

        stage('Docker Pull') {
            steps {
                sh "docker pull ${IMAGE_NAME}"
            }
        }

        stage('Deploy') {
            steps {
                sh '''
                docker stop myapp || true
                docker rm myapp || true
                docker run -d -p 8080:8080 --name myapp ${IMAGE_NAME}
                '''
            }
        }
    }
}
