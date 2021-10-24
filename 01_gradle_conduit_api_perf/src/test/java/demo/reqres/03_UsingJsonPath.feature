@ignore
Feature: To drill down keys and values using Json Path
  ref - From <https://priyankab85.medium.com/how-has-karatedsl-simplified-jsonpath-evaluation-228c6d7651e0>
  url used for the api : http://openlibrary.org/api/volumes/brief/isbn/9780525440987.json

  Best Online Json Path evaluator : https://jsonpath.com/

  Background: Details of url and backgrounds
    Given url 'http://openlibrary.org/api/volumes/brief/isbn/9780525440987.json'
    When method Get
    Then status 200
    #And print response


  Scenario: Example 1: Get an objects present in “ebooks” array.

    And def data = $..ebooks[*]
    And print " ebooks :", data

  Scenario: Example 2: Get “lccn” key on the 0th index of “identifiers” array.

    And def lccn = $..identifiers.lccn[0]
    And print "lccn :", lccn

  Scenario: Example 3: Get all the “name” keys from “subjects” error excluding “url”.
# Get subjects arrayAnd def subjects = $..subjects# From subjects array get all namesAnd def subject_name = karate.jsonPath(subjects,"$..['name']")And print subject_name
    # And print karate.pretty(response)
    And def subjects = $..subjects
    And def subject_name = karate.jsonPath(subjects,"$..['name']")
    And print "subject_name :\n" ,karate.pretty(subject_name)

#  Please note: In karate, you can retrieve a few keys (rather than the entire object) from a JSON array or an object, this can be achieved by using square brackets along with comma(,) separated key names in karate.jsonPath method.
#  karate.jsonPath(response, "$..['key1','key2','key3']")
  Scenario: Example 4: Obtain all subjects with the word “Grade” in their names.
    # We are using regex to match characters.
    # And def subject_name_grade = karate.jsonPath(response, "$..subjects[?(@.name =~ /.*Grade.*/i)]")

    And def subject_name_grade = karate.jsonPath(response, "$..subjects[?(@.name =~ /.*Grade.*/i)]")
    And print "subject_name_grade :\n" ,karate.pretty(subject_name_grade)


  Scenario: Example 5: Get subject url present on the last index and subject names on the last to index of the array.
    And def last_subject_url = karate.jsonPath(response, "$..subjects[-1:].url" )
    And print last_subject_url
    And def second_subject_name = karate.jsonPath(response, "$..subjects[-2:].name" )
    And print "second_subject_name :", second_subject_name

  Scenario: the Example 6 : Get JSON object based on indexes range.
      #We can use StartIndex : DesiredEndIndex which mean start from index 1 (inclusive) until index 2 (exclusive)
      # Get first 3 object from JSON array
    And def subjects = karate.jsonPath(response, "$..subjects" )[0]
    And def First_three_subjects = karate.jsonPath(subjects, "$..[0:3]")
    And print karate.sizeOf(First_three_subjects)
    And print First_three_subjects

    Scenario: the Example 7: Get size of the array by using karate.jsonPath method
    # Method 1: The traditional method of obtaining the size is to extract the array into a single variable and then transfer it to karate.sizeOf() is a method.
      And def subjects = karate.jsonPath(response, "$..subjects[*]" )
      And print subjects
      And def subject_length_via_karate = karate.sizeOf(subjects)
      And print subject_length_via_karate

      Scenario: the Example 8: There are times when dynamically obtaining values from a JSON response is needed. We’ll see how to get the value of the “url” key by passing the subject name in the example below.
      # Method 1: To get relevant objects, you can transfer a hardcoded value into a variable and use in the jsonPath method.
        And def name = 'Vacations'
        And def get_vacation_url = karate.jsonPath(response, "$..[?(@.name=='" + name + "')].url" )
        And print get_vacation_url
      #Method 2: By following the steps below, you can make it absolutely dynamic:
        And def book_name = $..subjects[5].name
        And def get_vacation_url1 = karate.jsonPath(response, "$..[?(@.name=='" + book_name + "')].url" )
        And print get_vacation_url1

        ## Note: If you do not pass “.url” in the jsonPath it will return entire JSON object which matches passed variable condition.

  Scenario: the Example 9: Get the JSON objects excluding an object based on a condition.
  #Below example shows steps to get all JSON objects from subjects array excluding name that matches ‘Juvenile fiction’.
    And def subjects = karate.jsonPath(response, "$..subjects" )[0]
    And def First_three_subjects = karate.jsonPath(subjects, "$..[0:2]" )
    And print karate.sizeOf(First_three_subjects)
    And print First_three_subjects
    And def condition = function(x) { return x.name != "Juvenile fiction"; }
    And def data_after_filteration = karate.filter(First_three_subjects, condition)
    And print karate.sizeOf(data_after_filteration)
    And print data_after_filteration
