properties([parameters([choice(choices: 'master\npipeline\nnew-branch', name: 'Branch')])])

node{
	
       def mvnhome = tool name: 'Maven', type: 'maven'
	def dockerImage
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
	 dockerImage = docker.build("arvindgpt88/gupta123:scratchit")
 }
 stage('Push to Docker Hub'){
        withDockerRegistry(credentialsId: 'dockeridnew', url: "https://index.docker.io/v1/") {
	   dockerImage.push("scratchit")
	}
      }	 
 
	 
 
}

