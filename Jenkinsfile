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
                expression {
                    return env.GIT_BRANCH == "origin/main"
                }
            }
            steps {
                sh """
                    docker run --rm hello_there
                """
            }
        }
    }
}
