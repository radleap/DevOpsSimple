pipeline {
    agent any
    environment {
        DOCKERHUB_CREDS=credentials('dockerhub-credentials')
    }
    stages {
        stage("build") {
            steps {
                sh """
                    docker build -t radleap/hello_there:latest .
                """
            }
        }
        stage('Login') {
            steps {
                sh 'echo $DOCKERHUB_CREDS_PSW | docker login -u $DOCKERHUB_CREDS_USR --password-stdin'
            }
        }
        stage('Push') {
            steps {
                sh 'docker push radleap/hello_there:latest'
            }
        }
        stage("run") {
            when {
                expression {
                    return env.GIT_BRANCH == "origin/main"
                }
            }
            steps {
                sh """
                    docker run --rm radleap/hello_there:latest
                """
            }
        }
    }
    	post {
            always {
                sh 'docker logout'
            }
	}
}