pipeline {
    agent any
    stages {
        stage('Test') {
            steps {
                echo "Hello World!"
                bat "echo Hello from the shell..."
//                 https://cwiki.apache.org/confluence/display/MAVEN/MissingProjectException - it helped me to choose the right path
                bat "mvn -f C:\\Users\\FREUN\\Videos\\docker\\selenide test -Dtest='test.java.MyTest'"
            }
        }
    }
}

