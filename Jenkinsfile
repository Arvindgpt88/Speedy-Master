properties([parameters([choice(choices: 'master\npipeline\nnew-branch\ntest', name: 'Branch')])])

node {
	
    def dockertoolbox = tool name: 'Docker', type: 'org.jenkinsci.plugins.docker.commons.tools.DockerTool'
	withEnv(["DOCKER=${dockerTool}/bin"])
    def app
    stage('SCM Checkout'){
    // Clone repo
	    git branch: "${params.Branch}", 
	url: 'https://github.com/Arvindgpt88/Master.git' 
    }
	
     stage('Build image') {
        /* This builds the actual image; synonymous to
         * docker build on the command line */

        app = docker.build("getintodevops/hellonode")
    }
     
    stage('Push to Docker Hub'){
           withCredentials([usernamePassword(credentialsId: 'Docker-hub', passwordVariable: 'passwd', usernameVariable: 'user')]) {
		   sh docker login -u arvindgpt88 -p ${passwd} {
			 app.push("${env.BUILD_NUMBER}"
			 app.push("latest")
         }
	 }
    }
   }

