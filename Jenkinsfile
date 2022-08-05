// pipeline {
//     agent any
//     stages {
//         stage('Test') {
//             steps {
//                 echo "Hello World!"
//                 bat "echo Hello from the shell..."
//                 bat "mvn test -Dtest=\"test.java.MyTest\"" // run the first step in particular (not all of the tests at once)
//             }
//         }
//     }
// }

pipeline {
    agent any
    parameters {
        booleanParam(name: "MyTest",
                defaultValue: false,
                description: "launch MyTest class"
        )
        booleanParam(name: "Test2",
                defaultValue: false,
                description: "launch Test2 class"
        )
    }
}

stage("run tests") {

    steps {
        echo "Hello World!"

        if(params.MyTest) {
            bat "mvn test -Dtest=\"test.java.MyTest\""
        }

        if(params.Test2) {
            bat "mvn test -Dtest=\"test.java.Test2\""
        }
    }
}