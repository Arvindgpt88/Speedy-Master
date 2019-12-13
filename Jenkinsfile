
node {
   // This is to demo github action	
    def mvnhome = tool name: 'Maven', type: 'maven'
    properties([parameters([choice(choices: 'master\npipeline', name: 'Branch')])])
    stage('SCM Checkout'){
       git branch: "${params.Branch}", url: 'https://github.com/Arvindgpt88/Master.git'
   }
       
   stage('Mvn clean test'){
   // Build using maven
	   bat "${mvnhome}/bin/mvn clean test"
   }  
	
   stage('Mvn compile package'){
		bat "${mvnhome}/bin/mvn compile package"
   }	
}
