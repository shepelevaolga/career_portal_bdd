Feature: 1.2. Send CV.feature

Background:
Given user opened the page with the form to send CV

Scenario Outline: 1.2_01 Different cases entering data in fields "Name", "Email", attach CV, mark checkbox
When user enters name <Name>
And user enters email <Email>
And user <attach_notattach> CV <CV>
And user <mark_notmark> checkbox <checkbox>
And user pushes the "Send" button
Then result <result> should be <error_noerror>
Examples:
|Name   |Email  |CV        |checkbox|result  |
|valid  |valid  |attach    |mark    |no error|
|valid  |valid  |attach    |not mark|error   |
|valid  |valid  |not attach|mark    |error   |
|valid  |invalid|attach    |mark    |error   |
|invalid|valid  |attach    |mark    |error   |
|valid  |invalid|not attach|not mark|error   |
|invalid|valid  |not attach|not mark|error   |
|invalid|invalid|attach    |not mark|error   |
|invalid|invalid|not attach|mark    |error   |
|invalid|invalid|not attach|not mark|error   |
|valid  |valid  |not attach|not mark|error   |
|valid  |invalid|attach    |not mark|error   |
|valid  |invalid|not attach|mark    |error   |
|invalid|invalid|attach    |mark    |error   |
|invalid|valid  |not attach|mark    |error   |
|invalid|valid  |attach    |not mark|error   |

Scenario: 1.2_02 Invalid lendth data in the field "Name"
When user enters "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras tempor rhoncus convallis. Mauris tristique ex et sapien egestas,- non malesuada nisl porttitor" in the "Name" input
And user pushes the "Send" button
Then options inputs should have "The maximum number of characters is 70" validation error
And a "red" check mark indicator appears in the "Name" input

Scenario: 1.2_03 Entering the maximum number of characters (70) in the field "Name"
When user enters "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras tempor r" in the "Name" input
And user pushes the "Send" button
Then options inputs should not have validation error
And a "green" check mark indicator appears in the "Name" input

Scenario: 1.2_04 Entering 69 characters in the field "Name"
When user enters "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras tempor" in the "Name" input
And user pushes the "Send" button
Then options inputs should not have validation error
And a "green" check mark indicator appears in the "Name" input

Scenario Outline: 1.2_05 Entering one or two words in the field "Name" with different amount of letters inside
When user enters words <words> consist of letters <letters> in the "Name" input
And user pushes the "Send" button
Then result <result> should be <error_noerror> in the "Name" input
Examples:
|words|letters|result  |
|1    |1      |error   |
|1    |5      |error   |
|2    |1      |no error|
|2    |5      |no error|

Scenario: 1.2_06 Entering numbers in the field "Name"
When user enters numbers in the "Name" input
And user pushes the "Send" button
Then options inputs should have "Invalid name format" validation error
And a "red" check mark indicator appears in the "Name" input

Scenario: 1.2_07 Entering special symbols in the field "Name"
When user enters special symbols in the "Name" input
And user pushes the "Send" button
Then options inputs should have "Invalid name format" validation error
And a "red" check mark indicator should appear in the "Name" input

Scenario: 1.2_08 Entering whitespace in the field "Name"
When user enters whitespace in the "Name" input
And user pushes the "Send" button
Then options inputs should have "Invalid name format" validation error
And a "red" check mark indicator appears in the "Name" input

Scenario: 1.2_09 Entering whitespace before valid data name and surname in the field "Name"
When user enters whitespace before name and surname in the "Name" input
And user pushes the "Send" button
Then options inputs should not have validation error
And a "green" check mark indicator appears in the "Name" input

Scenario: 1.2_10 Entering name and surname with hyphen between whem in the field "Name"
When user enters name and surname with hyphen between whem in the "Name" input
And user pushes the "Send" button
Then options inputs should not have validation error
And a "green" check mark indicator appears in the "Name" input

Scenario: 1.2_11 Entering name and surname with underscore between whem in the field "Name"
When user enters name and surname with underscore between whem in the "Name" input
And user pushes the "Send" button
Then options inputs should have "Invalid name format" validation error
And a "red" check mark indicator appears in the "Name" input

Scenario Outline: 1.2_12 Entering valid and invalid data in the field "Email"
When user enters data <data> in the "Email" input
And user pushes the "Send" button
Then result <result> should be <error_noerror>
Examples:
|data           |result  |
|valid email    |no error|
|invalid email  |error   |
|numbers        |error   |
|special symbols|error   |
|whitespace     |error   |

Scenario: 1.2_13 Entering whitespace before valid email in the field "Email"
When user enters whitespace before valid email in the "Email" input
And user pushes the "Send" button
Then options inputs should not have validation error
And a "green" check mark indicator appears in the "Email" input

Scenario: 1.2_14 Entering two valid emails in a raw in the field "Email"
When user enters two valid emails in a raw in the "Email" input
And user pushes the "Send" button
Then options inputs should have "Invalid email format" validation error
And a "red" check mark indicator appears in the "Email" input

Scenario: 1.2_15 Invalid lendth data (580 characters) in the field "Message"
When user enters "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris placerat lectus in nisi porttitor consectetur. Integer condimentum venenatis sapien eu cursus. Ut rutrum justo a metus convallis, tristique tristique magna feugiat. Donec tincidunt faucibus massa, vitae hendrerit leo convallis ac. Integer at dui nec odio ultricies eleifend in eget justo. Donec sit amet eleifend lacus, eu commodo orci. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; Proin ante tellus, vestibulum quis lorem ac, tincidunt interdum risus. Ut risus nunc, euism" in the "Message" input
And user pushes the "Send" button
Then options inputs should have "The maximum number of characters is 500" validation error
And a "red" check mark indicator appears in the "Email" input

Scenario: 1.2_16 Input 500 characters in the field "Message"
When user enters "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris placerat lectus in nisi porttitor consectetur. Integer condimentum venenatis sapien eu cursus. Ut rutrum justo a metus convallis, tristique tristique magna feugiat. Donec tincidunt faucibus massa, vitae hendrerit leo convallis ac. Integer at dui nec odio ultricies eleifend in eget justo. Donec sit amet eleifend lacus, eu commodo orci. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; Proin ante" in the "Message" input
And user pushes the "Send" button
Then options inputs should not have validation error
And a "green" check mark indicator appears in the "Email" input

Scenario: 1.2_17 Input 499 characters in the field "Message"
When user enters "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris placerat lectus in nisi porttitor consectetur. Integer condimentum venenatis sapien eu cursus. Ut rutrum justo a metus convallis, tristique tristique magna feugiat. Donec tincidunt faucibus massa, vitae hendrerit leo convallis ac. Integer at dui nec odio ultricies eleifend in eget justo. Donec sit amet eleifend lacus, eu commodo orci. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; Proin antm" in the "Message" input
And user pushes the "Send" button
Then options inputs should not have validation error
And a "green" check mark indicator appears in the "Email" input

Scenario Outline: 1.2_18 Entering different type of data in the field "Message"
When user enters data <data> in the "Message" input
And user pushes the "Send" button
Then result <result> should be <error_noerror>
Examples:
|data           |result  |
|numbers        |no error|
|special symbols|no error|
|whitespace     |no error|

Scenario Outline: 1.2_19 Attach a CV in different formats
When user attaches CV <CV>
And user pushes the "Send" button
Then result <result> should be <error_noerror>
Examples:
|CV  |result  |
|PDF |no error|
|DOC |no error|
|DOCX|no error|
|RTF |no error|
|XLSX|error   |
|XLS |error   |

Scenario Outline: 1.2_20 Attach a CV in different sizes
When user attaches CV <CV>
And user pushes the "Send" button
Then result <result> should be <error_noerror>
Examples:
|CV     |result  |
|1000 Mb|error   |
|11 Mb  |error   |
|10 Mb  |no error|
|9 Mb   |no error|
|1 Kb   |no error|
|1 bytes|no error|

Scenario: 1.2_21 The checkbox with personal data processing agreement is marked
When user markes checkbox
And user pushes the "Send" button
Then text "I agree to the personal data processing" should change from "black" to "green"

Scenario: 1.2_22 The checkbox with personal data processing agreement is not marked
When user not marks the checkbox
And user pushes the "Send" button
Then text "I agree to the personal data processing" should change from "black" to "red"


