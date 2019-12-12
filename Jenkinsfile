
node {
   // This is to demo github action	
    def mvnhome = tool name: 'Maven', type: 'maven'
    stage('SCM Checkout'){
    // Clone repo
	git branch: 'master', 
	credentialsId: 'github', 
	url: 'https://github.com/Arvindgpt88/Master.git'
   
   }
       
   stage('Mvn clean test'){
   // Build using maven
	   sh "${mvnhome}/bin/mvn clean test"
   }  
   
