package e2e.individual;

import com.intuit.karate.junit5.Karate;

class individualRunner{

    @Karate.Test
    Karate testAll() {
        return Karate.run().relativeTo(getClass());
    }
}