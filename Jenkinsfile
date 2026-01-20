pipeline {
    agent any
    stages {
        stage('Install DEB') {
            steps {
                sh 'sudo dpkg -i deb/file-counter.deb || true'
            }
        }
        stage('Install RPM') {
            steps {
                sh 'sudo rpm -i rpm/RPMS/noarch/file-counter-1.0-1.noarch.rpm || true'
            }
        }
        stage('Run Script') {
            steps {
                sh '/usr/local/bin/file-counter'
            }
        }
    }
}

