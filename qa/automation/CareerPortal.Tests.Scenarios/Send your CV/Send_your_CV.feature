Feature: 1.1.2 Send_CV.feature

Background: 
	Given user accessed Quantori Career Portal from his browser
	And user scrolled down to CV sending form

Scenario Outline: 1.1.2_01 User can successfully send CV
	Given user inputted "<Name>", "<Email>", "<Checkbox>", "<Message>", attached <CV> in "Attach CV"
	When user clicks Send button
	Then message box "Thanks for being awesome! We have received your message and will come back to you as soon as we process it." should appear
	And form should be empty

	Examples:
		| Name       | Email                 | Checkbox | Message               | CV         |
		|Ivan Ivanov | ivan.ivanov@gmail.com | True     |                       | cv.pdf 5Mb |
		|Ivan Ivanov | ivan.ivanov@gmail.com | True     | Hi, hire me please    | cv.pdf 5Mb |

Scenario Outline: 1.1.2_02 User can't send form with empty required fields
	Given user inputted "<Name>", "<Email>", "<Attach CV>", "<Checkbox>" 
	When user clicks Send button
	Then form shouldn't be sent, empty field should be highlighted in red

	Examples:
		|Name        |Email                 | Attach CV |Checkbox   |
		|            |                      |           | False     |
		|Ivan Ivanov |ivan.ivanov@gmail.com |cv.pdf 5Mb | False     |
		|Ivan Ivanov |ivan.ivanov@gmail.com |           | True      |
		|Ivan Ivanov |                      |cv.pdf 5Mb | True      |
		|            |ivan.ivanov@gmail.com |cv.pdf 5Mb | True      |

Scenario Outline: 1.1.2_03 User inputs valid Name
	When user inputs "<Name>" 
	Then field should be highlighted in green

	Examples:
		| Name                      |
		| I I                       |
		| Иван Иванов               |
		| Ivan-Ivanych Ivan'ov, Jr. |
		| Ivan I                    |

Scenario Outline: 1.1.2_04 User inputs invalid Name
	When user inputs "<Name>" 
	Then field should be highlighted in red
	And message "Invalid name format" should appear

	Examples:
		| Name                |
		| II                  |
		| 123                 |
		| Ivan                |
		| Ivan Ivanov &       |
		| Иван Иванов  31 год |

Scenario: 1.1.2_05 User fills field "Name" with more than maximum characters
	When user inputs 71 characters in field "Name"
	Then field should be highlighted in red
	And message "The maximum number of characters is 70" should appear under field "Name"

Scenario Outline: 1.1.2_06 User fills field "Email" with valid address
	When user inputs "<Email>" 
	Then field should be highlighted in green

	Examples:
		| Email                    |
		| ivan.ivanov@mail.ru      |
		| ivan_ivanov@gmail.com    |
		| ivan.ivanov31@mail.ru    |
		| ivanivanov@you.me.net    |

Scenario Outline: 1.1.2_07 User fills field "Email" with invalid address
	When user inputs "<Email>" 
	Then field should be highlighted in red
	And message "Invalid email format" should appear

	Examples:
		| Email                           |
		| 123                             |
		| ivan.ivanovmail.ru              |
		| ivan.ivanov@                    |
		| ivan.ivanov@mail                |
		| ivan.ivanov@.mail.ru            |
		| ivan.i@mail.ru ivan.i@gmail.com |

Scenario: 1.1.2_08 User fills field "Email" with more than maximum characters
	When user inputs 71 characters in field "Email"
	Then field should be highlighted in red
	And message "The maximum number of characters is 70" should appear under field "Email"

Scenario Outline: 1.1.2_09 User can attach valid file format with allowed size
	Given user clicked "Attach CV" button
	When user chooses <File> 
	Then file should be attached 

	Examples:
		| File           |
		| cv.pdf 2Mb     |
		| cv.doc 15kB    |
		| cv.docx 10Mb   |
		| cv.rtf 9Mb     |

Scenario Outline: 1.1.2_10 User can't attach invalid file format
	Given user clicked "Attach CV" button
	When user chooses file with <Format> 
	Then message box "Something went wrong Invalid file format. Please try PDF, DOC, DOCX or RTF." should appear

	Examples:
		| Format  |
		| .txt    |
		| .jpg    |
		| .zip    |
		| .fb2    |

Scenario: 1.1.2_11 User can't attach files with size more than 10 Mb 
	Given user clicked "Attach CV" button
	When user chooses file with 11 Mb size
	Then message box "Something went wrong Max file size 10 Mb" should appear

Scenario Outline: 1.1.2_12 User attaches message
	When user inputs <Number> characters 
	Then field should be highlighted in green 

	Examples:
		| Number |
		| 1      |
		| 250    |
		| 500    |

Scenario: 1.1.2_13 User can't attach too big message
	When user inputs 501 characters
	Then field should be highlighted in red
	And message "The maximum number of characters is 500" should appear under field "Message"

Scenario Outline: 1.1.2_14 User reloads the page after filling the form
	Given user inputted "<Name>", "<Email>", "<Checkbox>", "<Message>", attached <CV> in "Attach CV"
	When user reloads the page 
	Then form should be empty

	Examples:
		| Name       | Email                 | Checkbox | Message               | CV         |
		|Ivan Ivanov | ivan.ivanov@gmail.com | True     |                       | cv.pdf 5Mb |
		|Ivan Ivanov | ivan.ivanov@gmail.com | True     | Hi, hire me please    | cv.pdf 5Mb |




