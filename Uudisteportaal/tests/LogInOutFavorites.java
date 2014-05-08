package com.example.tests;

import java.util.regex.Pattern;
import java.util.concurrent.TimeUnit;
import org.junit.*;
import static org.junit.Assert.*;
import static org.hamcrest.CoreMatchers.*;
import org.openqa.selenium.*;
import org.openqa.selenium.firefox.FirefoxDriver;
import org.openqa.selenium.support.ui.Select;

public class LogInOutFavorites {
  private WebDriver driver;
  private String baseUrl;
  private boolean acceptNextAlert = true;
  private StringBuffer verificationErrors = new StringBuffer();

  @Before
  public void setUp() throws Exception {
    driver = new FirefoxDriver();
    baseUrl = "http://mustikauudised.appspot.com/";
    driver.manage().timeouts().implicitlyWait(30, TimeUnit.SECONDS);
  }

  @Test
  public void testLogInOutFavorites() throws Exception {
    driver.get(baseUrl + "/");
    driver.findElement(By.linkText("Logi sisse")).click();
    driver.findElement(By.id("signIn")).click();
    driver.findElement(By.xpath("(//button[@type='submit'])[4]")).click();
    driver.findElement(By.linkText("Lemmikud (5)")).click();
    driver.findElement(By.linkText("Mustikas")).click();
    driver.findElement(By.linkText("Mustikauudised")).click();
    driver.findElement(By.linkText("Lemmikud (5)")).click();
    driver.findElement(By.cssSelector("div.row")).click();
    driver.findElement(By.xpath("(//button[@type='submit'])[4]")).click();
    driver.findElement(By.xpath("//div[5]/div/div/a/h3")).click();
    driver.findElement(By.id("new_comment_name")).clear();
    driver.findElement(By.id("new_comment_name")).sendKeys("bot");
    driver.findElement(By.id("new_comment_text")).clear();
    driver.findElement(By.id("new_comment_text")).sendKeys("1");
    driver.findElement(By.id("new_comment_submit")).click();
    driver.findElement(By.linkText("Logi välja")).click();
  }

  @After
  public void tearDown() throws Exception {
    driver.quit();
    String verificationErrorString = verificationErrors.toString();
    if (!"".equals(verificationErrorString)) {
      fail(verificationErrorString);
    }
  }

  private boolean isElementPresent(By by) {
    try {
      driver.findElement(by);
      return true;
    } catch (NoSuchElementException e) {
      return false;
    }
  }

  private boolean isAlertPresent() {
    try {
      driver.switchTo().alert();
      return true;
    } catch (NoAlertPresentException e) {
      return false;
    }
  }

  private String closeAlertAndGetItsText() {
    try {
      Alert alert = driver.switchTo().alert();
      String alertText = alert.getText();
      if (acceptNextAlert) {
        alert.accept();
      } else {
        alert.dismiss();
      }
      return alertText;
    } finally {
      acceptNextAlert = true;
    }
  }
}
