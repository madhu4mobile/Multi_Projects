Feature: login with testuser1 and to list out all articles and filter to article3

  Background: url, and mandatory paramas
    Given url 'https://conduit.productionready.io/api'
      #Given url 'https://api.realworld.io/api'
      #Given url 'http://localhost:4200'
    * def extraString = ' for user1'

  Scenario: To capture slug details from the most recent article and to create a next article
    Given path 'users/login'
    And request {"user":{"email":"testuser1@karate.com","password":"test123"}}
    When method post
    Then status 200
    #And print karate.pretty(response)
    And def token = response.user.token

