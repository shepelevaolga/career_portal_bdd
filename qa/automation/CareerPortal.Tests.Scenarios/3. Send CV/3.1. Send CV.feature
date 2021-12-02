Feature: 3.1. Send CV

Background: 
	Given User is on the Job description page of the Carrier Portal
	And the Send CV form is visible
	And the Send CV form is clear
	Example: https://career.quantori.com/ru/positions/cloud-python-engineer

	
@Type:Positive
@HappyPass
@Priority:Critical
Scenario Outline: 3.1_01 Fill the Send CV form form with correct data
	
	When user enters correct data into the field "Name": <Name>
	And user enters correct data into the field "Email": <Email>
	And user presses "Attach CV" button and choses a file in correct format (PDF / DOC / DOCX / RTF / Max 10 Mb)
	And user checks the checkbox "I agree to the personal data processing"
	And user presses "Send" button
	Then the following message should be displayed on the screen:
		| "Thanks for being awesome!" |
	And "Ok" button should be visible
	Examples: 
		|Name       |Email            |
		|Test Testov|test@quantori.com|


@Type:Positive
@Priority:Critical
Scenario Outline: 3.1_02 Fill the field "Name" with correct data
	When user enters "<sample data>" (<comment>) value into the "Name" field
	And user clicks on another form field to move the focus
	Then a green check mark appears at the right side of the "Name" field
	Examples:
		|sample data|comment                         |
		|Olga N     |two words, English              |
		|Ольга Н    |two words, non-English          |
		|Olga S N   |more than two words, English    |
		|Ольга С Н  |more than two words, non-English|
		


@Type:Positive
@Priority:Critical
Scenario Outline: 3.1_03 Attach correct CV file
	When user presses "Attach CV" button
	And user choses a file in <Format> format
	And with <Size> size
	And with <Extension> extension 
	Then attached file name should be displayed under the "Attach CV" button
	Examples:
		|Format|Extension|
		|PDF   |.pdf     |
		|DOC   |.doc     |
		|DOCX  |.docx    |
		|RTF   |.rtf     |
	Examples:
		|Size  |
		|1 byte|
		|1 Mb  |
		|8 Mb  |
		|10 Mb |
	
@Type:Negative
@Priority:Critical
Scenario Outline: 3.1_04 Fill the field "Name" with incorrect data
	When user enters "<sample data>" (<comment>) value into the "Name" field
	And user clicks on another form field to move the focus
	Then a red exclamation mark (!) appears at the right side of the "Name" field
	Examples:
		|sample data         |comment              |
		|                    |empty field          |
		|                    |one or more spaces   |
		|Olga                |one word             |
		|Ольга               |one word, non-English|
		|11111553            |digits, one word     |
		|132342 678          |digits, two words    |
		|Olg@ 'One'          |special characters   |
		|true evil';SELECT 1;|SQL injection        |
		

@Type:Negative
@Priority:Critical
Scenario Outline: 3.1_05 Fill the field "Email" with incorrect data
	When user enters "<sample data>" (<comment>) value into the "Email" field
	And user clicks on another form field to move the focus
	Then a red exclamation mark (!) appears at the right side of the "Email" field
	Examples:
		|sample data |comment                           |
		|            |empty field                       |
		|            |one or more spaces                |
		|@.com       |empty username and domain         |
		|вася@mail.ру|with non-English symbols in domain|
		|test@.      |invalid domain                    |
		|@mail.ru    |empty username                    |
		

@Type:Negative
@Priority:Critical
Scenario Outline: 3.1_06 User did not check the "I agree to the personal data processing" checkbox
	Given user filled all form with correct data
	And user attached CV in correct format
	When user did not check checkbox "I agree to the personal data processing"
	And user pressed "Send" button
	Then "I agree to the personal data processing" text near the checkbox should become red
	And the form is not sent, e.g. "Thanks for being awesome!" message does not appear

@Type:Negative
@Priority:Critical
Scenario Outline: 3.1_07 Attach incorrect CV file
	Given user filled all form with correct data
	When user attached CV file with the following parameters: <description>
	And user pressed "Send" button
	Then a message should appear: "Something went wrong"
	Examples:
		|description                                  |
		|file with .jpeg extension - wrong file format|
		|file with .pdf extension, >10 Mb size        |

@Type:Negative
@Priority:Critical
Scenario Outline: 3.1_08 User did not attach CV file
	Given user filled all form with correct data
	When user did not attach CV file
	And user pressed "Send" button
	Then text on the "Attach CV" button should become red
	And the form is not sent, e.g. "Thanks for being awesome!" message does not appear

@Type:Negative
@Priority:Major
Scenario Outline: 3.1_09 User attached an empty CV file
	Given user filled all form with correct data
	When user attached a CV file with 0 bytes size
	And user pressed "Send" button
	Then text on the "Attach CV" button should become red
	And the form is not sent, e.g. "Thanks for being awesome!" message does not appear