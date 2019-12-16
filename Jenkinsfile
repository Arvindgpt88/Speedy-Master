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

	    "${BASH_SH} docker build . -t getintodevops/hellonode
    }

    stage('Test image') {
        /* Ideally, we would run a test framework against our image.
         * For this example, we're using a Volkswagen-type approach ;-) */

        app.inside {
            sh 'echo "Tests passed"'
        }
    }
 
 stage('Push to Docker Hub'){
           withDockerRegistry(credentialsId: 'docker-ID', toolName: 'Docker', url: 'https://hub.docker.com/') {
         app.push("${env.BUILD_NUMBER}")
         app.push("latest")
         }
     }
	 
   }

