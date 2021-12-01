Feature: 1.1.2 Send_CV.feature

Background: 
	Given user accessed Quantori Career Portal from his browser
	And user scrolled down to CV sending form

Scenario: 1.1.2_01 User can successfully send CV
	Given user inputted "Ivan Ivanov" in field "Name"
	And user inputted "ivan.ivanov@gmail.com" in field "Email"
	And user attached CV with file format being PDF/DOC/DOCX/RTF with size less than 10 Mb
	And user checked Checkbox
	When user clicks Send button
	Then message box "Thanks for being awesome! We have received your message and will come back to you as soon as we process it." should appear
	And form should be empty

Scenario: 1.1.2_02 User can't send empty form
	When user clicks Send button
	Then all required fields should be highlighted in red
	And messages "This field is required" should appear under fields "Name", "Email"
	And button "Attach CV" should be highlighted in red
	And Checkbox's description "I agree to the personal data processing" should be highlighted in red


Scenario: 1.1.2_03 User fills field "Name" with minimum characters
	When user inputs "A B" in field "Name"
	Then field should be highlighted in green

Scenario: 1.1.2_04 User fills field "Name" with more than maximum characters
	When user inputs 71 characters in field "Name"
	Then field should be highlighted in red
	And message "The maximum number of characters is 70" should appear under field "Name"

Scenario: 1.1.2_05 User leaves field "Name" empty
	Given user inputted "ivan.ivanov@gmail.com" in field "Email"
	And user attached CV with file format being PDF/DOC/DOCX/RTF with size less than 10 Mb
	And user checked Checkbox
	And user left field "Name" empty
	When user clicks Send button
	Then field should be highlighted in red
	And message "This field is required" should appear under field "Name"

Scenario: 1.1.2_06 User leaves field "Email" empty
	Given user inputted "Ivan Ivanov" in field "Name"
	And user attached CV with file format being PDF/DOC/DOCX/RTF with size less than 10 Mb
	And user checked Checkbox
	And user left field "Email" empty
	When user clicks Send button
	Then field should be highlighted in red
	And message "This field is required" should appear under field "Email"

Scenario: 1.1.2_07 User fills field "Email" with more than maximum characters
	When user inputs 71 characters in field "Email"
	Then field should be highlighted in red
	And message "The maximum number of characters is 70" should appear under field "Email"

Scenario: 1.1.2_08 User fills field "Email" with invalid address
	When user inputs email "ivan.ivanovgmail.com" in field "Email"
	Then field should be highlighted in red
	And message "Invalid email format" should appear under field "Email"

Scenario: 1.1.2_09 User can't input 2 email addresses
	When user inputs 2 email addresses in field "Email"
	Then field should be highlighted in red
	And message "Invalid email format" should appear under field "Email"

Scenario: 1.1.2_10 User leaves Checkbox unchecked
	Given user inputted "Ivan Ivanov" in field "Name"
	And user inputted "ivan.ivanov@gmail.com" in field "Email"
	And user attached CV with file format being PDF/DOC/DOCX/RTF with size less than 10 Mb
	And user left Checkbox unchecked
	When user clicks Send button
	Then Checkbox's description "I agree to the personal data processing" should be highlighted in red

Scenario: 1.1.2_11 User can't attach invalid file format
	Given user clicked "Attach CV" button
	When user chooses file with TXT format 
	Then message box "Something went wrong Invalid file format. Please try PDF, DOC, DOCX or RTF." should appear

Scenario: 1.1.2_12 User can't attach files with size more than 10 Mb 
	Given user clicked "Attach CV" button
	When user chooses file with 11 Mb size
	Then message box "Something went wrong Max file size 10 Mb" should appear

Scenario Outline: 1.1.2_13 User attaches message
	When user inputs <Numer> characters 
	Then field should be highlighted in green 

	Examples:
		| Number |
		| 1      |
		| 250    |
		| 500    |

Scenario: 1.1.2_14 User attaches message
	When user inputs 501 characters
	Then field should be highlighted in red
	And message "The maximum number of characters is 500" should appear under field "Message"

Scenario: 1.1.2_15 User reloads the page after filling the form
	Given user inputted "Ivan Ivanov" in field "Name"
	And user inputted "ivan.ivanov@gmail.com" in field "Email"
	And user attached CV with file format being PDF/DOC/DOCX/RTF with size less than 10 Mb
	And user checked Checkbox
	When user reloads the page 
	Then form should be empty



