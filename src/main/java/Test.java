import com.codeborne.selenide.Configuration;
import org.openqa.selenium.By;

import static com.codeborne.selenide.Selenide.*;
import static com.codeborne.selenide.Condition.*;

public class Test {
    public static void main(String[] args) {
        test();
    }

    public static void test() {
        String url = "https://selenide.org/quick-start.html";
        Configuration.headless = true;
        open(url);
        String test = $(By.id("start-writing-test")).getText();
        System.out.println(test);
    }
}
