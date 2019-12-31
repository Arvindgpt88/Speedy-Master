properties([parameters([choice(choices: 'master\npipeline\nnew-branch', name: 'Branch')])])

node{
	
       def mvnhome = tool name: 'Maven', type: 'maven'
	def app
       tool name: 'DOCKER_TOOLBOX_INSTALL_PATH', type: 'org.jenkinsci.plugins.docker.commons.tools.DockerTool'
    stage('SCM Checkout'){
    // Clone repo
	    git branch: "${params.Branch}", 
	url: 'https://github.com/Arvindgpt88/Master.git' 
 }
	
 stage('Maven Clean Package'){
	 bat "${mvnhome}/bin/mvn clean package"
	
 }
 
 stage('Build Docker Imager'){
	 app = docker.build("arvindgpt88/microsoft")
 }
 stage('Push to Docker Hub'){
         withDockerRegistry(credentialsId: 'Docker-hub', toolName: 'DOCKER_TOOLBOX_INSTALL_PATH', url: 'https://registry.hub.docker.com') {
         app.push("arvindgpt88/myweb:0.0.7")
      }	 
 }
	 
 
}

