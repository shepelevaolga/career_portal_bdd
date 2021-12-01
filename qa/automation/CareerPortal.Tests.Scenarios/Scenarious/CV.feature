Background:
Given I open the https://career.quantori.com/ portal and see "Send us your CV" section

Scenario Outline: 2.0 Negative CV empty field
    Given I fill the CV form with any data
    When I leave <Field> empty                       
    Then I see <notification> under <Field> leaved empty that it is required
    But non-empty fields are not notificate they are required

    Examples:
        | Field     | Notification |
        | Name      | notification |
        | Email     | notification |
        | Attach CV | highlighted  |
        | I agree...| highlighted  |


        

Scenario Outline: 2.0.1 Negative CV Name field
    When I fill "Name" field with <Data> 
    Then I see the <Notification> under "Name" field

    Examples:
        | Data                            | Notification                           | 
        |2 words latin letters            | invalid name format                    | 
        |2 word latin letters             | invalid name format                    | 
        |1 word cyrillic letters          | invalid name format                    | 
        |2 word cyrillic letters >70 symb | The maximum number of characters is 70 | 
        |2 words latin letters            | invalid name format                    | 
        |1 word latin letters             | invalid name format                    | 
        |invalid symbols (/*%?, etc)      | invalid name format                    | 
        |2 words latin letters >70 symb   | The maximum number of characters is 70 | 
        |numbers                          | invalid name format                    | 


        

     
Scenario Outline: 2.0.2 Negative CV Email field
    When I fill "Email" field with <Data> 
    Then I see the <Notification>  under "Email" field

    Examples:                              
        | Data                                        | Notification                            | 
        |2 words latin letters,@, existing domain     | invalid email format                    | 
        |1 word latin letters,@, symbols(#,%,&)       | invalid email format                    | 
        |1 word cyrillic letters,@, existing domain   | invalid email format                    | 
        |1 word latin letters,@, non-existing domain  | invalid email format                    | 
        |1 word latin letters, existing domain        | invalid email format                    | 
        |1 word latin letters, @, numbers             | invalid email format                    | 
        |symbols (/*%?, etc), @, existing domain      | invalid email format                    | 
        |1 word latin letters >70 symb                | The maximum number of characters is 70  | 
        |numbers                                      | invalid email format                    | 
                                               

        
       
Scenario Outline: 2.1 Positive CV Tests
    When I fill "Name", "Email", "Attach CV", "Message" fields with "<Name>", "<Email>", "<Attach CV>", "<Message>" values
    And click the Send button
    Then I should see the message that CV was submitted in a new tab

    Examples:
        | Name                         | Email       | Attach CV   | I agree...| Message     |
        |2 word latin letters  70 symb | valid email 70 symb | .doc <10Mb  | not empty | 499 symbols |
        |2 word latin letters  70 symb | valid email 70 symb | .rtf =10Mb  | not empty | 250 symbols |
        |2 word latin letters  69 symb | valid email 69 symb | .docx <10Mb | not empty | 500 symbols |
        |2 word latin letters  69 symb | valid email 69 symb | .pdf <10Mb  | not empty | 1 symbol    |
        |2 word latin letters  30 symb | valid email 30 symb | .doc <10Mb  | not empty | 250 symbols |
        |2 word latin letters  30 symb | valid email 30 symb | .rtf <10Mb  | not empty | 1 symbol    |
        |2 word latin letters   2 symb | valid email 4 symb  | .docx <10Mb | not empty | empty       |
        |2 word latin letters   2 symb | valid email 4 symb  | .pdf <10Mb  | not empty | empty       |
 