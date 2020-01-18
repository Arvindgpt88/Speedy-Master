properties([parameters([choice(choices: 'master\npipeline\nnew-branch\ndocker', name: 'Branch')])])

node{
	
    stage('SCM Checkout'){
    // Clone repo
	    git branch: "${params.Branch}", 
	url: 'https://github.com/Arvindgpt88/Master.git' 
 }
	
    stage('kube-deploy'){
	kubernetesDeploy configs: 'Service.yml', dockerCredentials: [[credentialsId: 'testdocker', url: 'https://index.docker.io/v1/']], kubeconfigId: 'kubernetes_config'
        
      }
}
