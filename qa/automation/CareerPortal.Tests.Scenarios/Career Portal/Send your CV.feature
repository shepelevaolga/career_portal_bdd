Feature: "Send us your CV" form

Background: User is on Career Portal page (https://career.quantori.com/ru)

Scenario Outline: 1.1 User can fill in text fields
	When User clicks the <field> text field 
	Then the <field> text field is available for text entry

	Examples:
	|  field  |
	|  "Name" |
	| "Email" |
	|"Message"|

Scenario: 1.2 User can fill the "I agree to the personal data processing" checkbox
	When User clicks the "I agree to the personal data processing" checkbox
	Then the "I agree to the personal data processing" checkbox is checked

Scenario: 1.3 "Attach CV" button opens available files
	When User clicks the "Attach CV" button
	Then modal window with available device files opens

Scenario Outline: 2.1.1 "Name" text field is valid
	When "Name" text field filled in with <text>
	Then line under "Name" text field should turn green

	Examples:
    | text |
    |"Name Name"|
	|"Имя Имя"| 

Scenario Outline: 2.1.2 "Name" text field is not valid
	When "Name" text field filled in with <text>
	Then red "Invalid name format" message box should appear under the "Name" text field
	
	Examples:
    | text |
    |"    "|  
    | "11" |
	| "a"  |
	|"/Name"|
	|"Name Имя"|

Scenario: 2.2.1 "Name" text field with 71 symbols
	When "Name" field filled in with "Name Namenamenamenamenamenamenamenamenamenamenamenamenamenamenamenamena"
	Then red "The maximum number of characters is 70" message box should appear under the "Name" text field

Scenario: 2.2.2 "Name" text field with 70 symbols
	When "Name" field filled in with "Name Namenamenamenamenamenamenamenamenamenamenamenamenamenamenamenamen"	
	Then line under "Name" text field should turn green

Scenario: 2.2.3 "Name" text field with 69 symbols
	When "Name" field filled in with "Name Namenamenamenamenamenamenamenamenamenamenamenamenamenamenamename"
	Then line under "Name" text field should turn green	

Scenario Outline: 3.1.1 "Email" text field is valid
	When "Email" text field filled in with <text>
	Then line under "Email" text field should turn green

	Examples:
	|     text    |
	| test@test.ru|
	|test@test.com|

Scenario Outline: 3.1.2 "Email" text field is not valid
	When "Email" text field filled in with <text>
	Then red "Invalid email format" message box should appear under the "Email" text field
	
	Examples:
	|     text    |
	| test@@test.com|
	| test)@test.ru |
	| test*@test.com|
	| test@тест.com |
	|test..@test.com|
	| .test@test.ru |

Scenario: 3.2 Confirmation when the email is correct
	Given User has entered the correct email
	And User fills in all of the required fields with valid data
	When User clicks the "Send" button
	Then a letter of confirmation should be send to the specified email
 
Scenario Outline: 4.1 User can open a valid CV file 
	When User clicks the "Attach CV" button
	Then modal window with available <format> device files opens

	Examples:
	|format|
    | PDF  |
	| DOC  | 
	| DOCX |
	| RTF  | 

Scenario Oitline: 4.2 User can attach only a valid CV file
	When User attaches a <format> <size> file
	Then file attachment should be <status>
	
	Examples:
	|format| size |  status  |
    | PDF  |10,1Mb|  failed  |
	| DOC  | 10Mb |successful|
	| DOCX | 9,9Mb|successful|
	| RTF  | 1Mb  |successful|
	| PNG  | 8Mb  |  failed  |
	| JPEG | 11Mb |  failed  |

 Scenario: 4.3 "Attach CV" button when valid file is attached
	When User attaches a valid CV file
	Then "Attach CV" button should turn green
	And "Attach CV" buttion should be still available for User to click

Scenario: 4.4 Changing CV file for a new one
	Given User has attached a valid CV file 
	When User clicks "Attach CV" button 
	And User chooses a new file through the modal window with available <format> device files 
	Then new file is attached
	
	Examples:
	|format|
    | PDF  |
	| DOC  | 
	| DOCX |
	| RTF  | 

Scenario: 5.1 "Send" button if all mandatory requirements are met
	Given User has correctly filled in the "Name" and "Email" text fields
	And User has attached a CV file
	And User has checked "I agree to the personal data processing" checkbox
	When User clicks the Send button
	Then CV file sent successfully 

Scenario: 5.2.1 "Send" button without filled in the "Name" texted field
	Given User has correctly filled in the "Email" text field
	And User has attached a CV file
	And User has checked "I agree to the personal data processing" checkbox
	But User has not filled in the "Name" text field
	When User clicks "Send" button
	Then red "This field is required" message box should appear under the "Name" texted field

Scenario: 5.2.2 "Send" button without filled in the "Email" texted field
	Given User has correctly filled in the "Name" text field
	And User has attached a CV file
	And User has checked "I agree to the personal data processing" checkbox
	But User has not filled in the "Email" text field
	When User clicks "Send" button
	Then red "This field is required" message box should appear under the "Email" texted field

Scenario: 5.2.3 "Send" button without attached CV file
	Given User has correctly filled in the "Name" and "Email" text fields
	And User has checked "I agree to the personal data processing" checkbox
	But User has not attached a CV file
	When User clicks "Send" button
	Then text "Attach CV" inside the "Attach CV" button should turn red

Scenario: 5.2.4 "Send" button without checked "I agree to the personal data processing" checkbox
	Given User has correctly filled in the "Name" and "Email" text fields
	And User has attached a CV file
	But User has not checked "I agree to the personal data processing" checkbox
	When User clicks "Send" button
	Then text "I agree to the personal data processing" should turn red

Scenario: 5.2.5 "Send" button without filled in "Message" text field
	Given User has correctly filled in the "Name" and "Email" text fields
	And User has attached a CV file
	And User has checked "I agree to the personal data processing" checkbox
	But User has not filled in "Message" text field
	When User clicks the Send button
	Then CV file sent successfully