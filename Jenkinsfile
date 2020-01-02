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
	 bat "docker build -t arvindgpt88/gupta123:release4 ."
 }
 stage('Push to Docker Hub'){
         withCredentials([usernamePassword(credentialsId: 'new-docker', passwordVariable: 'PASSWORD', usernameVariable: 'USER')]) {
         def registry_url = "https://registry.hub.docker.com/"
	 bat "docker login -u $USER -p $PASSWORD ${registry_url}"
	 withDockerRegistry(credentialsId: 'new-docker', url: "${registry_url}") {
		 bat "docker push arvindgpt88/gupta123:release4"
	 }
      }	 
 }
	 
 
}

