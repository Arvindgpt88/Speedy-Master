properties([parameters([choice(choices: 'master\npipeline\nnew-branch\ntest', name: 'Branch')])])

node {
	
    withEnv(["DOCKER=${dockertool}/bin"]){
	def dockertool= tool name: 'Docker', type: 'org.jenkinsci.plugins.docker.commons.tools.DockerTool'
   
    stage('SCM Checkout'){
    // Clone repo
	    git branch: "${params.Branch}", 
	url: 'https://github.com/Arvindgpt88/Master.git' 
    }
	
     stage('Build image') {
        /* This builds the actual image; synonymous to
         * docker build on the command line */

	     dockerCmd build --tag {"getintodevops/hellonode"}
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
def dockerCmd(args) {
	sh "sudo ${DOCKER}/docker ${args}"
}

