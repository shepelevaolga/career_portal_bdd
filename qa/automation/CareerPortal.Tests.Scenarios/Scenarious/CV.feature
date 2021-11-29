Background:
Given I open the https://career.quantori.com/ portal 
and see "Send us your CV" section

Scenario Outline: 2.0 Negative CV Send button test with empty fields
    When I fill "<Name>", "<Email>", "<Attach CV>", "<I agree>" fields with folowing combination of values:
        | Name      | Email     | Attach CV  | I agree...|
        | empty     | empty     | empty      | empty     |
        | empty     | not empty | not empty  | not empty |
        | not empty | empty     | not empty  | not empty |
        | not empty | not empty | empty      | not empty |
        | not empty | not empty | not empty  | empty     |
                               
    And click the Send button 
    Then I see notifications that fields leaved empty are required and highlighted with orange
    But non-empty fields are not notificate they are required



Scenario Outline: 2.0.1 Negative CV invalid values highlight Tests
    When I fill "<Name>", "<Email>", "<Attach CV>", "<I agree>" fields with foolowing combination of values:
        | Name                          | Email          | Attach CV   | I agree...|
        |2 words latin letters          | valid domain   | .doc <10Mb  | empty     |
        |2 word latin letters           | invalid domain | .rtf =10Mb  | not empty |
        |1 word cyrillic letters        | valid domain   | .docx <10Mb | not empty |
        |2 word cyrillic letters        | valid domain   | .txt        | not empty |
        |2 words latin letters          | valid domain   | .doc >10Mb  | not empty |
        |1 word latin letters           | valid domain   | .pdf <10Mb  | not empty |
        |invalid symbols (1/*%?, etc)   | valid domain   | .pdf <10Mb  | not empty |
        |2 words latin letters >70 symb | valid domain   | .doc <10Mb  | not empty |
        

    Then I see what one field have invalid format by its highlighting with orange
    But the rest of fields are not highlighted with orange



Scenario Outline: 2.0.2 Negative CV invalid Name Tests
    When I fill "Name" field with "<Input>" values
      
       | Input                         | Result               |
       |2 words latin letters          | Invalid name format  |
       |2 word latin letters           | Invalid name format  |
       |1 word cyrillic letters        | Invalid name format  |
       |2 word cyrillic letters        | Invalid name format  |
       |2 words latin letters          | Invalid name format  |
       |1 word latin letters           | Invalid name format  |
       |invalid symbols (/*%?, etc)    | Invalid name format  |
       |invalid symbols (numbers)      | Invalid name format  |
       |2 words latin letters >70 symb | Invalid name format  |
       |2 words hidden characters      | Invalid name format  |

    Then I should see notification with <Result> text under "Name" field 



Scenario Outline: 2.0.3 Negative CV invalid Email Tests
    When I fill "Email" field with "<Input>" values
      
       | Input                         | Result                |
       |2 emails                       | Invalid email format  |
       |not existing email             | Invalid email format  |
       |not existing domain            | Invalid email format  |
       |hidden characters              | Invalid email format  |
      
    Then I should see notification with <Result> text under "Email" field 
                                                    

        
       
Scenario Outline: 2.1 Positive CV Tests
    When I fill "<Name>", "<Email>", "<Attach CV>", "<I agree>", "<Message>" fields with foolowing combination of values:
        | Name                         | Email        | Attach CV   | I agree...| Message     |
        |2 word latin letters  70 symb | valid domain | .doc <10Mb  | not empty | 499 symbols |
        |2 word latin letters  70 symb | valid domain | .rtf =10Mb  | not empty | 250 symbols |
        |2 word latin letters  69 symb | valid domain | .docx <10Mb | not empty | 500 symbols |
        |2 word latin letters  69 symb | valid domain | .pdf <10Mb  | not empty | 1 symbol    |
        |2 word latin letters  30 symb | valid domain | .doc <10Mb  | not empty | 250 symbols |
        |2 word latin letters  30 symb | valid domain | .rtf <10Mb  | not empty | 1 symbol    |
        |2 word latin letters   2 symb | valid domain | .docx <10Mb | not empty | empty       |
        |2 word latin letters   2 symb | valid domain | .pdf <10Mb  | not empty | empty       |
        
    And click the Send button 
    Then I should see the message that CV was submitted
