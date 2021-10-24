@ignore
Feature: To do all experiments here
  for help, see: https://github.com/intuit/karate/wiki/IDE-Support

  Background:
    * def myTestJsonObject =
          """
                             {
                              "result": "SUCCESS",
                              "rawAttr": [
                                  {
                                      "attributes": [
                                          {
                                              "name": "resourceid",
                                              "value": "7A7Q123456"
                                          },
                                          {
                                              "name": "physicalid",
                                              "value": "7A7Q123456"
                                          },
                                          {
                                              "name": "dsw-label",
                                              "value": "MY Product00004285"
                                          },
                                          {
                                              "name": "dsw-created",
                                              "value": "2019-11-06T08:39:39Z"
                                          }
                                      ]
                                  }
                              ],
                              "physicalid": "7A7Q123456",
                              "contextPath": "/path",
                              "id": "7A7Q123456",
                              "message": null
                  }
          """

  @name=tryJsonNavigation
  Scenario: To try with Json object Navigation
    And def strVar = myTestJsonObject.rawAttr
    And json jsonVar = strVar
    And def attrb = karate.jsonPath(jsonVar, '$..attributes.[2].value')[0]
    And print '\n\n Attrb\n', attrb

    And def anotherAttrb = karate.jsonPath(jsonVar, '$..attributes.[1].value')[0]
    And print "\n\n Attrb1's Key :",  anotherAttrb