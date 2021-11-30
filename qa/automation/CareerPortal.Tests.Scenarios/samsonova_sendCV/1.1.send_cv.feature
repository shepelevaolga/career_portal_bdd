  Feature: 1.1.Send CV

  Scenario: 1.1.01 positive sending CV
  Given user opened the form "Send CV"
  When user enters valid data in the field "Name"
  And user enters valid data in the field "Email"
  And user attaches CV
  And user ticked "I agree to the personal data processing"
  And user click button "Send"
  Then my CV has been send and success message should appear


  Scenario: 1.1.02 exceeding the limit of characters in the field "Name"
  Given user opened the form "Send CV"
  When user enters 71 characters with space delimiter in the field "Name"
  Then a message should appear "The maximum number of characters is 70"

  Scenario: 1.1.03 entering the number format data in the field "Name"
  Given user opened the form "Send CV"
  When user enters the number format data in the field "Name"
  Then a message should appear "Invalid name format"


  Scenario: 1.1.04 entering invalid data in the field "Email"
  Given user opened the form "Send CV"
  When user enters email-address without "@"-character in the field "Email"
  Then a message should appear "This field is required"


  Scenario: 1.1.05 upload a file larger than 10 Mb
  Given user opened the form "Send CV"
  When user attaches 11 Mb CV-file
  Then an error message should appear

  
  Scenario: 1.1.06 don't ticked "I agree to the personal data processing"
  Given user opened the form "Send CV"
  When user didn't ticked "I agree to the personal data processing"
  Then "I agree to the personal data processing" changes color to "red"

