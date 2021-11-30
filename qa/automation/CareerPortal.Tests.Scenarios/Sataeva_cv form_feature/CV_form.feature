Feature: Send CV form

Background:
Given user opened https://career.quantori.com/
And user scrolled down to the "Send us your CV" form

Scenario Outline: checking if the field "Name" is filled out with correct amount of symbols 
When user entered text with <Amount> of symbols in "Name" field
And "Name" field consists of 2 words
And these two words are separated with one space
Then the result should be <Result> on the screen

Examples:
  | Amount | Result                                                                                  | 
  | 69     | no error message, line under the field is green                                         |
  | 70     | no error message, line under the field is green                                         | 
  | 71     | line under the field is red, error message "The maximum number of characters is 70"     | 


Scenario: field "Name" consists of one word 
When user types "Hello" in field "Name"
Then user should get an error message "Invalid name format"
And line under the field should turn to red

Scenario: field "Name" consists of two words, separated with one space
When user types "Hello world" in field "Name"
Then line under the field should turn to green
And user should not get any "Error" message

Scenario: two words in field "Name" are separated with two spaces
When user types "Hello  World" in field "Name"
Then user should get an error message "Invalid name format"
And line under the field should turn to red

Scenario: Field "Name" has numbers instead of letters
When user types "123 321" in field "Name"
Then user should get an error message "Invalid name format"
And line under the field should turn to red

Scenario: Field "Name" has numbers and letters
When user types "123 Hi" in field "Name"
Then user should get an error message "Invalid name format"
And line under the field should turn to red

Scenario: error message disappeared in field "Name" when user changes the Name format to the correct one
When user types "Hello" in field "Name"
And user gets error "Invalid name format" 
And user changes "Name" to "Hello World"
Then line under the field should turn to green
And he should not get any "Error" message

Scenario: error message disappeared in field "Name" when user changes the length of the field to the correct one
When user types "Hello world Hello world Hello world Hello world Hello world Hello world" in field "Name"
And user gets error "The maximum number of characters is 70" 
And user deletes on symbol
Then line under the field should turn to green
And he should not get any "Error" message

Scenario: Field "Name" has special symbols instead of letters
When user types "@@ @@" in field "Name"
Then he should get an error message "Invalid name format"
And line under the field should turn to red

Scenario: Field "Name" has special symbols and letters
When user types "@@ Hi" in field "Name"
Then he should get an error message "Invalid name format"
And line under the field should turn to red

Scenario: field "Email" is filled in correctly
When user types "hello@world.hi" in field "Email"
And user clicks somewhere on the empty space on the page
Then line under the field should turn to green
And he should not get any "Error" message

Scenario: field "Email" has incorrect domain part
When user types "hello@world.h" in field "Email"
And user clicks somewhere on the empty space on the page
Then user should get an error message "Invalid email format"
And line under the field should turn to red

Scenario: field "Email" has only special symbols 
When user types "@@" in field "Email"
And user clicks somewhere on the empty space on the page
Then user should get an error message "Invalid email format"
And line under the field should turn to red

Scenario: field "Email" has only numbers
When user types "123" in field "Email"
And user clicks somewhere on the empty space on the page
Then user should get an error message "Invalid email format"
And line under the field should turn to red

Scenario: error message disappeared in field "Email" when user changes the Email format to the correct one
When user types "hello@world.h" in field "Email"
And gets error "Invalid email format" 
And changes "Email" to "hello@world.hi"
Then line under the field should turn to green
And user should not get any "Error" message

Scenario: user enlarges the "Text" field 
When user clicks on the right bottom corner of "Text" field
And user pulls the cursor down
Then "Text" field should become larger

Scenario: field "Text" is filled in with correct (500) amount of symbols
When user types "Hello world Hello world Hello world Hello world Hello world Hello world Hello world Hello world Hello world Hello world Hello world Hello world Hello world Hello world Hello world Hello world Hello world Hello world Hello world Hello world Hello world Hello world Hello world Hello world Hello world Hello world Hello world Hello world Hello world Hello world Hello world Hello world Hello world Hello world Hello world Hello world Hello world Hello world Hello world Hello world Hello world Hello wo"
And user clicks somewhere on the empty space on the page
Then line under the field should turn to green
And user should not get any "Error" message

Scenario: field "Text" is filled in with incorrect (501) amount of symbols
When user types "Hello world Hello world Hello world Hello world Hello world Hello world Hello world Hello world Hello world Hello world Hello world Hello world Hello world Hello world Hello world Hello world Hello world Hello world Hello world Hello world Hello world Hello world Hello world Hello world Hello world Hello world Hello world Hello world Hello world Hello world Hello world Hello world Hello world Hello world Hello world Hello world Hello world Hello world Hello world Hello world Hello world Hello wor"
And user clicks somewhere on the empty space on the page
Then user should get an error message "The maximum number of characters is 500"

Scenario: local folder is opened when user clicks on "Attach CV" button
When user clicks on "Attach CV" button
Then local folder on the computer should be opened


Scenario Outline: attaching CV in different formats and with different sizes 
When user attaches CV in <Format> format
And user's CV has <size> size
Then user should get <Result> on the screen

Examples:
  | Format | Size     | Result                                                                                                          |
  | .pdf   | 9,99 Mb  |User can see the name of downloaded file under the button "Attach CV". No error message.                         |
  | .doc   | 10 Mb    |User can see the name of downloaded file under the button "Attach CV". No error message.                         |
  | .docx  | 10,01 Mb |Pop-up window with the error text: "Something went wrong. Max file size 10 Mb"                                   |
  | .rtf   | 7 Mb     |User can see the name of downloaded file under the button "Attach CV". No error message.                         |
  | .jpg   | 6 Mb     |Pop-up window with the error text: "Something went wrong. Invalid file format. Please try PDF, DOC, DOCX or RTF."|
  | .exe   | 5 Mb     |Pop-up window with the error text: "Something went wrong. Invalid file format. Please try PDF, DOC, DOCX or RTF."|


Scenario: downloading another CV file
When user push "Attach CV" button
And user downloads "Hello.pdf" CV file
And user sees this file's name under "Attach CV" button
And user pushes "Attach CV" one more time
And user downloads "Hello.rtf" file
Then user should see "Hello.rtf" file name under "Attach CV" button
And user should not get any Error message

Scenario: clicking on "I agree to the personal data processing" check box
When user clicks on "I agree to the personal data processing"  check box
Then the check box should have "mark" sign inside

Scenario: error message when user unmarks "I agree to the personal data processing" check box
When user marks check box "I agree to the personal data processing"  check box
And user unmarks "I agree to the personal data processing"  check box
Then  the check box mark should disappear
And Text "I agree to the personal data processing" should change color to red 

Scenario: error message disappear when user marks "I agree to the personal data processing" check box again
When user marks check box "I agree to the personal data processing"  check box
And user unmarks "I agree to the personal data processing"  check box
And Text "I agree to the personal data processing" changes color to red 
And user marks check box "I agree to the personal data processing" again
Then Text "I agree to the personal data processing" changes color to white again
And user gets no error message 

Scenario Outline: sending "Send CV" form filled in with different types of data 
When user types <Name> name
And user types <Email> email
And user types Text message with <Number> of symbols
And user attaches CV <CV>
And user sets up Check box "I agree to the personal data processing" as <Check box>
And user pushes "Send" button
Then user should get the following result <Result>
And user´s CV form should be <Send_status> to the server

Examples:
| Name        | Email          |Number| CV          | Check box|     Result                                                    | Send_status
| Hello World | hello@world.hi | 0    | Hello.pdf   | marked   | Your CV is successfully sent                                   | Sent
| Hello World | hello@world.hi | 20   | Hello.doc   | marked   | Your CV is successfully sent                                   | Sent
| Hello       | hello@world.hi | 20   | Hello.doc   | marked   | Error: Invalid name format                                    | Not sent
| Hello World | hello@world.h  | 20   | Hello.docx  | marked   | Error: Invalid email format                                   | Not sent
| Hello World | hello@world.hi | 20   | Hello.exe   | marked   | Error: Invalid file format. Please try PDF, DOC, DOCX or RTF. | Not sent
| Hello World | hello@world.hi | 0    | Hello.doc   | unmarked | Error: Data processing field is marked with red               | Not sent
| _empty_     | _empty_        | 0    | not attached| unmarked | Errors in fields: Name, Email, Attach CV, Data processing     | Not sent
