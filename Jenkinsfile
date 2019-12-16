properties([parameters([choice(choices: 'master\npipeline\nnew-branch\ntest', name: 'Branch')])])

node {
	
    def dockertool= tool name: 'Docker', type: 'org.jenkinsci.plugins.docker.commons.tools.DockerTool'
    withEnv(["DOCKER=${dockertool}/bin"]){
   
    stage('SCM Checkout'){
    // Clone repo
	    git branch: "${params.Branch}", 
	url: 'https://github.com/Arvindgpt88/Master.git' 
    }
	
     stage('Build image') {
        /* This builds the actual image; synonymous to
         * docker build on the command line */

        docker build --tag getintodevops/hellonode:1
    }
     
    stage('Push to Docker Hub'){
           withCredentials([usernamePassword(credentialsId: 'Docker-hub', passwordVariable: 'passwd', usernameVariable: 'user')]) {
		   dockerCmd docker login -u arvindgpt88 -p ${passwd} {
			 docmerCmd push "${env.BUILD_NUMBER}"
			 dockerCmd push ("latest")
         }
	 }
    }
   }
   }

