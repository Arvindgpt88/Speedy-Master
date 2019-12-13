
node {
   // This is to demo github action	
    def mvnhome = tool name: 'Maven', type: 'maven'
    def branchname = branches: [[name: '*/master'], [name: '*/pipeline']]
    stage('SCM Checkout'){
    // Clone repo
	    checkout([$class: 'GitSCM', "${branchname}", doGenerateSubmoduleConfigurations: false, extensions: [], submoduleCfg: [], userRemoteConfigs: [[url: 'https://github.com/Arvindgpt88/Master.git']]])
   }
       
   stage('Mvn clean test'){
   // Build using maven
	   bat "${mvnhome}/bin/mvn clean test"
   }  
	
   stage('Mvn compile package'){
		bat "${mvnhome}/bin/mvn compile package"
   }	
}
