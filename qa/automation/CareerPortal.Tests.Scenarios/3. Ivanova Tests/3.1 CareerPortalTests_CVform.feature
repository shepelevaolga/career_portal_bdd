Feature: 3.1 Testing fields of "Send us your CV" form

Background: 
    Given user opened CV form

Scenario: 3.1.1 User pressed the button "Send" without filling any field
    When user pushes the button "Send"
    Then text below field Name should be "This field is required"
    And text below field Email should be "This field is required"
    And button "Attach CV" text should have color #ef413d
    And checkbox label text should have color rgb(239, 65, 61)

Scenario Outline: 3.1.2 User send valid CV form
    When user writes "Ivan Petrov" in the Name field
    And user writes "IvanPetrov@gmail.com" in the Email field
    And user attaches CV file from path "cv_file_valid.pdf"
    And user wtites <message> in the Message field
    And user checks checkbox "I agree to the personal data processing"
    And user presses the button "Send"
    Then CV form shoud be sent
    And dialog should be opened with message "Thanks for being awesome! We have received your message and will come back to you as soon as we process it."

    Examples: 
        |message     |
        |            |
        |Hello world!|
    
Scenario: 3.1.3 User send CV form with invalid Name
    When user writes "1234 Ivan" in the Name field
    And user writes "IvanPetrov@gmail.com" in the Email field
    And user attaches CV file from path "cv_file_valid.pdf"
    And user checks checkbox "I agree to the personal data processing"
    And user presses the button "Send"
    Then text below field Name should be "Invalid email format"
    And CV form shoud not be sent

Scenario: 3.1.4 User send CV form with invalid Email
    When user writes "Kate Ivanova" in the Name field
    And user writes "Ivanova@.com" in the Email field
    And user attaches CV file from path "cv_file_valid.doc"
    And user checks checkbox "I agree to the personal data processing"
    And user presses the button "Send"
    Then text below field Email should be "Invalid email format"
    And CV form shoud not be sent

Scenario: 3.1.5 User send CV form without CV file
    When user writes "Mari Poppins" in the Name field
    And user writes "Mari@gmail.com" in the Email field
    And user checks checkbox "I agree to the personal data processing"
    And user presses the button "Send"
    Then button "Attach CV" text should have color #ef413d
    And CV form shoud not be sent

Scenario: 3.1.6 User send CV form without checks checkbox "I agree to the personal data processing"
    When user writes "Steve Jobs" in the Name field
    And user writes "SteveJobs1@gmail.com" in the Email field
    And user attaches CV file from path "cv_file_valid.pdf"
    And user wtites "Hi, Quantori!!!" in the Message field
    And user presses the button "Send"
    Then checkbox label text should have color rgb(239, 65, 61)
    And CV form shoud not be sent

Scenario Outline: 3.1.7 User filled value in the Name field
    When user writes <name> to the Name field
    Then text below field Name should be <error text>
    @DateSource:longNames.csv
    Examples: 
        |name                   |error text         |
        |a a                    |                   |
        |Ivan Ivanov            |                   |
        |Иван Иванов            |                   |
        |Ivan Ivanov Ivanovich  |                   |
        |Ivan Ivanov Ivanovich. |                   |
        |Ivan-Ivanov Ivanovich  |                   |
        |Ivan Ivanov Ivanovach2 |Invalid name format|
        |Ivanov                 |Invalid name format|
        |<Ivan Ivanov Ivanovach>|Invalid name format|

Scenario Outline: 3.1.8 User filled value in the Email field
    When user writes <email> to the Email field
    Then text below field Email should be <error text>
    @DateSource:longEmails.csv
    Examples: 
        |email             |error text          |
        |Ivanov@mail.ru    |                    |
        |Ivanov@gmail.com  |                    |
        |Ivanov3@g3mail.com|                    |
        |Ivanov            |Invalid email format|
        |Ivanov@           |Invalid email format|
        |Ivanova@mail.     |Invalid email format|
        |@mail.ru          |Invalid email format|
        |@.com             |Invalid email format|
        |Iv<a>nov@gmail.com|Invalid email format|
        |Ivanov@gmail.co3m |Invalid email format|

Scenario Outline: 3.1.9 User filled value in the Message field
    When user writes <message> to the Message field
    Then text below field Message should be <error text>
    @DateSource:longMessages.csv
    Examples: 
        |message     |error text|
        |            |          |
        |a           |          |
        |<>!@#$%^&*()|          |
        |Hello!      |          |
        |Добрый день!|          |

Scenario Outline: 3.1.10 User attached valid CV file
    When user attaches CV file from path <path to file>
    Then text below button "Attach CV" should be <path to file>

    Examples: 
        |path to file          |
        |cv_file_valid.pdf     |
        |cv_file_valid.doc     |
        |cv_file_valid.docx    |
        |cv_file_valid.rtf     |
        |cv_file_valid_10mb.pdf|
    
Scenario Outline: 3.1.11 User attached invalid CV file
    When user attaches CV file from path <path to file>
    Then "Something went wrong" dialog should be opened with message <error text>

    Examples: 
        |path to file              |error text                                            |
        |cv_file_invalid_format.txt|Invalid file format. Please try PDF, DOC, DOCX or RTF.|
        |cv_file_invalid_size.pdf  |Max file size 10 Mb                                   |