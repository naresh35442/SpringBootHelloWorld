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
        sh 'docker build -t interface/lane1.0 .'
       sh 'docker tag interface/lane1.0 nareshkazipet1/playground9:latest'
       // sh 'docker tag interface/lane1.0 nareshkazipet1/playground9:latest'
    
            }   
       
   }
      stage ('Docker Deploy'){
    steps {
        sh 'docker run -itd interface/lane1.0:latest'
        sh 'docker rm $(docker ps --all -q -f status=exited)'
       // sh 'docker run -p 7070:7070 nareshkazipet1/playground9'
                //echo sh(script: 'env|sort', returnStdout: true)
            }   
       
   }

   
 //stage ('Docker Push'){
   //steps {
     //   sh '/usr/local/bin/docker push nareshkazipet1/playground9:latest9'      
       // echo sh(script: 'env|sort', returnStdout: true)
         //  }   
    //   docker run -p 4000:80 username/repository:tag

   //}


    }
}
