Feature: 1.0.0 Sending CV
Background: 
	Given "Career Quantori" page is opened
	And only valid CV can be attached to form
	And all files are in Savostin-folder

Scenario: empty form can not be sent
	When user clicks on "Send CV" button
	And all fields are empty
	Then form is not sent
	And following are displayed appropriate fields:
	|"invalid name format"                                |
	|"invalid email format"                               |
	|"attach CV" becomes red                              |
	|"I agree to the personal data processing" becomes red|

Scenario Outline: form with only invalid name on it can not be sent
	When user clicks on "Send CV" button
	And all fields are empty except name with <name>
	Then form is not sent
	And following errors are displayed appropriate fields:
	|"invalid name format"                                |
	|"this field is required"                             |
	|"attach CV" becomes red                              |
	|"I agree to the personal data processing" becomes red|

	Examples: 
	|name            |
	|Евгений         |
	|Евгений Савостин|
	|Eugene          |
	|asdadgsgdfm     |
	|@!#!@#$!@$      |

Scenario Outline: form with only valid name on it can not be sent
	When user clicks on "Send CV" button
	And all fields are empty except name with <name>
	Then form is not sent
	And following errors are displayed appropriate fields:
	|"this field is required"                             |
	|"attach CV" becomes red                              |
	|"I agree to the personal data processing" becomes red|

	Example: Eugene Savostin

Scenario Outline: form with only invalid email on it can not be sent
	When user clicks on "Send CV" button
	And all fields are empty except email with <email>
	Then form is not sent
	And following errors are displayed appropriate fields:
	|"this field is required"                             |
	|"invalid email format"                               |
	|"attach CV" becomes red                              |
	|"I agree to the personal data processing" becomes red|

	Examples: 
	|email      |
	|dadassdf   |
	|dadada@mail|

Scenario Outline: form with only valid email on it can not be sent
	When user clicks on "Send CV" button
	And all fields are empty except email with <email>
	Then form is not sent
	And following errors are displayed appropriate fields:
	|"this field is required"                             |
	|"attach CV" becomes red                              |
	|"I agree to the personal data processing" becomes red|

	Examples: 
	|email            |
	|myemail@gmail.com|
	|test@mail.ru     |

Scenario: form with only attached CV on it can not be sent
	When user clicks on "Send CV" button
	And all fields are empty except CV is attached
	Then form is not sent
	And following errors are displayed appropriate fields:
	|"this field is required"|
	|"this field is required"|
	|"I agree to the personal data processing" becomes red|

Scenario Outline: form with all valid data except name on it can not be sent
	Given field name contains <name>
	And field email contains <email>
	And CV is attached
	And confirmation of data processing is true
	When user clicks on "Send" button
	Then form is not sent
	And following error is displayed under field "name":
	|"invalid name format"|

	Examples: 
	|name  |email           |
	|Eugene|eugene@gmail.com|

Scenario Outline: form with all valid data except email on it can not be sent
	Given field name contains <name>
	And field email contains <email>
	And CV is attached
	And personal data processing is confirmed
	When user clicks on "Send" button
	Then form is not sent
	And following error is displayed under field "email":
	|"invalid email format"|

	Examples: 
	|name           |email              |
	|Marina Sidorova|thisMailIsIncorrect|

Scenario: form can not take file with invalid type
	When user chooses file with invalid type to input
	Then the file is not taken
	And the window with following text appears:
	"""
	Something went wrong
	Invalid file format. Please try PDF, DOC, DOCX or RTF
	"""

Scenario: form can not take file heavier than 10MB
	When user chooses file that is heavier than 10MB
	Then the file is not taken
	And the window with following text appears:
	"""
	Something went wrong
	Max file size 10 Mb 
	"""

Scenario Outline: form can not be sent without confirmation of personal data processing
	Given field name contains <name>
	And field email contains <email>
	And CV is attached
	And personal data processing is not confirmed
	When user clicks on "Send" button
	Then form is not sent
	And "I agree with personal data processing" becomes red

	Examples:
	|name              |email             |
	|Alexandr Mikhailov|testmail@gmail.com|

Scenario Outline: form with all valid data and confirmation of personal data processing can be sent
	Given field name contains <name>
	And field email contains <email>
	And CV is attached
	And personal data processing is confirmed
	When user clicks on "Send" button
	Then form is sent

	Examples:
	|name     |email           |
	|Test Test|testmail@mail.ru|