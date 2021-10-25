Feature: To test geting articles functionality

  Background: url, and mandatory paramas
    Given url apiUrl
      #Given url 'https://api.realworld.io/api'
      #Given url 'http://localhost:4200'
#    * def extraString = ' for user1'

  Scenario: To get the top most article in the list and to return the corresponding  num
#    Given path 'users/login'
#    And request {"user":{"email":#(userEmail),"password":#(userPassword)}}
#    When method post
#    Then status 200
#    #And print karate.pretty(response)
#    And def token = response.user.token

        ### The logic to capture slug details from the most recent article and to create a next article
    Given path 'articles'
    When method get
    Then status 200
    #And print karate.pretty(response)

    And print karate.pretty(response.articles[response.articlesCount-1])

    * def myConditionToCheckIfNoArticle =
      """
      function(arg) {
    if ( response.articlesCount == 0) {
           console.log("there are no articles")
           console.log(response.articles)
           console.log(response.articles.length)
           console.log(response.length)
           console.log( "returning from if")
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
    * print "My present article : --> ",myNum