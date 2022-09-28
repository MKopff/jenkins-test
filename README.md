изменения

## Discription

```
https://www.browserstack.com/guide/run-selenium-tests-in-docker - may be shit
https://www.testingdocs.com/run-selenium-test-on-docker-container/ - may work


The Ideas I have found so far:
 - selenium/standalone-chrome Docker image to run a test on Google Chrome Browser
 
 Th
 -https://medium.com/@ahamedabdulrahman/dockerize-selenium-java-project-and-run-selenium-scripts-within-docker-container-c2603d1bac3f 
 
 SELENOID? 
 https://hub.docker.com/r/aerokube/selenoid/ 
 https://aerokube.com/selenoid/
 https://aerokube.com/selenoid/latest/


usefull articles 
    https://stackoverflow.com/questions/70955307/how-to-install-google-chrome-in-a-docker-container
    https://migueldoctor.medium.com/how-to-create-a-custom-docker-image-with-jdk8-maven-and-gradle-ddc90f41cee4


Docker + docker compose for selenium tests:
https://medium.com/@zvisno/running-selenium-tests-with-docker-a484186cd3d    
```

## Run tests from command line
```
Для сборки тестовых классов из командной строки (нужно для Jenkins) используются комманды: 

mvn -Dtest=test/Test1 test
mvn -Dtest=test/Test2 test
mvn -Dtest=test/Test3 test

            
```

## Working with docker container
```
To build the docker image (dot at the end is mandatory):
    docker build -t prototype .

To run the docker image:
    docker run -it prototype
    docker run -it --name prototype prototype    - this command assigns name to a container 
                                                   and runs it in the interactive mode
                                                   docker run -it --name container_name image_name
https://www.tecmint.com/name-docker-containers/#:~:text=How%20to%20Name%20a%20Docker,print%20the%20new%20container%20ID.


it may be useful???
Once the execution is completed, the reports would have got created withing the Docker Container. 
To copy the file from Docker Container to our local system, we need to use “docker cp”. 
Before that, we need to exit from the Docker Container. Just use ‘exit’ command. 
Then, run the following command:
    
    docker cp c345621:/app/test-output test-output

where, c345621 is the docker container id which we can see using ‘docker ps’ command.

```

## Running commands in an existing container
```
read here: https://docs.docker.com/engine/reference/commandline/exec/ 

Commands: 
    docker exec -ti prototype sh -c "mvn -Dtest=test/Test1 test"
    docker exec -ti prototype sh -c "mvn -Dtest=test/Test2 test"
    docker exec -ti prototype sh -c "mvn -Dtest=test/Test3 test"
```

##Useful articles
```dbn-psql
https://www.infoworld.com/article/3123117/open-source-java-projects-jenkins-with-docker-part-1.html
https://www.infoworld.com/article/3637829/continuous-integration-with-docker-and-jenkins.html 
```
