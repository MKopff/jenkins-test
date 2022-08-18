package test;

import com.codeborne.selenide.Configuration;
import org.junit.jupiter.api.AfterAll;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.Test;
import org.openqa.selenium.By;

import static com.codeborne.selenide.Selenide.*;

//https://www.guru99.com/maven-jenkins-with-selenium-complete-tutorial.html

//https://www.lambdatest.com/blog/jenkins-integration-with-selenium-webdriver/
//https://www.seleniumeasy.com/maven-tutorials/how-to-execute-selenium-webdriver-testng-xml-using-maven
//https://automationtalks.com/2017/11/16/run-testng-xml-pom-xml-maven/

//  https://www.guru99.com/all-about-testng-and-selenium.html

//  https://www.baeldung.com/testng-run-command-line

public class Test1 {

    @BeforeAll
    public static void openProcess() {
        String url = "https://selenide.org/quick-start.html";
        Configuration.headless = true;
        open(url);
    }

    @AfterAll
    public static void closeProcess() {
        Configuration.holdBrowserOpen = true;
    }

    @Test
    public void test1() {
        System.out.println("TEST1");
        String test = $(By.id("start-writing-test")).getText();
        System.out.println("\n\n" + test + "\n\n");
    }

    @Test
    public void test2() {
        String test = $(By.id("for-maven-users")).getText();
        System.out.println("\n\n" + test + "\n\n");
    }
}
