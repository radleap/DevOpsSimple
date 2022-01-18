pipeline {
    agent any
    stages {
        stage("build") {
            steps {
                sh """
                    docker build -t hello_there .
                """
            }
        }
        stage("run") {
            when {
                branch 'main'
            }
            steps {
                sh """
                    docker run --rm hello_there
                """
            }
        }
    }
}
