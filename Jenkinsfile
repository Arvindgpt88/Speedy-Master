properties([parameters([choice(choices: 'master\npipeline\nnew-branch', name: 'Branch')])])

node{
	
       def mvnhome = tool name: 'Maven', type: 'maven'
	def dockerimage
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
	 dockerimage = docker.build("arvindgpt88/gupta123:wow")
 }
 stage('Push to Docker Hub'){
         withCredentials([usernamePassword(credentialsId: 'dockeridnew', passwordVariable: 'PASSWORDNEW', usernameVariable: 'USERNEW')]) {
         def registry_url = "https://docker.io/v1/"
	 bat "docker login -u $USERNEW -p $PASSWORDNEW ${registry_url}"
	 withDockerRegistry(credentialsId: 'dockeridnew', url: "${registry_url}") {
	   dockerimage.push()
	 }
      }	 
 }
	 
 
}

