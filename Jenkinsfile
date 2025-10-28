pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/<your-username>/restful-api-tests.git'
            }
        }

        stage('Install Dependencies') {
            steps {
                sh 'pip install -r requirements.txt'
            }
        }

        stage('Run Tests') {
            steps {
                sh 'robot -d results tests/'
            }
        }

        stage('Publish Reports') {
            steps {
                publishHTML(target: [
                    allowMissing: false,
                    keepAll: true,
                    reportDir: 'results',
                    reportFiles: 'report.html',
                    reportName: 'Robot Framework Report'
                ])
            }
        }
    }

    post {
        always {
            archiveArtifacts artifacts: 'results/**', fingerprint: true
        }
    }
}