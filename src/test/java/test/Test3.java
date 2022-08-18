package test;

import com.codeborne.selenide.Configuration;
import org.junit.jupiter.api.AfterAll;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.Test;
import org.openqa.selenium.By;

import static com.codeborne.selenide.Selenide.$;
import static com.codeborne.selenide.Selenide.open;

public class Test3 {

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
        System.out.println("TEST3");
        String test = $(By.id("start-writing-test")).getText();
        System.out.println("\n\n" + test + "\n\n");
    }

    @Test
    public void test2() {
        String test = $(By.id("for-maven-users")).getText();
        System.out.println("\n\n" + test + "\n\n");
    }
}
