@ignore
Feature: To use conditions and loops with JavaScript touch
  for help, see: https://github.com/intuit/karate/wiki/IDE-Support

  Background:
    * url 'https://reqres.in/api/'

  @name=getUsers
  Scenario: To list out all users in reqres.in/api and check if the first user matches
    Given path 'users'
    And param page = 2
    When method Get
    Then status 200

    ## Now to define and use a basic function
    * def myFun1 = function() {return "<==========   Welcome to Functions  ==========>"}
    * def returnedData1 = call myFun1
    Then print 'returnedData1 ---->',returnedData1

    ## To use advance function with conditions and logic to search for a particualr user '9'
    * def data = response.data
    #Then print 'data --->\n', karate.pretty(data)

    * def fnToFindAUserAndReturnEmail =
    """
       function(arg){
          for(i=0; i<arg.length; i++) {
              if(arg[i].id == 11) {
                     return arg[i]
              }
          }
       }
    """
    # here we are calling and passing the total data part as argument
    * def userDetails = call fnToFindAUserAndReturnEmail data
    Then print 'User details of 11th user -----> \n', karate.pretty(userDetails)
    Then match userDetails.email == "george.edwards@reqres.in"