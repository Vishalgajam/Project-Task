pipeline {
    agent any

    stages {
        stage('Build Docker Image') {
            steps {
                script {
                    docker.build("myapp")
                }
            }
        }

        stage('Provision Cloud Storage') {
            steps {
                script {
                    sh 'terraform init'
                    sh 'terraform apply -auto-approve'
                }
            }
        }

        stage('Download Data') {
            steps {
                sh 'docker run --rm -v "$(pwd):/app" myapp'
            }
        }

        stage('Store to Cloud Storage') {
            steps {
                sh 'aws s3 cp weather_data.json s3://$(terraform output -raw project_bucket)/'
            }
        }

        stage('Extract Data') {
            steps {
                sh './data_extractor.sh'
            }
        }

        stage('Generate HTML') {
            steps {
                sh './html_generator.sh'
            }
        }

        stage('Deploy HTML') {
            steps {
                // Example deployment step, adjust as needed
                sh 'scp prague_weather.html username@project.com:/var/www/html'
            }
        }

    }
}
