

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
//             agent {
//                 docker {
//                     image 'prototype'
//                     // Run the container on the node specified at the
//                     // top-level of the Pipeline, in the same workspace,
//                     // rather than on a new node entirely:
//                     reuseNode true
//                 }
            steps {
                script {
                    if(params.Test1) {
//                         bat "docker exec -it prototype sh -c \"mvn -Dtest=test/Test1 test\""
                        bat "winpty docker exec -it heuristic_germain sh -c \"mvn -Dtest=test/Test1 test\""
//                         docker exec -ti prototype sh -c "mvn -Dtest=test/Test1 test" bash
//                         bat "mvn clean test"

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



