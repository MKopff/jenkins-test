

pipeline {
    agent any
    parameters {
        booleanParam(name: "Test1",
                defaultValue: false,
                description: "launch Test1 class"
        )
        booleanParam(name: "Test2",
                defaultValue: false,
                description: "launch Test2 class"
        )
        booleanParam(name: "Test3",
                defaultValue: false,
                description: "launch Test3 class"
        )
    }

    stages {
        stage("run tests") {
            steps {
                script {
                    if(params.Test1) {
//                         bat "docker exec -ti prototype sh -c \"mvn -Dtest=test/Test1 test\""
//                         docker exec -ti prototype sh -c "mvn -Dtest=test/Test1 test" bash
                        bat "mvn clean test"
                    }

                    if(params.Test2) {
                        bat "docker exec -ti prototype sh -c \"mvn -Dtest=test/Test2 test\""
                    }
                    if(params.Test3) {
                        bat "docker exec -ti prototype sh -c \"mvn -Dtest=test/Test3 test\""
                    }
                }
            }
        }
    }
}



