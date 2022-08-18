// pipeline {
//     agent any
//     stages {
//         stage('Test') {
//             steps {
//                 echo "Hello World!"
//                 bat "echo Hello from the shell..."
//                 bat "mvn test -Dtest=\"MyTest\"" // run the first step in particular (not all of the tests at once)
//             }
//         }
//     }
// }

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
                        bat "mvn -Dtest=test/Test1 test"
                    }

                    if(params.Test2) {
                        bat "mvn -Dtest=test/Test1 test"
                    }
                    if(params.Test3) {
                        bat "mvn -Dtest=test/Test1 test"
                    }
                }
            }
        }
    }
}



