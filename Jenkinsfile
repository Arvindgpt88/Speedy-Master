properties([parameters([choice(choices: 'master\npipeline\nnew-branch', name: 'Branch')])])

pipeline {
   agent {dockerfile true}
   stages {
              stage('SCM Checkout'){
                steps {
	         git branch: "${params.Branch}", 
	          url: 'https://github.com/Arvindgpt88/Master.git'
                      }
                 }
              stage('Docker build image'){
		     tool name: 'Docker', type: 'org.jenkinsci.plugins.docker.commons.tools.DockerTool'
	        steps{
                 docker { image 'node:7-alpine' }
                      }
                 }
              stage('Test') {
                steps {
                sh 'node --version'
                      }
                 }
    }
}

