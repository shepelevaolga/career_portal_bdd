Feature: 3.2. Send CV

Background:
Given user is on the page with description of QA Engineer (Life Science project) position https://career.quantori.com/ru/positions/qa-engineer-life-science-project

Scenario: 3.2_01 User can use the "Send CV" button
	When user clicks the "Send CV" button
	Then the page should be scrolled down to the CV form

Scenario: 3.2_02 User can scroll the page
	When user uses the scroll on the side bar
	Then the page should be scrolled down to the CV form

@negative
Scenario: 3.2_03 User can't send empty CV form
	When user clicks the "Send" button
	Then the error messages "This field is required" for "Name" and "Email" fields is appeared
	And the "Name" and "Email" field, "Attach CV" button and the checkbox "I agree to the personal data processing" are highligted in red
	And the CV form should not be sent

Scenario: 3.2_04 User can choose CV file from local PC
	When user clicks the "Attach CV" button
	Then the window to choose the file from local PC should be opened

Scenario Outline: 3.2_05 User enters various types of name in the CV form 
	When user enters <name> in the "Name" field
	Then the result <result> should appeared

	Examples:
	| name                                                   | result                       |
	| nothing entered ()                                     | "This field is required" |
	| one character (n)                                      | "Invalid name format"    |
	| one word (nina)                                        | "Invalid name format"    |
	| one word, space, numberes (nina 1988)                  | "Invalid name format"    |
	| special symbols, space, special symbols (/*-+?:%; 909) | "Invalid name format"    |
	| two characters with space in between (n s)             | accepted                 | 
	| two words in English (nina star)                         | accepted                 | 
	| two words in Cyrillic                                  | accepted                 | 

@negative
Scenario: 3.2_06 User enters name with more than maximum characters in the CV form 
	When user enters name of 71 characters or more in the "Name" field
	Then the error messages "The maximum number of characters is 70" for "Name" field is appeared
	And the "Name" field should be highligted in red

Scenario Outline: 3.2_07 User enters various types of email in the CV form
	When user enters <email> in the "Email" field
	Then the result <result> should appear

	Examples:
	| email                                | result                   |
	| nothing entered ()                   | "This field is required" |
	| email without @ (nina.gmail.com)     | "Invalid name format"    |
	| numbers (123)                        | "Invalid name format"    |
	| email without two @ (nina@mail@.com) | "Invalid name format"    |
	| email with .com (star@gmail.com)     | accepted                 | 
	| email with .ru (star@mail.ru)        | accepted                 | 
	| email with wordInCyrillic@gmail.com  | accepted                 | 

@negative
Scenario: 3.2_08 User enters email with more than maximum characters in the CV form 
	When user enters name of 71 characters or more in the "Email" field
	Then the error messages "The maximum number of characters is 70" for "Name" field is appeared
	And the "Email" field should be highligted in red

@negative
Scenario: 3.2_09 User enters message with more than maximum characters in the CV form 
	When user enters data of 501 characters or more in the "Message" field
	Then the error messages "The maximum number of characters is 500" for "Message" field should appear
	And the "Message" field should be highligted in red

Scenario Outline: 3.2_10 User can't attach CV file of invalid file format
	Given user clicks the "Attach CV" button
	When user chooses file of <invalid format>
	Then the error messages "Something went wrong Invalid file format. Please try PDF, DOC, DOCS or RTF" should appear

	Examples:
	| invalid format |
	| JPEG           |
	| TXT            |
	| AVI            |

Scenario: 3.2_11 User can't attach CV file of wrong file size
	Given user clicks the "Attach CV" button
	When user chooses file of valid DOC format 10.1 Mb size
	Then the error messages "Something went wrong Max file size 10 Mb" is appeared

Scenario: 3.2_12 User can fill the CV form with valid text data
	Given user enters valid name of more than one words "Nina star" in the "Name" field
	And user enters valid email "star@gmail.com" in the "Email" field
	And user enters message "Hello" in the "Message" field
	When user clicks at any place on the page
	Then the "Name", "Email" and "Message" fields are highligted in green

Scenario Outline: 3.2_13 User can send the CV form
	Given user enters <valid name> in the "Name" field
	And user enters <valid email> in the "Email" field
	And user clicks the "Attach CV" button and attach CV of <valid format> and <valid size>
	And user clicks the checkbox "I agree to the personal data processing" <checkbox>
	When user clicks the "Send" button
	Then the CV form is sent successfully and the message "Thanks for being awesome! We have received your message and will come back to you as soon as we process it." should appeared

	Examples:
	| valid name                       | valid email                         | valid format | valid size |
	| two characterw (n s)             | email with .com (star@gmail.com)    | PDF          | 0.01 Mb    |
	| two words in English (nina star) | email with .tu (star@mail.ru)       | DOC          | 5 Mb       |
	| two words in Cyrillic            | email with wordInCyrillic@gmail.com | RTF          | 9.99 Mb    |

Scenario Outline: 3.2_14 User can't leave required fields in the CV form empty
	Given user enters <valid_invalid> data in the required fields <name>, <email>, <Attach CV>
	And user leaves the checkbox <checkbox> "I agree to the personal data processing" <empty_not empty>
	When user clicks the "Send" button
	Then the <result> should be <accepted_error>

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
		
	And empty required fields should be highlighted in red
	And filled fields with invalid data should be highlighted in red
	And filled fields with valid data should be highlighted in green