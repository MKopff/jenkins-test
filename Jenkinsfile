pipeline {
    agent any
    stages {
        stage('Test') {
            steps {
                echo "Hello World!"
                sh "echo Hello from the shell"
                sh "mvn test -Dtest='test.java.MyTest'"
            }
        }
    }
}