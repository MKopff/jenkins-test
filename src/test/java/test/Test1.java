package test;

import com.codeborne.selenide.Configuration;
import org.junit.jupiter.api.AfterAll;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.Test;
import org.openqa.selenium.By;

import java.io.FileWriter;
import java.io.IOException;
import java.util.Date;

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
        System.setProperty("webdriver.chrome.driver","/app/chrome-linux/chromedriver");
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

        String path = "src/test/resources/current-session.txt";
        Date date = new Date();

        String time = String.valueOf(date.getTime());

        try {
            FileWriter myWriter = new FileWriter(path);
            myWriter.write(time);
            myWriter.close();
            System.out.println("Successfully wrote to the file.");
        } catch (IOException e) {
            System.out.println("An error occurred.");
            e.printStackTrace();
        }
    }

    @Test
    public void test2() {
        String test = $(By.id("for-maven-users")).getText();
        System.out.println("\n\n" + test + "\n\n");
    }
}
