properties([parameters([choice(choices: 'master\npipeline\nnew-branch', name: 'Branch')])])

node{
	
 def dochome = tool name: 'Docker', type: 'org.jenkinsci.plugins.docker.commons.tools.DockerTool'
    stage('SCM Checkout'){
    // Clone repo
	    git branch: "${params.Branch}", 
	url: 'https://github.com/Arvindgpt88/Master.git' 
 }
	
    stage('Build Docker Image'){
	  "${BASH_SH} docker build -t arvindgpt88/hello-docker-app.jar ."
 }
 stage('Push to Docker Hub'){
 
	 withCredentials([usernamePassword(credentialsId: 'Docker-hub', passwordVariable: 'passwd', usernameVariable: 'user')]) {
		 "${BASH_SH} docker login -u arvindgpt88 -p ${passwd}"
     }
	 "${BASH_SH} docker push arvindgpt88/hello-docker-app.jar"
 }
}
