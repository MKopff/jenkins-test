## Discription

```
Проект написан на Java 1.8. во избжании проблем с аудитом компанией Oracal
https://habr.com/ru/post/424579/ 

Полезные статьи: 
https://www.baeldung.com/junit-run-from-command-line - запуск автотестов через мавен в командной строке

```

## Run tests from command line
```
Для сборки тестовых классов из командной строки (нужно для Jenkins) используются комманды: 

mvn -Dtest=test/Test1 test
mvn -Dtest=test/Test2 test
mvn -Dtest=test/Test3 test

            
```

