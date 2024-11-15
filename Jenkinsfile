pipeline {
    agent any
    environment { 
        VIRTUAL_ENV = 'venv' 
        IMAGE_NAME = "my-app-image"
        CONTAINER_NAME = "my-app-container"
        PORT = 3001
    }
    stages {
        stage('Setup') {
            steps {
                script {
                    sh 'chmod +x deploy.sh'
                    def dockerHome = tool 'myDocker'
                    env.PATH = "${dockerHome}/bin:${env.PATH}"
                    if (!fileExists("${env.WORKSPACE}/${VIRTUAL_ENV}")) { 
                        sh "python3 -m venv ${VIRTUAL_ENV}"
                    }
                    sh "source ${VIRTUAL_ENV}/bin/activate && pip install -r requirements.txt"
                }
            }
        }
        stage('Lint') {
            steps {
                script {
                    sh "source ${VIRTUAL_ENV}/bin/activate && flake8 app.py"
                }
            }
        }
        stage('Test') {
            steps {
                script {
                    sh "source ${VIRTUAL_ENV}/bin/activate && pytest"
                }
            }
        }
        stage('Coverage') {
            steps {
                script {
                    sh "source ${VIRTUAL_ENV}/bin/activate && coverage run -m pytest"
                    sh "source ${VIRTUAL_ENV}/bin/activate && coverage report"
                }
            }
        }
        stage('Security Scan') {
            steps {
                script {
                    sh "source ${VIRTUAL_ENV}/bin/activate && bandit -r . -x ./${VIRTUAL_ENV}"
                }
            }
        }
        stage('Deploy') {
            steps {
                script {
                    // sh './deploy.sh'
                    // Stop and remove any existing container with the same name
                    sh "docker stop ${CONTAINER_NAME} || true"
                    sh "docker rm ${CONTAINER_NAME} || true"
                    
                    // Build the Docker image
                    sh "docker build -t ${IMAGE_NAME} ."
                    
                    // Run the Docker container
                    sh "docker run -d --name ${CONTAINER_NAME} -p ${PORT}:3001 ${IMAGE_NAME}"
                }
            }
        }
    }
    post { 
        always {
            cleanWs()
        }
    }
}
