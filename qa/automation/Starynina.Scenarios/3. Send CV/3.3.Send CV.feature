Feature: 3.3. Send CV

Background:
Given user is on the page with description of QA Engineer (Life Science project) position https://career.quantori.com/ru/positions/qa-engineer-life-science-project

Scenario: 3.3_01 User can use the "Send CV" button
	When user clicks the "Send CV" button
	Then the page is being scrolled down to the CV form

Scenario: 3.3_02 User can scroll the page
	When user uses the scroll on the side bar
	Then the page is being scrolled down to the CV form
	
Scenario: 3.3_03 User can't send empty CV form
	When user clicks the "Send" button
	Then the error messages "This field is required" for "Name" and "Email" fields is appeared
	And the "Name" and "Email" field, "Attach CV" button and the checkbox "I agree to the personal data processing" are highligted in red
	And the CV form is not sent

Scenario: 3.3_04 User can choose CV file from local PC
	When user clicks the "Attach CV" button
	Then the window to choose the file from local PC is opened

Scenario Outline: 3.3_05 User enters various types of name in the CV form 
	When user enters <name> in the "Name" field
	Then the result <result> is appeared

	Examples:
	| name                    | result                   |
	|                         | "This field is required" |
	| n                       | "Invalid name format"    |
	| nina                    | "Invalid name format"    |
	| nina 1988               | "Invalid name format"    |
	| /*-+?:%; 909            | "Invalid name format"    |
	| n s                     | accepted                 | 
	| nina star               | accepted                 | 
	| (two words in Cyrillic) | accepted                 | 

Scenario: 3.3_06 User enters name with more than maximum characters in the CV form 
	When user enters name of 71 characters or more in the "Name" field
	Then the error messages "The maximum number of characters is 70" for "Name" field is appeared
	And the "Name" field is highligted in red

Scenario Outline: 3.3_07 User enters various types of email in the CV form
	When user enters <email> in the "Email" field
	Then the result <result> is appeared

	Examples:
	| email                      | result                   |
	|                            | "This field is required" |
	| nina.gmail.com             | "Invalid name format"    |
	| 123                        | "Invalid name format"    |
	| nina@mail@.com             | "Invalid name format"    |
	| star@gmail.com             | accepted                 | 
	| star@mail.ru               | accepted                 | 
	| "wordInCyrillic"@gmail.com | accepted                 | 

Scenario: 3.3_08 User enters email with more than maximum characters in the CV form 
	When user enters name of 71 characters or more in the "Email" field
	Then the error messages "The maximum number of characters is 70" for "Name" field is appeared
	And the "Email" field is highligted in red

Scenario: 3.3_09 User enters message with more than maximum characters in the CV form 
	When user enters data of 501 characters or more in the "Message" field
	Then the error messages "The maximum number of characters is 500" for "Message" field is appeared
	And the "Message" field is highligted in red

Scenario Outline: 3.3_10 User can't attach CV file of invalid file format
	When user clicks the "Attach CV" button
	And user chooses file of <invalid format>
	Then the error messages "Something went wrong Invalid file format. Please try PDF, DOC, DOCS or RTF" is appeared
	And the "Attach CV" button is highligted in red

	Examples:
	| invalid format |
	| JPEG           |
	| TXT            |
	| AVI            |

Scenario: 3.3_11 User can't attach CV file of wrong file size
	When user clicks the "Attach CV" button
	And user chooses file of valid DOC format 10.1 Mb size
	Then the error messages "Something went wrong Max file size 10 Mb" is appeared
	And the "Attach CV" button is highligted in red

Scenario: 3.3_12 User can fill the CV form with valid text data
	When user enters valid name of more than one words "Nina star" in the "Name" field
	And user enters valid email "star@gmail.com" in the "Email" field
	And user enters message "Hello" in the "Message" field
	And user clicks at any place on the page
	Then the "Name", "Email" and "Message" fields are highligted in green

Scenario Outline: 3.3_13 User can send the CV form
	When user enters <valid name> in the "Name" field
	And user enters <valid email> in the "Email" field
	And user clicks the "Attach CV" button and attach CV of <valid format> and <valid size>
	And user clicks the checkbox "I agree to the personal data processing" <checkbox>
	And user clicks the "Send" button
	Then the CV form is sent successfully and the message "Thanks for being awesome! We have received your message and will come back to you as soon as we process it." is appeared

	Examples:
	| valid name              | valid email                | valid format | valid size |
	| n s                     | star@gmail.com             | PDF          | 0.01 Mb    |
	| nina star               | star@mail.ru               | DOC          | 5 Mb       |
	| (two words in Cyrillic) | "wordInCyrillic"@gmail.com | RTF          | 9.99 Mb    |

Scenario Outline: 3.3_14 User can't leave required fields in the CV form empty
	When user enters <valid_invalid> data in the required fields <name>, <email>, <Attach CV>
	And user leaves the checkbox <checkbox> "I agree to the personal data processing" <empty_not empty>
	And user clicks the "Send" button
	Then the <result> is <accepted_error>

		Examples:
		| name      | email     | Attach CV  | checkbox  | result   |
		| invalid   | invalid   | invalid    | empty     | error    |
		| invalid   | invalid   | invalid    | not empty | error    |
		| invalid   | invalid   | valid      | empty     | error    |
		| invalid   | invalid   | valid      | not empty | error    |
		| invalid   | valid     | invalid    | empty     | error    |
		| invalid   | valid     | invalid    | not empty | error    |
		| invalid   | valid     | valid      | empty     | error    |
		| invalid   | valid     | valid      | not empty | error    |
		| valid     | invalid   | invalid    | empty     | error    |
		| valid     | invalid   | invalid    | not empty | error    |
		| valid     | invalid   | valid      | empty     | error    |
		| valid     | invalid   | valid      | not empty | error    |
		| valid     | valid     | invalid    | empty     | error    |
		| valid     | valid     | invalid    | not empty | error    |
		| valid     | valid     | valid      | empty     | error    |
		| valid     | valid     | valid      | not empty | accepted |
		
	And empty required fields are highlighted in red
	And filled fields with invalid data are highlighted in red
	And filled fields with valid data are highlighted in green