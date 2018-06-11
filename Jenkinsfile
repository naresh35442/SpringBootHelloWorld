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
node("docker") {
    docker.withRegistry('<<playground9>>', '<<nareshkazipet1>>') {
    
        git url: "<<https://github.com/naresh35442/SpringBootHelloWorld.git>>", naresh35442: '<<Naresh.2521>>'
    
        sh "git rev-parse HEAD > .git/b0d1ff19b72531f8988de8a3445dac647709fb48"
        def commit_id = readFile('.git/b0d1ff19b72531f8988de8a3445dac647709fb48').trim()
        println commit_id
    
        stage "build"
        def app = docker.build "myapp1"
    
        stage "publish"
        app.push 'master'
        app.push "${commit_id}"
    }
}
