
node {
   // This is to demo github action	
    def mvnhome = tool name: 'Maven', type: 'maven'
    stage('SCM Checkout'){
    // Clone repo
	git branch: 'master', 
	url: 'https://github.com/Arvindgpt88/Master.git'
   
   }
       
   stage('Mvn clean test'){
   // Build using maven
	   bat "${mvnhome}/bin/mvn clean test"
   }  
	
   stage('Mvn compile package'){
		sh "${mvnhome}/bin/mvn compile package"
   }	
}
