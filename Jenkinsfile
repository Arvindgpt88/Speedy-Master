properties([parameters([choice(choices: 'master\npipeline\nnew-branch\ntest', name: 'Branch')])])

node {
        
    def dockertool= tool name: 'DOCKER_TOOLBOX_INSTALL_PATH', type: 'org.jenkinsci.plugins.docker.commons.tools.DockerTool'
     
     stage('SCM Checkout'){
    // Clone repo
	    git url: 'https://github.com/Arvindgpt88/Master.git'

     }    
     stage('Docker Build image') {
	    sh docker build arvindgpt88/nodeapp
       
     }   
}

