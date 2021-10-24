Feature: To exhibit assertions and match

  Background:
    Given url apiUrl

    Scenario: Lets use assertions for get 10 articles from the page
      Given params {limit:7, offset:0}
      Given path 'articles'
      When method get
      Then status 200
      And print karate.pretty(response)
      And match response.articles == '#[7]'
      #To test if createdAt has 2021 in it
      And match response.articles[0].createdAt contains '2021'
      # to test atleast one favorite article - using wild card
      And match response.articles[*].favoritesCount contains 1
      ## if contains 3 it failes saying, actual array does not contain expected item - 3 [0,1,1,0,0,1,0] 3
      # to check if atleast one bio is null in authors WILD CARDS
      And match response.articles[*].author.bio contains null
      And match response..bio contains null





      Scenario: another use case for assertions with tags
        Given path 'tags'
        When method get
#        And request { "tags": ["Cars","Birds"] }
        Then status 200
        And print karate.pretty(response)