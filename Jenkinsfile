pipeline {
  agent any
  stages {
    stage('Checkout code') {
      steps {
        git(url: 'https://github.com/MKopff/jenkins-test', branch: 'master')
      }
    }

  }
  parameters {
    booleanParam(name: 'Test1', defaultValue: false, description: 'launch Test1 class')
    booleanParam(name: 'Test2', defaultValue: false, description: 'launch Test2 class')
    booleanParam(name: 'Test3', defaultValue: false, description: 'launch Test3 class')
  }
}