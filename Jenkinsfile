
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
        stage('SonarQube Analysis') {
                sh """
                ${mvnHome}/bin/mvn sonar:sonar \
                  -Dsonar.projectKey=simple-hello-keerthana \
                  -Dsonar.host.url=https://d6312cd2eccd.ngrok-free.app/ \
                  -Dsonar.login=$SONARQUBE_TOKEN
                """
       

       
            }
        }
    }
}
