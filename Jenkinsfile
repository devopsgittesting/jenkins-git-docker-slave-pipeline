pipeline {
         agent any
         stages {
             
             
             stage("Git Checkout"){
        steps{
          git branch: 'main', url: 'https://github.com/devopsgittesting/jenkins-git-ansible-docker-pipeline.git'
        }
      }
             
                 stage('Pull Image') {
                 steps {
                     echo 'Hi, this is Build Stage one'
                ansiblePlaybook credentialsId: 'private-key', disableHostKeyChecking: true, installation: 'ansible2', inventory: 'dev.inv', playbook: 'pull_image.yml'
                 }}
                 
                 
                 
                    stage('custom image build') {
                 steps {
                    ansiblePlaybook credentialsId: 'private-key', disableHostKeyChecking: true, installation: 'ansible2', inventory: 'dev.inv', playbook: 'custom_image.yml'
                 }
                    }      
               
                 
                 stage('Create container') {
                 steps {
         ansiblePlaybook credentialsId: 'private-key', disableHostKeyChecking: true, installation: 'ansible2', inventory: 'dev.inv', playbook: 'create_container.yml'
                 }
                 }
                 
                  stage('DockerHub Push'){
            steps{
                     withCredentials([string(credentialsId: 'docker_pwd', variable: 'dockerid')]) {
                     sh "docker login -u devopstest777 -p ${dockerid}"
                }
                
                 sh "docker push devopstest777/webserverimage"       
		    sh 'docker images'
            
            }}
    
         }

post {
		always {
			sh 'docker logout'
		}
	}

}
