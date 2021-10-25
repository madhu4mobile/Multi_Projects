Feature: login with an existing user

  Background: url, and mandatory params
    Given url apiUrl
#      #Given url 'https://api.realworld.io/api'
#      #Given url 'https://angular.realworld.io/'
#    * def extraString = ' for user1'
#    Given path 'users/login'
#    And request {"user":{"email":"testuser1@karate.com","password":"test123"}}
#    When method post
#    Then status 200
    #And print karate.pretty(response)
#    And def authToken = response.user.token
#    * def tokenFromHelper = callonce read('classpath:helpers/CreateToken.feature')
#    # the above will return and object
#    * def token = tokenFromHelper.authToken


  Scenario: To capture slug details from the most recent article and to create a next article
    ### The logic to capture slug details from the most recent article and to create a next article
    #Given header Authorization = 'Token '+ token
    Given path 'articles'
    When method get
    Then status 200

    # logic to check if there are no articles at first

    * def response = response

    * def myConditionToCheckIfNoArticle =
      """
      function(arg) {
        if ( response.articlesCount == 0) {
           console.log("there are no articles, returning from if")
           console.log(response.articles)
           console.log(response.articles.length)
           console.log(response.length)
           var myNum = 0
           return myNum
        }
        else if (response.articlesCount > 9){
          console.log("returning from else if")
          var slug = arg.articles[0].slug;
          console.log("arg.articles[0].slug retuns:",slug)
          var myNum = slug.substr(7,2);
          console.log("slug.substr(7,2) retuns:",myNum)
          return myNum
        }
        else {
          console.log("returning from else")
          var slug = arg.articles[0].slug;
          console.log("arg.articles[0].slug retuns:",slug)
          var myNum = slug.substr(7,1);
          console.log("slug.substr(7,1) retuns:",myNum)
          return myNum
        }
        return "returning from outside"
      }
      """
    # calling function after passing response as variable
    * def myNum = call myConditionToCheckIfNoArticle response
    * print myNum
      # logic to increment Article number to next one
    * def myNextNum = String(parseInt(myNum) + 1)

    #And def presentUser = slug.substring(slug.indexOf("-") + 1); // to print the remaining string after first '-'
    #And print presentUser

    ### To prepare the body for the next article
    * print "my extraString is :-->",extraString
    * def strNewArticle = "Article"+myNextNum+extraString
    * def strNewDescription = "Header"+myNextNum+extraString
    * def strNewBody = "Body"+myNextNum+extraString


    And def myNewArticleRequestBody =
          """
              {
                    "article": {
                        "tagList": ["cars","dragons","apples","honey","api","automation","karate"],
                        "title": #(strNewArticle),
                        "description": #(strNewDescription),
                        "body": #(strNewBody)
                    }
              }
          """
    #Given header Authorization = 'Token '+ token
    Given path 'articles'
    And request myNewArticleRequestBody
    And method post
    And status 200




