properties([parameters([choice(choices: 'master\npipeline\nnew-branch', name: 'Branch')])])

node{
	
 def mvnhome = tool name: 'Maven', type: 'maven'
    stage('SCM Checkout'){
    // Clone repo
	    git branch: "${params.Branch}", 
	url: 'https://github.com/Arvindgpt88/Master.git' 
 }
	
 stage('Maven Clean Package'){
	 bat "${mvnhome}/bin/mvn clean package"
	bat 'mv target/myweb*.war target/myweb.war'
 }
 
 stage('Build Docker Imager'){
   bat "docker build -t kammana/myweb:0.0.1 ."
 }
}

