Feature: to call any feature and test the paths

  Background:


    Scenario: calling post new article

      * def myVar = call read('../conduit/01_To_Post_NewArticle.feature')
      * print "Body of the request posted --->"+myVar.varsFromFeatures[1]
      * print "The latest number of the article -->"+myVar.myNextNum


