package test.java;

import com.codeborne.selenide.Configuration;
import org.openqa.selenium.By;
import org.testng.annotations.BeforeTest;
import org.testng.annotations.Test;

import static com.codeborne.selenide.Selenide.$;
import static com.codeborne.selenide.Selenide.open;

// p.4.3 solved the problem of individual calling the test classes.
// https://howtodoinjava.com/testng/how-to-execute-testng-tests-with-maven-build/

public class Test2 {
    @BeforeTest
    public static void openProcess() {
        String url = "https://selenide.org/quick-start.html";
        Configuration.headless = true;
        open(url);
    }

    @Test
    public void myTest() {
        String test = $(By.id("for-maven-users")).getText();
        System.out.println("\n\n" + test + "\n\n");
    }

//    @AfterAll
//    public static void closeProcess() {
//        Configuration.holdBrowserOpen = true;
//    }
}
