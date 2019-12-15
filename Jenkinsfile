properties([parameters([choice(choices: 'master\npipeline\nnew-branch', name: 'Branch')])])

node{
 stage('Git Checkout'){
	git 'https://github.com/javahometech/my-app'  
 }
 stage('Maven Package'){
	sh 'mvn clean package'
	sh 'mv target/myweb*.war target/myweb.war'
 }
 
 stage('Build Docker Imager'){
   sh 'docker build -t kammana/myweb:0.0.1 .'
 }
 
 stage('Push to Docker Hub'){
 
	 withCredentials([string(credentialsId: 'github-pwd', variable: 'dockerHubPwd')]) {
        sh "docker login -u kammana -p ${dockerHubPwd}"
     }
	 sh 'docker push kammana/myweb:0.0.1'
 }

