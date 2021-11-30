Feature: 1.1_Send_CV.feature

Background:
Given user is on the page https://career.quantori.com/ and CV form is clear

Scenario Outline: 1.1.1 Different cases of filling CV form
	When user fills <Name> field <valid_invalid> data
	And user fills <Email> field <valid_invalid> data
	And user <fills_nofills>  <Message> field
	And user <attaches_noattaches>  <CV>
	And user <checks_nochecks> <checkbox>
	And user clicks Send button
	Then <Result> <noerror_error> is expected
	Examples:
	|  Name   |  Email  |  Message    |    CV        |  checkbox   |  Result  |
	| valid   | valid   | filled      | attached     | checked     | noerror  |
	| valid   | valid   | not filled  | attached     | checked     | noerror  |
	| valid   | invalid | filled      | attached     | checked     | error    |
	| invalid | valid   | filled      | attached     | checked     | error    |
	| valid   | valid   | filled      | not attached | checked     | error    |
	| invalid | valid   | filled      | attached     | not checked | error    |
	| invalid | invalid | filled      | not attached | not checked | error    |
	| invalid | invalid | not filled  | not attached | not checked | error    |
	| invalid | invalid | filled      | attached     | checked     | error    |
	| invalid | invalid | not filled  | attached     | checked     | error    |
	| valid   | invalid | filled      | not attached | checked     | error    |
	| valid   | valid   | filled      | not attached | not checked | error    |
	| invalid | valid   | filled      | not attached | checked     | error    |
	| invalid | valid   | filled      | attached     | not checked | error    |
	| valid   | invalid | filled      | attached     | not checked | error    |
	| valid   | invalid | not filled  | not attached | not checked | error    |
	| invalid | valid   | not filled  | not attached | not checked | error    |
	| invalid | invalid | not filled  | attached     | not checked | error    |
	| invalid | invalid | not filled  | not attached | checked     | error    |


Scenario Outline: 1.1.2 Different datatypes in CV
	Given other fields of CV form are filled with valid data
	When user attaches <CV>
	And user clicks Send button
	Then <Result> <noerror_error> is expected
	Examples:
	|  CV  | Result  |
	| docx | noerror |
	| doc  | noerror |
	| PDF  | noerror |
	| RTF  | noerror |
	| txt  | error   |
	| exe  | error   |
	| zip  | error   |
	| rar  | error   |
	| png  | error   |
	| jpeg | error   |
	|aaaaaa| error   |


Scenario Outline: 1.1.3 Sizes of <CV> file
	Given other fields of CV form are filled with valid data
	When user attaches <CV>
	And user clicks Send button
	Then <Result> <noerror_error> is expected
	Examples:
	| CV      | Result  |
	| 5 Mb    | noerror |
	| 9 Mb    |  noerror|
	| 9.9 Mb  | noerror |
	| 10 Mb   | noerror |
	| 10.1 Mb |  error  |
	| 11 Mb   |  error  |
	| 100 Mb  |  error  |



Scenario: 1.1.4 Send an empty CV form
	Given all fields of CV form are empty 
	When user clicks Send button
	Then Attach CV button and "I agree to the personal data processing" paint in red 
	And red "This field is required" message appears

Scenario Outline: 1.1.5 Lenght of message is less or more or equals 500 characters
	When user enters <message> of <length> 
	Then red <error_message> "The maximum number of characters is 500" <appears_noappears>
	Examples:
	| message | error_message |
	| 0       | not appears   |
	| 1       | not appears   |
	| 100     | not appears   |
	| 490     | not appears   |
	| 499     | not appears   |
	| 500     | not appears   |
	| 501     | appears       |
	| 510     | appears       |
	| 900     | appears       |
	| 1000    | appears       |

Scenario Outline: 1.1.6 Format of Email is *@*.?*
	When user enters <Email> of <format>
	And numbers after "." are prohiibited
	Then red <message> "Invalid email format" <appears_noappears>
	Examples:
	| Email         | message     |
	| a@a.pa        | not appears |
	| a@a.a         | appears     |
	| aa.pa         | appears     |
	| a             | appears     |
	| a@a..pa       | appears     |
	| a@@a.pa       | appears     |
	| @a.pa         | appears     |
	| 1@a.pa        | not appears |
	| a@a.1a        | appears     |
	| a@a.pa a@a.pa | appears     |
	| a@a.pa 123    | appears     |


Scenario Outline: 1.1.7 Entering different types of names in the Name field
	When user enters <Name> of <format>
	Then red <message> "Invalid name format" <appears_noappears>
	Examples: 
	| Name    |   message   |
	|  A A    | not appears |
	| a a     | not appears |
	|  A      |   appears   |
	| a       |   appears   |
	| 123     |   appears   |
	| 123     |   appears   |
	|  A A A  | not appears |
	|  a a a  | not appears |
	|  A a a  | not appears |
	|  a A a  | not appears |
	|  a a A  | not appears |
	|  A A a  | not appears |
	|  a A A  | not appears |
	| A A 123 |     appears |
	| A@ A A  |     appears |
	| A A A A | not appears |


Scenario: 1.1.8 Send an CV form without filled CV and clicked checkox 
	Given Email and Name fields are filled with valid data
	When user clicks Send button
	Then Attach CV button and "I agree to the personal data processing" paint in red 

Scenario: 1.1.9 Send an CV form without filled Name and Email 
	Given Email and Name fields are empty 
	And CV is attached 
	And Checkbox is checked
	When user clicks Send button
	Then red "This field is required" message appears


Scenario: 1.1.10 Send an CV form without filled Name and CV 
	Given Name field is empty 
	And CV is not attached 
	And Checkbox is checked 
	And Email is filled with valid data
	When user clicks Send button
	Then red "This field is required" message appears
	And Attach CV button paints in red 

Scenario: 1.1.11 Send an CV form without filled Email and checked checkbox
	Given Email field is empty 
	And CV is attached 
	And Checkbox is not checked 
	And Name is filled with valid data
	When user clicks Send button
	Then red "This field is required" message appears
	And "I agree to the personal data processing" paint in red

