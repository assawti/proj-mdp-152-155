pipeline {
    agent any

    environment {
        IMAGE_NAME = "webappcal"
        CONTAINER_NAME = "webappcal-container"
    }

    stages {
        stage('Clone Repository') {
            steps {
                echo 'Cloning project...'
                // Assuming Jenkins will pull this from GitHub if hosted
            }
        }

        stage('Build Docker Image') {
            steps {
                echo "Building Docker image..."
                sh 'docker build -t $IMAGE_NAME .'
            }
        }

        stage('Stop Previous Container') {
            steps {
                echo "Stopping existing container if exists..."
                sh '''
                docker rm -f $CONTAINER_NAME || true
                '''
            }
        }

        stage('Run New Container') {
            steps {
                echo "Starting container..."
                sh '''
                docker run -d -p 8080:8081 --name $CONTAINER_NAME $IMAGE_NAME
                '''
            }
        }
    }

    post {
        success {
            echo "Deployment complete. App should be live on port 8080."
        }
        failure {
            echo "Something went wrong!"
        }
    }
}

