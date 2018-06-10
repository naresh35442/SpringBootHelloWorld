pipeline {
    agent any
    tools {
        maven 'Maven-3-5-2'
    }
    stages {
        stage ('Initialize') {
            steps {
                sh '''
                    echo "PATH = ${PATH}"
                    echo "M2_HOME = ${M2_HOME}"
                '''
            }
        }
        
        stage ('Preparation') {
        steps {
                git 'https://github.com/Nish1989/SpringBootHelloWorld.git'
            }
         
         }

        stage ('Build') {
            steps {
                sh 'mvn -Dmaven.test.failure.ignore=true clean package' 
            }
            post {
                success {
                    junit 'target/surefire-reports/**/*.xml' 
                }
            }
        }
        
         stage ('Junit Test') {
            steps {
                sh 'mvn test' 
            }
            post {
                success {
                    junit 'target/surefire-reports/**/*.xml' 
                }
            }
        }
        stage ('Results') {
        
        steps {
                junit '**/target/surefire-reports/TEST-*.xml'
            archive 'target/*.jar'
            }
            
        }
   
    }
}