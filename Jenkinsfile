pipeline {
    agent any
    
    environment {
        // Nama image Docker yang digunakan
        DOCKER_IMAGE = "my-web"
    }

    stages {
        stage('Checkout') {
            steps {
                // Checkout kode dari repository
                checkout scm
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    // Build Docker image hanya untuk branch `main` atau `development`
                    if (env.BRANCH_NAME == 'main' || env.BRANCH_NAME == 'development') {
                        echo "Building Docker image for ${env.BRANCH_NAME}"
                        // Perintah untuk build Docker image
                        sh 'docker build -t $DOCKER_IMAGE .'
                    }
                }
            }
        }

        stage('Deploy with Nginx (Localhost)') {
            steps {
                script {
                    // Deploy aplikasi dengan Docker di Localhost
                    if (env.BRANCH_NAME == 'main' || env.BRANCH_NAME == 'development') {
                        echo "Deploying Docker container for ${env.BRANCH_NAME}"
                        // Perintah untuk menjalankan container Nginx di localhost
                        sh 'docker run -d -p 80:80 $DOCKER_IMAGE'
                    }
                }
            }
        }
    }

    post {
        success {
            // Pesan jika build dan deploy berhasil
            echo "Build and Deploy ${env.BRANCH_NAME} branch successful!"
        }
        failure {
            // Pesan jika build atau deploy gagal
            echo "Build or Deploy failed for ${env.BRANCH_NAME} branch."
        }
    }
}
