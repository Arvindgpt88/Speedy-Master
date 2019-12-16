properties([parameters([choice(choices: 'master\npipeline\nnew-branch\ntest', name: 'Branch')])])

node {
	
    def dochome = tool name: 'Docker', type: 'org.jenkinsci.plugins.docker.commons.tools.DockerTool'
    def app
    stage('SCM Checkout'){
    // Clone repo
	    git branch: "${params.Branch}", 
	url: 'https://github.com/Arvindgpt88/Master.git' 
    }
	
    stage('Build image') {
        /* This builds the actual image; synonymous to
         * docker build on the command line */

	    "${BASH_SH} docker build . -t getintodevops/hellonode"
    }
     
    stage('Push to Docker Hub'){
           withCredentials([usernamePassword(credentialsId: 'Docker-hub', passwordVariable: 'passwd', usernameVariable: 'user')]) {
		 "${BASH_SH} docker login -u arvindgpt88 -p ${passwd}" {
         app.push("${env.BUILD_NUMBER}")
         app.push("latest")
         }
         }
    }
   }

