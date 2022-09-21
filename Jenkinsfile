pipeline {
    agent any
    parameters {
       booleanParam(name: 'Test1', defaultValue: false, description: 'launch Test1 class')
       booleanParam(name: 'Test2', defaultValue: false, description: 'launch Test2 class')
       booleanParam(name: 'Test3', defaultValue: false, description: 'launch Test3 class')
    }

    stages {
        stage('Checkout code') {
          steps {
            git(url: 'https://github.com/MKopff/jenkins-test', branch: 'master')
          }
        }

        stage("run tests") {
            steps {
                script {
                //"-it" - docker interactive mode doesn't work here (at least on Windows)
                    if(params.Test1) {
                        bat "docker exec prototype sh -c \"mvn -Dtest=test/Test1 test\""
//                         docker exec -it prototype sh -c "mvn -Dtest=test/Test1 test"
                    }
                    if(params.Test2) {
                        bat "docker exec -it prototype sh -c \"mvn -Dtest=test/Test2 test\""
                    }
                    if(params.Test3) {
                        bat "docker exec -it prototype sh -c \"mvn -Dtest=test/Test3 test\""
                    }
                }
            }
        }
    }
}



