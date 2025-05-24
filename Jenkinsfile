pipeline {
    agent any

    environment {
        IMAGE_NAME = "calculator-app"
        CONTAINER_NAME = "calculator-container"
    }

    stages {
        stage('Clone Repository') {
            steps {
                echo 'Cloning project...'
            }
        }

        stage('Build Docker Image') {
            steps {
                echo 'Building Docker image...'
                sh 'docker build -t $IMAGE_NAME .'
            }
        }

        stage('Stop Previous Container') {
            steps {
                echo 'Stopping and removing previous container if exists...'
                sh '''
                    docker stop $CONTAINER_NAME || true
                    docker rm $CONTAINER_NAME || true
                '''
            }
        }

        stage('Run New Container') {
            steps {
                echo 'Running new container...'
                sh 'docker run -d -p 8090:8080 --name $CONTAINER_NAME $IMAGE_NAME'
            }
        }
    }

    post {
        failure {
            echo 'Something went wrong!'
        }
    }
}

