Feature: Send_CV

Background:
    Given user visited the site https://career.quantori.com/ru

Scenario Outline: Correct CV submission
    Given user entered a <name>, <email>, <message>, attached SV (PDF less than 10 MB), checked the checkbox
    When user clicks on a button "Send"
    Then CV should be successfully submitted

    Examples:
        | name        | email                    | message     |
        | Egor  Berdin| egor.berdin@quantori.com | Hello_world |



Scenario Outline: Correct CV submission without message
    Given user entered a <name>, <email>, attached SV (PDF less than 10 MB), checked the checkbox
    When user clicks on a button "Send"
    Then CV should be successfully submitted

    Examples:
        | name       | email                    |
        | Egor Berdin| egor.berdin@quantori.com |
 


Scenario Outline: CV submission without Name
    Given user entered an <email>, attached CV (PDF less than 10 MB), checked the checkbox
    When user clicks on a button "Send"
    Then under the field "Name" a warning appears "This field is required"

    Examples:
        | email                    |
        | egor.berdin@quantori.com |



Scenario Outline: CV submission without Email
    Given user entered a <name>, attached CV (PDF less than 10 MB), checked the checkbox
    When user clicks on a button "Send"
    Then under the field "Email" a warning appears "This field is required"

    Examples:
        | name         |
        | Egor  Berdin |



Scenario Outline: CV submission with 501 characters long message
    Given user entered a <name>, <email>, attached CV (PDF less than 10 MB), checked the checkbox
    And writed a message 501 characters long
    When user clicks on a button "Send"
    Then under the field "Message" a warning appears "The maximum number of characters is 500"

    Examples:
        | name         | email                    |
        | Egor  Berdin | egor.berdin@quantori.com |



Scenario Outline: CV submission with 500 characters long message
    Given user entered a <name>, <email>, attached CV (PDF less than 10 MB), checked the checkbox
    And writed a message 500 characters long
    When user clicks on a button "Send"
    Then CV should be successfully submitted

    Examples:
        | name         | email                    |
        | Egor  Berdin | egor.berdin@quantori.com |



Scenario Outline: CV submission without checked the checkbox
    Given user entered a <name>, <email>, <message>, attached CV (PDF less than 10 MB)
    When user clicks on a button "Send"
    Then the message next to the checkbox will turn red

    Examples:
        | name         | email                    | message     |
        | Egor  Berdin | egor.berdin@quantori.com | Hello_world |



Scenario Outline: CV submission without CV
    Given user entered a <name>, <email>, <message>, checked the checkbox
    When user clicks on a button "Send"
    Then the button message "Attach CV" will turn red

    Examples:
        | name         | email                    | message     |
        | Egor  Berdin | egor.berdin@quantori.com | Hello_world |



Scenario Outline: CV submission with CV in different formats
    Given user clicked on the button "Attach CV"
    When user selects a <format> file
    Then <result> 

    Examples:
        | format | result                                          |
        | .txt   | there should be a warning "Invalid file format" |
        | .doc   | the file will be added successfully             |
        | .docx  | the file will be added successfully             |
        | .rtf   | the file will be added successfully             |
        | .pdf   | the file will be added successfully             |
        | .zip   | there should be a warning "Invalid file format" |
        | .rar   | there should be a warning "Invalid file format" |
        | .avi   | there should be a warning "Invalid file format" |
        | .jpg   | there should be a warning "Invalid file format" |
        | .png   | there should be a warning "Invalid file format" |



Scenario Outline: CV submission with CVs of different sizes
    Given user entered a valid name, email, message, checked the checkbox
    When user selects a .pdf <size> Mb file
    Then <result>

    Examples:
        | size | result                                          |
        | 5    | the file will be added successfully             |
        | 9,9  | the file will be added successfully             |
        | 10   | the file will be added successfully             |
        | 10,1 | there should be a warning "Max file size 10 Mb" |



Scenario Outline: CV submission with invalid Name format
    Given user entered a <name>, <email>, <message>, attached CV (PDF less than 10 MB), checked the checkbox
    When user clicks on a button "Send"
    Then under the field "Name" a warning appears "Invalid name format"

    Examples:
        | name | email                    | message     |
        | Egor | egor.berdin@quantori.com | Hello_world |



Scenario Outline: CV submission with invalid Email format
    Given user entered a <name>, <email>, <message>, attached CV (PDF less than 10 MB), checked the checkbox
    When user clicks on a button "Send"
    Then under the field "Email" a warning appears "Invalid email format"

    Examples:
        | name         | email                   | message     |
        | Egor  Berdin | egor.berdinquantori.com | Hello_world |
