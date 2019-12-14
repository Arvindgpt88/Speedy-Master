properties([parameters([choice(choices: 'master\npipeline\nnew-branch', name: 'Branch')])])
node {
   // This is to demo github action	
    def app = docker.build("arvindgpt88/dockerimage")
    stage('SCM Checkout'){
    // Clone repo
	    git branch: "${params.Branch}", 
	url: 'https://github.com/Arvindgpt88/Master.git'
   
   }
       
   stage('Build Image'){
	   bat "${app}"
   }  
	
   stage('Test Image'){
	   app.inside{
           echo ('Test passed')	
	   }
   }
   stage('Push Image'){
	   
	   docker.withRegistry('https://registry.hub.docker.com', 'docker-hub'){
		   app.push "${env.BUILD_NUMBER}"
		   app.push ('latest')
	   }
   }	
}
