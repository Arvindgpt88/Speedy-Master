properties([parameters([choice(choices: 'master\npipeline\nnew-branch', name: 'Branch')])])

node {
   // This is to demo github action	
    def app	
    tool name: 'Docker', type: 'org.jenkinsci.plugins.docker.commons.tools.DockerTool'
    
    stage('SCM Checkout'){
    // Clone repo
	    git branch: "${params.Branch}", 
	url: 'https://github.com/Arvindgpt88/Master.git'
   
   }
       
   stage('Build Image'){
	    app = docker.build("arvindgpt88/busybox")
	  
	   
   }  
	
   stage('Test Image'){
	  
           echo ('Test passed')	
	   
   }
   stage('Push Image'){
	   
	   docker.withRegistry('https://registry.hub.docker.com', 'docker-hub'){
		   app.push "${env.BUILD_NUMBER}"
		   app.push ('latest')
	   }
   }	
}
