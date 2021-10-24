Feature: Create and use Token

  Scenario: Create Token
    Given url apiUrl
      #Given url 'https://api.realworld.io/api'
      #Given url 'http://localhost:4200'
    * def extraString = ' for user1'
    Given path 'users/login'
    And request {"user":{"email":#(userEmail),"password":#(userPassword)}}
    When method post
    Then status 200
    #And print karate.pretty(response)
    And def authToken = response.user.token