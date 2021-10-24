package demo.conduit;

import com.intuit.karate.junit5.Karate;

public class ConduitLevelRunner {
    @Karate.Test
    Karate testConduit() {
        return Karate.run().relativeTo(getClass());
    }
}
