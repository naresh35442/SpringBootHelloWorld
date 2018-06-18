pipeline {
    agent any
    tools {
        maven 'maven3'

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
                git 'https://github.com/naresh35442/SpringBootHelloWorld.git'
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
        
   stage ('Docker Build'){
    steps {
        sh 'docker build -t search_image .'
     
          }   
       
   }
      stage ('Docker Deploy'){
    steps {
        sh 'docker run -it --name search_container1 -p 9090:8080 search_image'
       // sh 'docker rm $(docker ps --all -q -f status=exited)'
       // sh 'docker run -p 7070:7070 nareshkazipet1/playground9'
                //echo sh(script: 'env|sort', returnStdout: true)
        
        
            }   
       
   }

 

    }
}
