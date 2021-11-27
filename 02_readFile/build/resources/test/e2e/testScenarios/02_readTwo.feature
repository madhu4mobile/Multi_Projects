Feature: to test file upload

  Scenario: with a web upload
    Given url 'https://store-eu-hz-3.ufile.io//v1/upload/chunk'
    And header Content-Type = 'multipart/form-data'
    And multipart file file =  { read: 'classpath:e2e/common/testFile1.txt', filename: 'testFile1.csv', contentType: 'pain/text' }
    When method post
    Then print response
