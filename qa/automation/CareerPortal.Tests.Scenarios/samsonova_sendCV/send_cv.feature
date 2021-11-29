  Feature: Send CV

  Scenario: positive sending CV
  Given form "Send CV" with blank fields
  When I enter valid data in the field "Name"
  And I enter valid data in the field "Email"
  And I attach CV
  And I ticked "I agree to the personal data processing"
  And I click button "Send"
  Then my CV has been send


  Scenario: exceeding the limit of characters in the field "Name"
  Given form "Send CV" with blank fields
  When I enter 71 characters with space delimiter in the field "Name"
  Then a message appears "The maximum number of characters is 70"


  Scenario: entering the number format data in the field "Name"
  Given form "Send CV" with blank fields
  When I enter the number format data in the field "Name"
  Then a message appears "Invalid name format"


  Scenario: entering invalid data in the field "Email"
  Given form "Send CV" with blank fields
  When I enter email-adress without "@"-character in the field "Email"
  Then a message appears "This field is required"


  Scenario: upload a file larger than 10 Mb
  Given form "Send CV" with blank fields
  When I attach 11 Mb CV-file 
  Then an error message appears

  
  Scenario: don't tiked "I agree to the personal data processing"
  Given form "Send CV" with blank fields
  When I don't tiked "I agree to the personal data processing"
  Then "I agree to the personal data processing" changes color to red 