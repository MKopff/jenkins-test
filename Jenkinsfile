pipeline {
    agent any
    stages {
        stage('Test') {
            steps {
                echo "Hello World!"
                bat "echo Hello from the shell..."
//                 https://cwiki.apache.org/confluence/display/MAVEN/MissingProjectException
//                 bat "mvn -f C:\\Users\\FREUN\\Videos\\docker\\selenide test -Dtest='test.java.MyTest' -f C:\\Users\\FREUN\\Videos\\docker\\selenide"
//                 bat "mvn -f C:\Users\FREUN\Videos\docker\selenide test -Dtest='test.java.MyTest' -f C:\Users\FREUN\Videos\docker\selenide"
                bat "mvn -f C:\\Users\\FREUN\\Videos\\docker\\selenide test -Dtest='test.java.MyTest' -f C:\\Users\\FREUN\\Videos\\docker\\selenide"
            }
        }
    }
}

