properties([parameters([choice(choices: 'master\npipeline\nnew-branch\ntest', name: 'Branch')])])

 def dockerCmd(args) {
    sh "sudo ${DOCKER}/docker ${args}"
    }

node {
	
    def dockertoolbox = tool name: 'Docker', type: 'org.jenkinsci.plugins.docker.commons.tools.DockerTool'
    withEnv(["DOCKER=${dockerTool}/bin"])
   
    stage('SCM Checkout'){
    // Clone repo
	    git branch: "${params.Branch}", 
	url: 'https://github.com/Arvindgpt88/Master.git' 
    }
	
     stage('Build image') {
        /* This builds the actual image; synonymous to
         * docker build on the command line */

        dockerCmd 'build --tag getintodevops/hellonode:SNAPSHOT .'
    }
     
    stage('Push to Docker Hub'){
           withCredentials([usernamePassword(credentialsId: 'Docker-hub', passwordVariable: 'passwd', usernameVariable: 'user')]) {
		   sh docker login -u arvindgpt88 -p ${passwd} {
			 docmerCmd push "${env.BUILD_NUMBER}"
			 dockerCmd push ("latest")
         }
	 }
    }
   }

