package resources.helpers;

import com.github.javafaker.Faker;

public class TestDataGenerator {

    public static String getRandomEmail(){
        Faker faker = new Faker();
        String fakeEmail = faker.name().firstName().toLowerCase() + faker.random().nextInt(2,99)+"@karate.com";
        return fakeEmail;
    }

    public static String getUserName(){
        Faker faker = new Faker();
        String fakeUserName = faker.name().username();
        return fakeUserName;
    }
}
