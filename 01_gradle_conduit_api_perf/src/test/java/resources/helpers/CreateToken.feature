Feature: Create and use Token by calling one time

  Scenario: Create Token
    Given url apiUrl
    * print "apiUrl in CreateToken feature :",apiUrl

    Given path 'users/login'
    And request {"user":{"email":#(userEmail),"password":#(userPassword)}}
    When method post
    Then status 200

    And def authToken = response.user.token