properties([parameters([choice(choices: 'master\npipeline\nnew-branch', name: 'Branch')])])

pipeline {
	agent {
   // This is to demo github action		
    tool name: 'Docker', type: 'org.jenkinsci.plugins.docker.commons.tools.DockerTool'
    
    stage('SCM Checkout'){
        steps {
	    git branch: "${params.Branch}", 
	url: 'https://github.com/Arvindgpt88/Master.git'
    }
    }
    stage('Docker build image'){
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

