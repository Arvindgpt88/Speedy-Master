properties([parameters([choice(choices: 'master\npipeline\nnew-branch', name: 'Branch')])])

node{
	
 def mvnhome = tool name: 'Maven', type: 'maven'
 def dochome = tool name: 'Docker', type: 'org.jenkinsci.plugins.docker.commons.tools.DockerTool'
    stage('SCM Checkout'){
    // Clone repo
	    git branch: "${params.Branch}", 
	url: 'https://github.com/Arvindgpt88/Master.git' 
 }
	
 stage('Maven Clean Package'){
	 bat "${mvnhome}/bin/mvn clean package"
	
 }
 
 stage('Build Docker Imager'){
	  "${BASH_SH} docker build -t kammana/myweb:0.0.1 ."
 }
 stage('Push to Docker Hub'){
 
	 withCredentials([string(credentialsId: 'CRED' , variable: 'pass')]) {
		 "${BASH_SH} docker login -u arvindgpt88 -p ${pass}"
     }
	 "${BASH_SH} docker push kammana/myweb:0.0.1"
 }
}

