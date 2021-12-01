  Feature: 1.1.Send CV

  Scenario: 1.1_01 positive sending CV
  Given user opened the form "Send CV"
  When user enters valid data in the field "Name"
  And user enters valid data in the field "Email"
  And user attaches 9Mb CV-file
  And user marks checkbox with agreement to the personal data processing
  And user clicks the "Send" button
  Then my CV has been send and success message should appear


  Scenario: 1.1_02 exceeding the limit of characters in the field "Name"
  Given user opened the form "Send CV"
  When user enters 71 characters with space delimiter in the field "Name"
  Then a message should appear "The maximum number of characters is 70"

  Scenario: 1.1_03 entering the number format data in the field "Name"
  Given user opened the form "Send CV"
  When user enters the number format data in the field "Name"
  Then a message should appear "Invalid name format"


  Scenario: 1.1_04 entering invalid data in the field "Email"
  Given user opened the form "Send CV"
  When user enters email-address without "@"-character in the field "Email"
  Then a message should appear "This field is required"


  Scenario: 1.1_05 upload a file larger than 10 Mb
  Given user opened the form "Send CV"
  When user attaches 11 Mb CV-file
  Then an error message should appear "Something went wrong Max file size 10 Mb"

  
  Scenario: 1.1_06 Checkbox isn't mark
  Given user opened the form "Send CV"
  When user does not mark "I agree to the personal data processing"
  Then checkbox should change colour to "red"

