Feature: 1.5 Details of position
	Checking details of position and contact form

Background:
Given There is one position:
		| title            | Senior QA             |
		| description      | custom text           |
		| location         | location text         |
		| responsibilities | responsibilities text |
		| what_we_expect   | what we expect text   |
		| nice_to_have     | nice to have text     |
		| we_offer         | we offer text         |

Scenario: 1.5_01 Position contains all the details
Given Opened '/positions' page
When User clicks on position 'Senior QA'
Then There are details about the position described in the background section

Scenario: 1.5_02 'Send CV' button on the top
Given Opened position 'Senior QA' page
When User clicks 'Send CV' button
Then Page is scrolled to the form where user can enter Name/Email etc

Scenario: 1.5_03 Sending CV - positive test
Given Opened position 'Senior QA' page
When User enters name 'Pavel'
And User enters email 'pavel.bogdanov@quantori.com'
And User clicks `Attach CV` button and upload pdf file less than 10 mb
And User clicks 'I agree to the personal data processing' checkbos
And User clicks 'Send' button
Then form is succesfully is being sent. A message about this result is shown. /* I did not try to send a form, can't say what exactly will be shown, just guessed */

Scenario: 1.5_04 Sending CV - name is missing
Given Opened position 'Senior QA' page
When User clicks on Name input control
And User clicks 'Send' button
Then Error message 'This field is required' is show bellow Name input
And input control is outlined red line

Scenario: 1.5_05 Sending CV - name is invalid
Given Opened position 'Senior QA' page
When User clicks on Name input control and enters 'abc'
And User clicks 'Send' button
Then Error message 'Invalid name format' is show bellow Name input
And input control is outlined red line

Scenario: 1.5_06 Sending CV - fix name value after bad attempt
Given Opened position 'Senior QA' page
And User entered name 'abc'
And User clicked 'Send' button
When User clicks on Name input and enters 'abc dfg'
And User clicks 'Send' button
Then Error message disappeared under Name  and control is outlined with green line and checkmark is appeared on the right side

Scenario: 1.5_07 Sending CV - email is missing
Given Opened position 'Senior QA' page
When User clicks on Email input control
And User clicks 'Send' button
Then Error message 'This field is required' is show bellow Email input
And input control is outlined red line

Scenario Outline: 1.5_08 Sending CV - email is invalid
Given Opened position 'Senior QA' page
When User clicks on Email input control and enters <email>
And User clicks 'Send' button
Then Error message 'Invalid email format' is show bellow Name input
And input control is outlined red line

Examples:
		| email        |
		| abc          |
		| abc@         |
		| @            |
		| aa@ss        |
		| aa@ss..ss    |
		| aa@aa.aa.    |
		| aa@aa.aa@    |
		| aa@aa.aa.123 |

Scenario: 1.5_09 Sending CV - fix email value after bad attempt
Given Opened position 'Senior QA' page
And User entered email 'abc'
And User clicked 'Send' button
When User clicks on Email input and enters 'abc@abc.aa'
And User clicks 'Send' button
Then Error message disappeared under Email and control is outlined with green line and checkmark is appeared on the right side

Scenario: 1.5_10 Sending CV - attachment is missing
Given Opened position 'Senior QA' page
And name is enterdd 'aa aa'
And email is entered abc@abc.aa'
And Checkbox 'I agree to the personal data processing' is checked
When User clicks on 'Send' button
Then Button 'Attach CV' changes color to red and form is not sent

Scenario: 1.5_11 Sending CV - attaching wrong file
Given Opened position 'Senior QA' page
When User clicks on 'Attach CV' button
And In the dropdown with type of files changes type 'All Files'
And User selects *.exe file
Then Modal error message is shown 'Invalid file format. Please try PDF, DOC, DOCX or RTF'

Scenario: 1.5_12 Sending CV - attaching to big file
Given Opened position 'Senior QA' page
When User clicks on 'Attach CV' button
And User Select pdf file in size above 10 mb
Then Modal error message is shown 'Max file size 10 mb'

Scenario: 1.5_13 Sending CV - fix attachment after bad attempt
Given Opened position 'Senior QA' page
And User clicked on 'Attach CV' button
And User Selected pdf file in size above 10 mb
And User Closed modal with error message
When User clicks on 'Attach CV' and selects pdf file smaller than 10mb
And Button 'Attach CV' changed color to blue

Scenario: 1.5_14 Sending CV - negative test - checkbox
Given Opened position 'Senior QA' page
And User entered name 'Pavel'
And User entered email 'pavel.bogdanov@quantori.com'
And User clicked `Attach CV` button and upload pdf file less than 10 mb
When User clicks 'Send' button
Then Checkbox 'I agree to the personal data processing' became red, form was not sent