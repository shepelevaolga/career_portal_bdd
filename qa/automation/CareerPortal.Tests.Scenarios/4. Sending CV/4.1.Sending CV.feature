Feature: 4.1. Sending CV

@Type:Positive
@Priority:Critical
Scenario Outline: 4.1_01 Correct display of the cv submit form
    Given user wanted to send CV
    When user opens "<name of the page>" the page
    Then user finds the form for sending CV
	And the form includes "Name", "Email", "Message" fields
	And the form includes "Attach CV" and "Send" buttons
	And the form includes checkbox "I agree to the personal data processing"

    Examples: 
		| name of the page                                               |
		| https://career.quantori.com/ru                                 |
		| https://career.quantori.com/ru/positions/cloud-python-engineer |

@Type:Positive
@Priority:Critical
Scenario Outline: 4.1_02 Successful submission with filled "Name", "Email" fields, checkbox and attached CV
    Given user founded the Send CV form on page "<name of the page>"
    And user entered "<Name>", "<Email>", "<Message>", "<Attach CV>", "<Checkbox>" fields with foolowing combination of values:
        | Name               | Email               | Message                    | Attach CV   | Checkbox |
        | Evgeniia T         | tikeeva_es@mail.ru  |                            | cv.pdf 2Mb  | True     |
        | Evgeniia T         | tikeeva_es@mail.ru  | Please consider my resume. | cv.pdf 10Mb | True     |
        | Евгения Т          | tikeeva1998@mail.ru | I will be a good worker.   | cv.doc 2Mb  | True     |
        | Evgeniia T S       | tikeeva_es@mail.ru  | Please consider my resume. | cv.docx 2Mb | True     |
        | Ж'еня-Тикеева, мл. | tikeeva1998@mail.ru | I will be a good worker.   | cv.rtf 2Mb  | True     |
	When user clicks "Send" button
    Then user should see the message that CV was submitted

    Examples: 
		| name of the page                                               |
		| https://career.quantori.com/ru                                 |
		| https://career.quantori.com/ru/positions/cloud-python-engineer |

@Type:Negative
@Priority:Critical
Scenario Outline: 4.1_03 If important fields are empty, no sending occurs, errors are highlighted
    Given user entered "<Name>", "<Email>", "<Attach CV>", "<Checkbox>" fields with foolowing combination of values:
        | Name               | Email               | Attach CV   | Checkbox |
        |                    | tikeeva_es@mail.ru  | cv.pdf 10Mb | True     |
        | Евгения Т          |                     | cv.doc 2Mb  | True     |
        | Evgeniia T S       | tikeeva_es@mail.ru  |             | True     |
        | Ж'еня-Тикеева, мл. | tikeeva1998@mail.ru | cv.rtf 2Mb  |          |
	When user clicks "Send" button
    Then user should see a red border and error text under empty field, no sending occurs

@Type:Negative
@Priority:Critical
Scenario Outline: 4.1_04 If the fields are filled in incorrectly, sending does not occur, errors are highlighted
    Given user enters "<Name>", "<Email>", "<Attach CV>", "<Checkbox>" fields with foolowing combination of values:
        | Name               | Email               | Attach CV   | Checkbox |
        | 123456 8102        | tikeeva_es@mail.ru  | cv.pdf 10Mb | True     |
        | Евгения Т          | евгения@mail.ru     | cv.doc 2Mb  | True     |
        | Evgeniia T S       | tikeeva_es@mail.ru  | cv.csv 12Mb | True     |
        | Ж'еня-Тикеева, мл. | tikeeva1998@mail.ru | cv.rtf 2Mb  | False    |
	When user clicks "Send" button
    Then user should see a red border and error text under empty field, no sending occurs

@Type:Negative
@Priority:Critical
Scenario Outline: 4.1_05 Validation is triggered for invalid "Email"
    Given user filled "Email" field with "<Input>" values:
       | Input           |
       | 123456          |
       | евгения@mail.ru |
       | test@.          |
       | @mail.ru        |
    When user clicks "Send" button
    Then user should see a red border and text "Invalid email format" under "Email" field, no sending occurs

@Type:Negative
@Priority:Major
Scenario Outline: 4.1_06 Validation is triggered for invalid "Name"
    Given user filled "Name" field with "<Input>" values:
       | Input       |
       | 123456      |
       | 123456 8102 |
       | Evgeniia    |
       | Евгения     |
       | Evgeniia %  |
       | Евгения  1  |
    When user clicks "Send" button
    Then user should see a red border and text "Invalid name format" under "Name" field, no sending occurs

@Type:Negative
@Priority:Major
Scenario: 4.1_07 Validation is triggered for a message that is too long
    Given user filled the Send CV form
	When user types 501 or more characters in the "Message" field
    Then user should see a red border and text "The maximum number of characters is 500" under "Message" field, no sending occurs

@Type:Negative
@Priority:Critical
Scenario Outline: 4.1_08 Attach invalid file
	Given user filled the Send CV form
    When user attaches a file with various "<Extension>", "<Size>"
	Then user should see a message "Something went wrong"

	Examples:
        | Extension | Size |
        | .jpeg     | 2Mb  |
        | .csv      | 4Mb  |
        | .docx     | 12Mb |
        | .rtf      | 20Mb |