pipeline {
    agent any
    stages {
        stage('Test') {
            steps {
                echo "Hello World!"
                bat "echo Hello from the shell..."
                bat "cd C:\\Users\\FREUN\\Videos\\docker\\selenide"
                bat "echo cd step is made"
                bat "mvn test -Dtest='test.java.MyTest"

//                 https://cwiki.apache.org/confluence/display/MAVEN/MissingProjectException
//                 bat "mvn -f C:\\Users\\FREUN\\Videos\\docker\\selenide test -Dtest='test.java.MyTest' -f C:\\Users\\FREUN\\Videos\\docker\\selenide"
//                 bat "mvn -f C:\Users\FREUN\Videos\docker\selenide test -Dtest='test.java.MyTest' -f C:\Users\FREUN\Videos\docker\selenide"
//                 bat "mvn -f C:\\Users\\FREUN\\Videos\\docker\\selenide test -Dtest='test.java.MyTest' -f C:\\Users\\FREUN\\Videos\\docker\\selenide"
            }
        }
    }
}

