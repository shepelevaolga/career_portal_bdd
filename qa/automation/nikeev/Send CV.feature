Feature: User can send the CV using the form on Quantori career portal

Scenario Outline: User can find the form for sending CV on career portal
	Given user wanted to send the CV to Quantori company
	When user opens the <name of the page> page
	Then user finds the form for sending CV
	And the form includes 'Name', 'Email', 'Message' fields
	And checkbox for agreeing personal data processing
	And 'Attach CV' and 'Send' buttons

	Examples: 
		| name of the page |
		| Main             |
		| Position         |

Scenario Outline: User can send the CV using Send CV form
	Given user found the Send CV form on <name of the page> page
	And filled 'Name' and 'Email' fields correctly
	And attached valid CV file using 'Attach CV' button 
	And agreed personal data processing using checkbox
	And left 'Message' field <status>
	When user clicks 'Send' button
	Then user sees message box with 'Thanks for being awesome! ...' text and 'Ok' button for closing it
	And the form becomes empty and ready for new sending

	Examples: 
		| name of the page |
		| Main             |
		| Position         |
	Examples: 
		| status |
		| empty  |
		| filled |

Scenario: User can close message boxes by clicking on 'Ok' button
	Given user saw the message box with 'Ok' button
	When user clicks on 'Ok' button
	Then message box disappears

Scenario: User can close message boxes by clicking somewhere outside the message box
	Given user saw the message box with 'Ok' button
	When user clicks somewhere outside the message box
	Then message box disappears

Scenario Outline: User can see which of the text fields are required
	Given user started to fills in text fields of the form
	And saw that fields 'Name' and 'Email' (which are required) are starred with star
	And user put the cursor into the empty '<field name>' field
	When user clicks somewhere outside the empty field
	Then the notification "This field is required" appears under the field

	Examples: 
		| field name |
		| Name       |
		| Email      |

Scenario Outline: User can see which of the CV form components are required
	Given user filled the form
	And leaved <required component> empty
	When user tries to send the form by clicking 'Send' button
	Then the form doesn't send 
	And the form gives a warning <notification>

	Examples: 
		| required component     | notification        |
		| Name field             | message under field |
		| Email field            | message under field |
		| Personal data checkbox | color highlighting  |
		| CV Attachment          | color highlighting  |

Scenario Outline: User can see a real time validation of 'Name' field
	Given user filled the Send CV form
	When user types <words> word(s) with <lenght> <latin> letters and <add> in the 'Name' field
	Then user sees <notification> notification in red color under the field
	And the field border line becomes red

	Examples: 
		| words | lenght       | latin     | add     | notification                           |
		| 1     | less than 70 | Latin     | null    | Invalid name format                    |
		| 1     | less than 70 | not Latin | null    | Invalid name format                    |
		| 2     | less than 70 | not Latin | null    | Invalid name format                    |
		| 2     | 71 or more   | Latin     | null    | The maximum number of characters is 70 |
		| 2     | 71 or more   | not Latin | null    | The maximum number of characters is 70 |
		| 1     | 71 or more   | Latin     | null    | The maximum number of characters is 70 |
		| 1     | 71 or more   | not Latin | null    | The maximum number of characters is 70 |
		| 2     | less than 70 | Latin     | numbers | Invalid name format                    |
		| 2     | less than 70 | Latin     | symbols | Invalid name format                    |
		| 0     | 0            | null      | null    | This field is required                 |

Scenario Outline: User can see a real time validation of 'Email' field
	Given user filled the Send CV form
	When user types '<username><@><lvl2><.><lvl1>' with <lenght> symbols in the 'Email' field
	Then user sees <notification> notification in red color under the field
	And the field border line becomes red

	Examples: 
		| username                              | @    | lvl2                                | .    | lvl1                 | lenght       | notification                           |
		| a-z,0-9, symbols (except ,<>[]()\)    | null | a-z,0-9,-                           | .    | existing domain      | less than 70 | Invalid email format                   |
		| a-z,0-9, symbols (except ,<>[]()\)    | @    | a-z,0-9,-                           | null | existing  domain     | less than 70 | Invalid email format                   |
		| a-z,0-9, symbols (except ,<>[]()\)    | @    | a-z,0-9,-                           | .    | existing  domain     | 71 or more   | The maximum number of characters is 70 |
		| a-z,0-9, symbols (including ,<>[]()\) | @    | a-z,0-9,-                           | .    | existing  domain     | less than 70 | Invalid email format                   |
		| a-z,0-9, symbols (except ,<>[]()\)    | @    | a-z,0-9,-                           | .    | non-existent  domain | less than 70 | Invalid email format                   |
		| a-z,0-9, symbols (except ,<>[]()\)    | @    | a-z,0-9,- (including other symbols) | .    | existing  domain     | less than 70 | Invalid email format                   |

Scenario: User can see a real time validation of 'Message' field
	Given user filled the Send CV form
	When user types 501 or more characters in the 'Message' field
	Then user sees 'The maximum number of characters is 500' notification in red color under the field
	And the field border line becomes red

Scenario Outline: User can not upload invalid CV file
	Given user filled the Send CV form
	When user attach <param> <size> CV file using 'Attach CV' button
	Then user sees message box with 'Something went wrong <text>' text and 'Ok' button for closing it

	Examples: 
		| param                                         | text                                                   |
		| not pdf/doc/docx/rtf                          | Invalid file format. Please try PDF, DOC, DOCX or RTF. |
		| more than 10 Mb size                          | Max file size 10 Mb                                    |
		| not pdf/doc/docx/rtf and more than 10 Mb size | Invalid file format. Please try PDF, DOC, DOCX or RTF. |




