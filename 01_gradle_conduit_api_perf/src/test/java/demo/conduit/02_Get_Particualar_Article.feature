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

        ### The logic to capture slug details from the most recent article and to create a next article
    Given header Authorization = 'Token '+ token
    Given path 'articles'
    When method get
    Then status 200
    And print karate.pretty(response)

    And print response.articles[response.articlesCount-1]


    * def myTempResponse = response

    * def myConditionToCheckIfNoArticle =
      """
      function(arg) {
        if ( myTempResponse.articlesCount == 0) {
           console.log( "  ---- There are No articles  ----")
           var myNum = 0
           return myNum
        }
        else {
          var slug = arg.articles[0].slug;
          var myNum = slug.substr(7,1);
          return slug
        }
        return "returning from outside"
      }
      """
    # calling function after passing response as variable
    * def myNum = call myConditionToCheckIfNoArticle myTempResponse
    * print myNum