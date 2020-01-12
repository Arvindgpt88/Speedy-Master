properties([parameters([choice(choices: 'master\npipeline\nnew-branch\ndocker', name: 'Branch')])])

node{
	
       def mvnhome = tool name: 'Maven', type: 'maven'
	def dockerImage
       tool name: 'DOCKER_TOOLBOX_INSTALL_PATH', type: 'org.jenkinsci.plugins.docker.commons.tools.DockerTool'
    stage('SCM Checkout'){
    // Clone repo
	    git branch: "${params.Branch}", 
	url: 'https://github.com/Arvindgpt88/Master.git' 
 }
	
 stage('Build Docker Imager'){
	 dockerImage = docker.build("arvindgpt88/gupta123:nginx")
 }
 stage('Push to Docker Hub'){
        withDockerRegistry(credentialsId: 'dockeridnew', url: "https://index.docker.io/v1/") {
	   dockerImage.push("nginx")
	}
      }	 
 
stage('kube-deploy'){
	kubernetesDeploy{
		configs: 'kubefile.yml',
		kubeconfigId: 'kubernetes_config',
		dockerCredentials: [[credentialsId: 'testdocker', url: 'https://index.docker.io/v1/']]
        }
      }
}
