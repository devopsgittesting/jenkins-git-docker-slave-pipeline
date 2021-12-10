pipeline {
	agent { label 'Linux_slave1'}
         stages {
             
             
             stage("Git Checkout"){
        steps{
          git branch: 'main', url: 'https://github.com/devopsgittesting/jenkins-git-ansible-docker-pipeline.git'
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
                 
                 stage('Create container') {
                 steps {
         ansiblePlaybook credentialsId: 'private-key', disableHostKeyChecking: true, installation: 'ansible2', inventory: 'dev.inv', playbook: 'create_container.yml'
                 }
                 }
     
	 }}
