pipeline {
    agent any
    stages {
        stage('Test') {
            steps {
                echo "Hello World!"
                bat "echo Hello from the shell..."
                bat "cd C:\\Users\\FREUN\\Videos\\docker\\selenide"
                bat "mvn test -Dtest='test.java.MyTest'"
            }
        }
    }
}