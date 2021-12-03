Feature: Sending CV Form
As a user, I want to fill out CV form and submit it
In order the company can consider the user as a potential employee

Background:  
 Given user is on a page on URL "https://career.quantori.com/ru"
 And user rewinds to CV form 

@1
@Name 

Scenario Outline: 1.1.1. Entering different formats of Valid Name   
	When user fills in text field "Name" with "<Valid Name>"
	Then the line under the text field should be highlighted in green
	

	Examples: 
	| Valid Name         |
	| Kseniia Emelianova |
	| Stephen O          |
	| KSENIIA P          |
	
	# тут в зависимости от требований, но подразумеваю баг
Scenario: 1.1.2. Entering name using multiple languages
	When user fills in text field "Name" with "Stephen Ребус"
	Then the line under the text field should be highlighted in green

Scenario Outline: 1.1.3. Entering different formats of Invalid Name   
	When user fills in text field "Name" with "<Invalid Name>"
	Then the line under the text field should be highlighted in red
	And  inscription "Invalid name format" should appear

	Examples: 
	| Invalid Name  |
	| Kseniia       |
	| Kseniia 123   |
	| Kseniia 1.?   |
	| Леся Українка |



@2
@Email

Scenario Outline: 1.1.4. Entering different formats of Valid Email  
	When user fills in text field "Email" with <Valid Email>
	Then the line under the text field should be highlighted in green

	Examples: 
	| Valid Email                     |
	| email@domain.com                |
	| firstemail.lastemail@domain.com |
	| firstemail+lastemail@domain.com |
	| email@domain-one.com            |
	| "email..email"@domain.com       |
	| _______@domain.com              |
	| EMAIL@DOMAIN.COM                |



Scenario Outline: 1.1.5. Entering different formats of Invalid Email  
	When user fills in text field "Email" with <Invalid Email>
	Then the line under the text field should be highlighted in red
	And inscription "Invalid email format" should appear

	Examples: 
	| Invalid Email                |
	| plainaddress                 |                
	| #@%^%#$@#$@#.com             |
	| Joe Smith <email@domain.com> |
	| email@domain@domain.com      |
	| email@.domain.com            |
	| email..email@domain.com      |

# Email, которые невалидные, но у нас прошли, как валидные:email@-domain.com,  あいうえお@domain.com



@3
@Message

Scenario Outline: 1.1.6. Entering different formats of Valid Message
	When user fills in text field "Message" with <Valid Message>
	Then the line under the text field should be highlighted in red

	Examples: 
	| Valid Message                                           |
	| 1                                                       |
	| 125346574                                               |
	| firstemaillastemailuhlijnbhgvj                          |
	| Lorem ipsum dolor sit amet, consectetur adipiscing elit |
	| =--=--=,./?                                             |
	| liyblnjnlищодщышо                                       |

@4
@ALL

#Сценарии 1.1.7.,1.1.8. и 1.1.9 не занесены в предыдущие сценарии так как тут легче это отделить с целью демонстрации применения техник классов эквивалетности и анализа граничных значений
Scenario Outline: 1.1.7. The number of characters in the Name and Email fields is less than the required minimal length
	When user fills in text field <Field> with "<lessminValid>"
	Then the line under the text field should be highlighted in red
	And  inscription "Invalid <field> format" should appear

	Examples: 
	| Field   | lessminValid | field |
	| "Name"  | "H "         | name  |
	| "Email" | "@e.ru"      | email |
	
Scenario Outline: 1.1.8. The number of characters in the Name and Email fields is equal to minimal allowed(minValid)
	When user fills in text field <Field> with "<minValid>"
	Then the line under the text field should be highlighted in green
	
	Examples: 
	| Field   | minValid |
	| "Name"  | "O O"    |
	| "Email" | "f@e.ru" |
	
	
Scenario Outline: 1.1.9. The number of characters in the Name and Email,Message fields is equal to maximal allowed(maxValid)
	When user fills in text field <Field> with "<maxValid>"
	Then the line under the text field should be highlighted in green

	Examples: 
	| Field     | maxValid                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               |
	| "Name"    | "StopFortnumAndMasonFoieGras Sljnliukalfkaekjlniehwpoienwpuenruiberubre"                                                                                                                                                                                                                                                                                                                                                                                                                                               |
	| "Email"   | "StopFortnumAndMasonFoieGraskSljnliukalfkaekjlniehwpoienwpuenruibe@e.ru"                                                                                                                                                                                                                                                                                                                                                                                                                                               |
	| "Message" | "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum.Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum.idunt ut labore et dolore magna aliqua.Lorem ipsumshtrsrthtrrshsrthhsrthtrsthsrthsrhssrththsrhsrthtrhshtrhg" |
	

Scenario Outline: 1.1.10. The number of characters in the Name and Email,Message fields is more then maximal allowed(maxValid)	
    When user fills in text field <Field> with <moremaxValid>
	Then the line under the text field should be highlighted in red
	And  inscription "The maximum number of characters is <number>" should appear

	Examples: 
	| Field     | moremaxValid                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         | number |
	| "Name"    | "StopFortnumAndMasonFoieGras Sljnliufstrbrtkalfkaekjlniehwpoienwpuenruiberubre"                                                                                                                                                                                                                                                                                                                                                                                                                                                  | 70     |
	| "Email"   | "StopFortnumAndMasonFoieGraskSljnliukalfkaekjlsrbsrbsrbniehwpoienwpuenruibe@e.ru"                                                                                                                                                                                                                                                                                                                                                                                                                                                | 70     |
	| "Message" | "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum.Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum.idunt ut labore et dolore magna aliqua.Lorem ipsumshtrsrthtrrshsrthhsrthtrsthsrthsrhssrththsrhsrthtrhshtrhg dvaebaere" | 500    |
	

# отличная от класса эквивалентности проверка
Scenario Outline: 1.1.11. Validation of copied data in text fields
	When user copies valid <Field> from any document with meaning <Description>
	And user puts this <Description> in <Field> text field
	Then the line under the text field should be highlighted in green

	Examples: 
	| Field     | Description |
	| "Name"    | O O         |
	| "Email"   | f@e.ru      |
	| "Message" | 1213        |
	
	

@5
@Placeholders

Scenario Outline: 1.1.12. Checking the placeholders in  text fields
    Given user sees the plceholder <Placeholder> in first text field 
	When user clicks in <Text field> text field and fill in with ""
	And user clicks on other place
	Then placeholder <Placeholder> should appear back

	Examples: 
	| Placeholder | Text field |
	| Name*       | Name       |
	| Email*      | Email      |
	| Message     | Message    |

Scenario Outline: 1.1.13. Checking the disappearing of placeholders in  text fields
    Given user sees the plceholder <Placeholder> in first text field 
	When user clicks in <Text field> text field and fill in with " "
	And user clicks on other place
	Then placeholder <Placeholder> should disappear

	Examples: 
	| Placeholder | Text field |
	| Name*       | Name       |
	| Email*      | Email      |
	| Message     | Message    |

@6
@AttachCVbutton

Scenario Outline: 1.1.14. Attaching a valid document 
	Given user clicks on "Attach CV" button
	When user attaches a file in <format> format weighing less or equal 10 Mb with the name <name>
    Then attached document <name> under "Attach CV" button  should appeared 

	Examples: 
	| format | name      |
	| PDF    | name.pdf  |
	| DOC    | name.doc  |
	| DOCX   | name.docx |
	| RPF    | name.rpf  |



Scenario Outline: 1.1.15. Attaching invalid document 
    Given user clicks on "Attach CV" button
   	And user attaches a file in <format> format weighing less or equal 10 Mb with the name <name>
    When warning message "Something went wrong Invalid file format. Please try PDF, DOC, DOCX or RTF." and "OK" button should appeared
	And user clicks on "OK" button
	Then file <name> should not attach


	Examples: 
	| format | name     |
	| TXT    | name.txt |
	| GIF    | name.gif |
	| XLS    | name.xls |
	| XML    | name.xml |

Scenario Outline: 1.1.16. Attaching heavy valid document 
	Given user clicks on "Attach CV" button
	And user attaches a file in <format>  weighing more than 10 Mb with the name <name>
    When user sees a warning message "Something went wrong Max file size 10 Mb" and "OK" button
	And user clicks on "OK" button
	Then file <name> should not attach

	Examples: 
	| format | name      |
	| PDF    | name.pdf  |
	| DOC    | name.doc  |
	| DOCX   | name.docx |
	| RPF    | name.rpf  |

@7
@SendCVbutton

Scenario: 1.1.17. Consent to data processing
	When user clicks on checkbox near "I agree to the personal data processing"
	Then chech mark should appear inside the box to indicate an affirmative choice

#здесь не перепбирались все варианты, тут pairwise
Scenario Outline: 1.1.18. Unsuccessful attempts to send CV
    Given user inputs <Name> in Name text field
    And user inputs <Email> in Email text field
    And user inputs <Message> in Message test field
    And user <Attach CV> CV with "Attach CV" button
    And user <Personal data processing> to data processing
    When user clicks on "Send" button
    Then line under <field> and <Other> should highlighted in red
    And following warnings <Warning> should appear under <field> 

    Examples: 
    | Name       | Email            | Message     | Attach CV    | Personnal data processing | field                     | Other                                                | Warning                                                                                    |
    | Kseniia    | email@domain.com | morethan500 | Attaches     | Disagree                  | Name,Message fields       | "Personal data processing" text                      | "Invalid name format" and "The maximum number of characters is 500"                        |
    | Stephan Ol | email@domain.com | 134         | Not attaches | Agree                     | None of text fields       | Attcah CV button                                     |                                                                                            |
    | Stephan Ol | @domain.com      | morethan500 | Attaches     | Agree                     | Email,Message fields      | nothing else                                         | "Invalid email format" and "The maximum number of characters is 500"                       |
    | Kseniia    | @domain.com      | morethan500 | Not attaches | Disagree                  | Name,Email,Message fields | "Personal data processing" text and Attcah CV button | "Invalid name format","Invalid email format" and "The maximum number of characters is 500" |
    | Stephan Ol | @domain.com      | 134         | Attaches     | Disagree                  | Email field               | "Personal data processing" text                      | "Invalid email format"                                                                     |
	
	


Scenario: 1.1.19.Successful attempts to send CV
    Given user inputs "Stephan Ol" in Name text field
    And user inputs "email@domain.com" in Email text field
    And user inputs "134" in Message test field
    And user Attach CV with "Attach CV" button
    And user agree to data processing
    When user clicks on "Send" button
    Then the message that "Your resume has been sent" should appeared
 
 #этот сценарий чтобы показать что поле Message не обязательное
Scenario: 1.1.20.Successful attempts to send CV
    Given user inputs "Stephan Ol" in Name text field
    And user inputs "email@domain.com" in Email text field
    And user inputs "" in Message test field
    And user Attach CV with "Attach CV" button
    And user agree to data processing
    When user clicks on "Send" button
    Then the message that "Your resume has been sent" should appeared

