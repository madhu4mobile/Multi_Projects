Feature: Sign up with a new user test using Java Faker

  Background: Preconditions
    Given url apiUrl
    # to call java helper locally ---!!! important to use . notation to specify path
    * def dataGenerator = Java.type('resources.helpers.TestDataGenerator')

    Scenario: signing up with a new user randomly created from Java function utility
      ##Given def userData = {"email":"testuser2@karate.com", "username":"TestUser2"}
      ## to call #(userDate.email)
      # To use the methods created inside the TestDataGenerator Helper
      * def randomEmail = dataGenerator.getRandomEmail()
      * def randomUserName = dataGenerator.getUserName()


      Given path 'users'
      And request
      """
      {
        "user": {
                  "email": #(randomEmail),
                  "password": "test123",
                  "username": #(randomUserName)
                }
      }
      """
      When method Post
      Then status 200
      And print karate.pretty(response)

      # to validate response
      And match response ==
      """
          {
            "user": {
              "email": #(randomEmail),
              "username": #(randomUserName),
              "bio": null,
              "image": '#string',
              "token": '#string'
            }
          }
      """