import junit.framework.Test;
import junit.framework.TestSuite;

public class Test {

  public static Test suite() {
    TestSuite suite = new TestSuite();
    suite.addTestSuite(Log in&out, favorites.class);
    suite.addTestSuite(Comment add.class);
    suite.addTestSuite(Map.class);
    return suite;
  }

  public static void main(String[] args) {
    junit.textui.TestRunner.run(suite());
  }
}
