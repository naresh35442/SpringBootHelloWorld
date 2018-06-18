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
                                //echo "the application is deploying SpringBootHelloWorld-0.0.1-SNAPSHOT.jar"
        sh "docker build -t search_image_${env.BUILD_ID} ."
      // sh 'docker tag interface/lane1.0 nareshkazipet1/playground9:latest'
       // sh 'docker tag interface/lane1.0 nareshkazipet1/playground9:latest'
    
            }   
       
   }
      stage ('Docker Deploy'){
    steps {
       // sh 'docker rm $(docker ps --all -q -f status=exited)'
     sh "docker run -i --name search_container_${env.BUILD_ID} -p 9020:8080 search_image_${env.BUILD_ID} > log_${env.BUILD_ID}.log"
            }   
       
   }

   


    }
} 
