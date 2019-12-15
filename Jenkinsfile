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
	 bat "${dochome}/docker build -t kammana/myweb:0.0.1 ."
 }
}

