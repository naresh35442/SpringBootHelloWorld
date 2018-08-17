pipeline {
    agent any
 
    
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
        
   stage ('maven deploy') {
          steps {
              sh "'mvn' jar:jar deploy:deploy" 
            }
            
        }
   post {
				success{
                 	 sh "echo 'maven deploy success'"
					EmailNotify("Success","Docker Image Creation", "naresh.35442@gmail.com")
				}
				failure{
					EmailNotify("Failed","Docker Image Creation",  "naresh.35442@gmail.com")
					//JiraTicketCreation("Issue - maven deploy failed", "maven deploy failed", "naresh.35442@gmail.com")
				}
			}


    }
} 
