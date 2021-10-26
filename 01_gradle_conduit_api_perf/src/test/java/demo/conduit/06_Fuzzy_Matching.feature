Feature: To exhibit fuzzy matching logic

  Background:
    Given url apiUrl
    #to call timevalidator function
    * def isValidTime = read('classpath:resources/helpers/timeValidator.js')

  Scenario: To use Markers instead of correct values in Match
    Given params {limit:7, offset:0}
    Given path 'articles'
    When method get
    Then status 200
    And print karate.pretty(response)

    ## Here goes fuzzy match
    And match response == {'articles': '#array', 'articlesCount': '#number' }
    And match response.articles[*].favoritesCount == '#array'
    #And match response..favorited == '#boolean'
    And match response..favorited == '#[1]'
    And match response.articles[0].author.bio == '#null'

    Scenario: To use schema validation tip
      Given params {limit:10, offset:0}
      Given path 'articles'
      When method get
      Then status 200

      # Here goes the schema validation
      And match response.articles[0] ==
        """
          {
              "slug": "#string",
              "title": "#string",
              "description": "#string",
              "body": "#string",
              "createdAt": '#? isValidTime(_)',
              "updatedAt": "#? isValidTime(_)",
              "tagList": '#array',
              "author": {
                  "username": "#string",
                  "bio": '#null',
                  "image": "#string"
              },
              "comments": '#array',
              "favoritesCount": '#number',
              "favorited": '#boolean'
          }
        """

