properties([parameters([choice(choices: 'master\npipeline\nnew-branch', name: 'Branch')])])

node{
	
       def mvnhome = tool name: 'Maven', type: 'maven'
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
	 bat "docker.build("arvindgpt88/gupta123:release3")"
 }
 stage('Push to Docker Hub'){
         withDockerRegistry(credentialsId: 'new-docker', url: 'https://registry.hub.docker.com') {
         app.push("release3")
      }	 
 }
	 
 
}

