pipeline {
	agent { label 'Linux_slave1'}
         stages {
             
             
             stage("Git Checkout"){
        steps{
          git branch: 'main', url: 'https://github.com/devopsgittesting/jenkins-git-docker-slave-pipeline.git'
        }
      }
               
        stage('Docker Build'){
            steps{
                sh "docker build . -t devopstest777/apacheserverimage:latest "
            }
        }
                 
                 
            
        stage('DockerHub Push'){
            steps{
                withCredentials([string(credentialsId: 'docker_pwd', variable: 'dockerHubPwd')]) {
                    sh "docker login -u devopstest777 -p ${dockerHubPwd}"
                }
	    }}
                 stage('Create container') {
                 steps {
                      docker run -d -p 8080:80 - name my-tomcat-app devopstest777/apacheserverimage:latest
                 }
                 }
     
	 }
		post {
		always
			{
			sh 'docker logout'
			}
		}
	
	}
