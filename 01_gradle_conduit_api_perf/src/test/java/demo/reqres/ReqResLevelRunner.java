package demo.reqres;

import com.intuit.karate.junit5.Karate;

public class ReqResLevelRunner {
    @Karate.Test
    Karate testUsers() {
        return Karate.run().relativeTo(getClass());
    }
}
