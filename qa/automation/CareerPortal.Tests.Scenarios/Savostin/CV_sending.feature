Feature: 1.0.0 Sending CV
Background: 
	Given https://career.quantori.com page is opened
	And only valid CV can be attached to form
	And all files are in Savostin-folder

Scenario:1.0.0_01 empty form can not be sent
	When user clicks on "Send" button
	And all fields are empty
	Then form is not sent
	And following are displayed appropriate fields:
	|"invalid name format"                                |
	|"invalid email format"                               |
	|"attach CV" becomes red                              |
	|"I agree to the personal data processing" becomes red|

Scenario Outline:1.0.0_02 form with only invalid name on it can not be sent
	When user clicks on "Send" button
	And all fields are empty except name with <name>
	Then form should not be sent
	And following errors should be displayed appropriate fields:
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

Scenario Outline:1.0.0_03 form with only valid name on it can not be sent
	When user clicks on "Send" button
	And all fields are empty except name with <name>
	Then form should not be sent
	And following errors should be displayed appropriate fields:
	|"this field is required"                             |
	|"attach CV" becomes red                              |
	|"I agree to the personal data processing" becomes red|

	Example: Eugene Savostin

Scenario Outline:1.0.0_04 form with only invalid email on it can not be sent
	When user clicks on "Send" button
	And all fields are empty except email with <email>
	Then form should not be sent
	And following errors should be displayed appropriate fields:
	|"this field is required"                             |
	|"invalid email format"                               |
	|"attach CV" becomes red                              |
	|"I agree to the personal data processing" becomes red|

	Examples: 
	|email      |
	|dadassdf   |
	|dadada@mail|

Scenario Outline:1.0.0_05 form with only valid email on it can not be sent
	When user clicks on "Send" button
	And all fields are empty except email with <email>
	Then form should not be sent
	And following errors should be displayed appropriate fields:
	|"this field is required"                             |
	|"attach CV" becomes red                              |
	|"I agree to the personal data processing" becomes red|

	Examples: 
	|email            |
	|myemail@gmail.com|
	|test@mail.ru     |

Scenario:1.0.0_06 form with only attached CV on it can not be sent
	When user clicks on "Send" button
	And all fields are empty except CV "valid_file_to_attach.docx" is attached
	Then form should not be sent
	And following errors should be displayed appropriate fields:
	|"this field is required"|
	|"this field is required"|
	|"I agree to the personal data processing" becomes red|

Scenario Outline:1.0.0_07 form with all valid data except name on it can not be sent
	Given field name contains <name>
	And field email contains <email>
	And CV "Valid_file_to_attach.docx" is attached
	And confirmation of data processing is true
	When user clicks on "Send" button
	Then form should not be sent
	And following error should be displayed under field "name":
	|"invalid name format"|

	Examples: 
	|name  |email           |
	|Eugene|eugene@gmail.com|

Scenario Outline:1.0.0_08 form with all valid data except email on it can not be sent
	Given field name contains <name>
	And field email contains <email>
	And CV "Valid_file_to_attach.docx" is attached
	And personal data processing is confirmed
	When user clicks on "Send" button
	Then form should not be sent
	And following error should be displayed under field "email":
	|"invalid email format"|

	Examples: 
	|name           |email              |
	|Marina Sidorova|thisMailIsIncorrect|

Scenario:1.0.0_09 form can not take file with invalid type
	When user chooses file with invalid type to input
	Then the file should not be taken
	And the window with following text appears:
	"""
	Something went wrong
	Invalid file format. Please try PDF, DOC, DOCX or RTF
	"""

Scenario:1.0.0_10 form can not take file heavier than 10MB
	When user chooses file that is heavier than 10MB
	Then the file should not be taken
	And the window with following text appears:
	"""
	Something went wrong
	Max file size 10 Mb 
	"""

Scenario Outline:1.0.0_11 form can not be sent without confirmation of personal data processing
	Given field name contains <name>
	And field email contains <email>
	And CV "Valid_file_to_attach.docx" is attached
	And personal data processing is not confirmed
	When user clicks on "Send" button
	Then form should not be sent
	And "I agree with personal data processing" becomes red

	Examples:
	|name              |email             |
	|Alexandr Mikhailov|testmail@gmail.com|

Scenario Outline:1.0.0_12 form with all valid data and confirmation of personal data processing can be sent
	Given field name contains <name>
	And field email contains <email>
	And CV "Valid_file_to_attach.docx" is attached
	And personal data processing is confirmed
	When user clicks on "Send" button
	Then form should be sent

	Examples:
	|name     |email           |
	|Test Test|testmail@mail.ru|

@Bug
Scenario Outline:1.0.0_13 forms field "mail" validates inputted data correctly
	When user inputs <email>
	Then the following error should be displayed under field "email"
	"""
	invalid email format
	"""
	Examples:
	|email                            |
	|счастьятебе@mail.ru              |
	|издоровья@mail.comcomcomcomcomcom|
	# Fully Qualified Domain Name forbids more than 15 symbols in domain field of address.

Scenario:1.0.0_14 forms field "name" can contain only 70 characters 
	Given the word "Schtroumpf" is copied
	When user pastes the word, types space, pastes the word six more times
	And deletes one symbol
	Then the following colored red error should be displayed under field "name"
	"""
	The maximum number of characters is 70
	"""
	And the error should disappear 
	And the line under the field should become green


