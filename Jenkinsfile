
node {
   // This is to demo github action	
    def mvnhome = tool name: 'Maven', type: 'maven'
    stage('SCM Checkout'){
    // Clone repo
	git branch: 'master', 
	credentialsId: 'github', 
	url: 'https://github.com/javahometech/myweb'
   
   }
       
   stage('Mvn clean package'){
   // Build using maven
	   sh "${mvnhome}/bin/mvn clean package"
   }  
   
