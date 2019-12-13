
node {
   // This is to demo github action	
    def mvnhome = tool name: 'Maven', type: 'maven'
    properties([parameters([choice(choices: master\n pipeline, description: '', name: 'Branch')])])
    stage('SCM Checkout'){
       
   }
       
   stage('Mvn clean test'){
   // Build using maven
	   bat "${mvnhome}/bin/mvn clean test"
   }  
	
   stage('Mvn compile package'){
		bat "${mvnhome}/bin/mvn compile package"
   }	
}
