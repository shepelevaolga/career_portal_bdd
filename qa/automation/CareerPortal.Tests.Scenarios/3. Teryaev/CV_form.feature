Feature: 1.0 CV_form.feature

Background:
Given User opened https://career.quantori.com/ in Google Chrome
And scrolled down to the CV form

Scenario: 1.0_01 User can not send empty form
When User clicks "Send" for empty form
Then All required fields should be highlighted in red
And Messages "This field is required" should appear under fields "Name", "Email"
And Button "Attach CV" should be highlighted in red
And Check-box's description "I agree to the personal data processing" should be highlighted in red

Scenario: 1.0_02 User can send CV form
Given User inputted valid name "Vlad Teryaev" in field "Name"
And User inputted valid email "email@domailn.com" in field "Email"
And User attached CV file with valid format and size "PDF/DOC/DOCX/RTF/Max 10 Mb"
And User clicked on check-box "I agree to the personal data processing"
When User pushes "Send"
Then Message "Thanks for being awesome! We have received your message and will come back to you as soon as we process it" should appear

Scenario: 1.0_03 User inputs invalid length in the field "Name"
When User inputs "Leone Sextus Denys Oswolf Fraudatifilius Tollemache-Tollemache de Orellana Plantagenet Tollemache-Tollemache" in the field "Name"
Then Message "The maximum number of characters is 70" should appear under field "Name"
And Field "Name" should be highlighted in red

Scenario Outline: 1.0_04 User inputs invalid data in field "Name"
When User inputs invalid data <data> in field "Name"
Then Output <output> should be <Invalid name format>
And Field "Name" should be highlighted in red
Examples: 
| data                               | output              |
| numbers (1234)                     | Invalid name format |
| special symbols (&%*)              | Invalid name format |
| one word without whitespace (Vlad) | Invalid name format |
| arabian text                       | Invalid name format |

Scenario Outline: 1.0_05 User inputs invalid data in field "Email"
When User inputs invalid data <data> in field "Email"
Then Output <output> should be <Invalid email format>
And Field "Email" should be highlighted in red
Examples: 
| data                              | output               |
| numbers (1234)                    | Invalid email format |
| two @ (email@domain@domain.com)   | Invalid email format |
| missing @ (email.domain.com)      | Invalid email format |
| multiple dots (email..domain.com) | Invalid email format |

Scenario: 1.0_06 User inputs invalid length in the field "Email"
When User inputs "Leone Sextus Denys Oswolf Fraudatifilius Tollemache-Tollemache de Orellana Plantagenet Tollemache-Tollemache@gmail.com"
Then Message "The maximum number of characters is 70" should appear under field "Email"
And Field "Email" should be highlighted in red

Scenario: 1.0_07 User inputs  the maximum number of characters (70) in the field "Name"
When User inputs "Leone Sextus Denys Oswolf Fraudatifilius Tollemache-Tollemache de Orel" in the field "Name"
Then Field "Name" should be highlighted in green
And Error message does not appear

Scenario: 1.0_08 User inputs  the maximum number of characters (70) in the field "Email"
When User inputs Leone Sextus Denys Oswolf Fraudatifilius Tollemache-Tollemac@gmail.com in the field "Email"
Then Field "Email" should be highlighted in green
And Error message does not appear

Scenario: 1.0_09 User inputs 69 characters in the field "Name"
When User inputs "Leone Sextus Denys Oswolf Fraudatifilius Tollemache-Tollemache de Ore" in the field "Name"
Then Field "Name" should be highlighted in green
And Error message does not appear

Scenario: 1.0_10 User inputs 69 characters in the field "Email"
When User inputs Leone Sextus Denys Oswolf Fraudatifilius Tollemache-Tollema@gmail.com in the field "Email"
Then Field "Email" should be highlighted in green
And Error message does not appear

Scenario: 1.0_11 User inputs "Name" field with minimum symbols
When User inputs "C q" in "Name" field
Then Field "Name" should be highlighted in green
And Error message does not appear

Scenario: 1.0_13 User inputs invalid length data ( 505 symbols) in the field "Message
When User inputs "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Duis aute irure dolor in reprehenderit in voluptate velit e" in the field "Message"
Then Message "The maximum number of characters is 500" should appear under field "Message"
And Field "Message" should be highlighted in red

Scenario: 1.0_14 User inputs 500 symbols in the field "Message"
When User inputs "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Duis aute irure dolor in reprehenderit in voluptate ve" in the field "Message"
Then Field "Message" should be highlighted in green
And Error message does not appear

Scenario: 1.0_15 User inputs 499 symbols in the field "Message"
When User inputs "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Duis aute irure dolor in reprehenderit in voluptate v" in the field "Message"
Then Field "Message" should be highlighted in green
And Error message does not appear

Scenario: 1.0_16 User inputs  extra letter in the domain "com" in the field "Email"
When User inputs "email@domain.comm" in the field "Email"
Then Field "Email" should be highlighted in red
But Field "Email" highlighted in green
And Error message does not appear

Scenario: 1.0_17 User inputs only numbers before domain in "Email" field
When User inputs 111111@domain.com in the field "Email"
Then Field "Email" should be highlighted in green
And Error message does not appear

Scenario Outline: 1.0_19 User attaches valid and invalid CV file with different sizes
When User attaches CV <CV> 
And User pushes "Send"
Then output <output> should be <passed_failed>
Examples:
| CV       | output |
| PDF 1 Kb | passed |
| PDF 4 Mb | passed | 
| PDF 9 Mb | passed |
| PDF 10 Mb| passed |
| PDF 11 Mb| failed |
| DOC      | passed |
| DOCX     | passed |
| RTF      | passed |
| TXT      | failed |
| ZIP      | failed |
| EXE      | failed |
| XLSX     | failed |