Feature: To search in the array of String response and to match date portion

  Background:
    * def myDate =
      """
      function() {
          var Formatter = Java.type("java.time.format.DateTimeFormatter");
          var LocalDate = Java.type("java.time.LocalDate");
          var dtf = Formatter.ofPattern("yyyy-MM-dd");
          return dtf.format(LocalDate.now());
        }
      """
    * def myDate2 = '2021-10-19'

    Scenario: To search the data in json and match with the date

      * def myJson = read('classpath:resources/data/response_With_Dates.json')
      * print "Today for the code : ", myDate()
      #* match each myJson contains myDate2

