Feature: To test Sign up Feature with DATA DRIVEN cases

  Background: Preconditions
    Given url apiUrl
    * def dataGenerator = Java.type('resources.helpers.TestDataGenerator')

  Scenario Outline: signing up with a new user randomly created from Java function utility
    * def randomEmail = dataGenerator.getRandomEmail()
    * def randomUserName = dataGenerator.getUserName()


    Given path 'users'
    And request
      """
      {
        "user": {
                  "email": <email>,
                  "password": <password>,
                  "username": <username>
                }
      }
      """
    When method Post
    Then status 422
    And print karate.pretty(response)
    And match response == <errorResponse>


    Examples:
      | email                | password | username          | errorResponse                                                                         |
      | #(randomEmail)       | test123  | TestUser1         | {"errors":{"username":["has already been taken"]}}                                    |
      | testuser1@karate.com | test123  | #(randomUserName) | {"errors":{"email":["has already been taken"]}}                                       |
      | testuser1@karate.com | test234  | TestUser1         | {"errors":{"email":["has already been taken"],"username":["has already been taken"]}} |
      |                      | test234  | TestUser1         | {"errors":{"email":["can't be blank"]}}                                               |
      | testuser1@karate.com |          | TestUser1         | {"errors":{"password":["can't be blank"]}}                                            |
      | testuser1@karate.com | test234  | " "               | {"errors":{"username":["can't be blank"]}}                                           |
