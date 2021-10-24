Feature: To list out all user and then to add and modify, delete users later to use in performance
  for help, see: https://github.com/intuit/karate/wiki/IDE-Support

  Background:
    * url 'https://reqres.in/api'

  @name=getUsers
  Scenario: To list out all users in reqres.in/api and check if the first user matches
    Given path 'users'
    When method get
    Then status 200
#    And print "-------->",response.data[0]
#    And print "======>",response.data[0].id
#    And print "*******",response.data[0]
    And match response.data[0].id == 1

    # ===> To drill down to the first user from the above repose and validate the details of user 1
    * def first = response.data[0]

    Given path 'users', response.data[0].id
    When method get
    Then status 200
    #Note ---> we can only use $ method in match but not in print
    And match $.data.id == 1
    And match response.data.email == "george.bluth@reqres.in"

  @name=postUser
  Scenario: To create a new user and then get it by id
    * def newUser =
      """
          {
              "email": "eve.holt@reqres.in",
              "password": "pistol"
          }
      """

    And path 'register'
    And request newUser
    When method post
    Then status 200
    And print response

    #* def token = response.token
    #* print 'created response token is: ', token
    And match response.token == "QpwL5tke4Pnpja7X4"

