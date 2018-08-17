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
                git 'shttps://github.com/naresh35442/SpringBootHelloWorld.git'
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
    
     
        }
   

    
  post {
    success {
       office365ConnectorSend message: "Example stage passed", color: '#00FF00', status:"Success", webhookUrl:'https://outlook.office.com/webhook/f8269f52-2231-45b8-a796-a499b16cfaff@d007658b-5965-4221-9fdd-b49f781268da/IncomingWebhook/cbb1fe389fc7466992114abbb3f1b704/2ffcc5ab-6579-4bd2-ba2e-e034937a3b65'
       }

        failure {
             office365ConnectorSend message: "Example stage failed", color: '#FF0000', status:"Failed", webhookUrl:'https://outlook.office.com/webhook/f8269f52-2231-45b8-a796-a499b16cfaff@d007658b-5965-4221-9fdd-b49f781268da/IncomingWebhook/cbb1fe389fc7466992114abbb3f1b704/2ffcc5ab-6579-4bd2-ba2e-e034937a3b65'
		} 
	}
}
