Background:
Given I open the https://career.quantori.com/ portal in Safari
and see "Send us your CV" section

Scenario Outline: 2.0 Negative CV empty fields Tests
    When I fill "<Name>", "<Email>", "<Attach CV>", "<I agree>" fields with folowing combination of values:
        | Name      | Email     | Attach CV  | I agree...|
        | empty     | empty     | empty      | empty     |
        | empty     | not empty | not empty  | not empty |
        | not empty | empty     | not empty  | not empty |
        | not empty | not empty | empty      | not empty |
        | not empty | not empty | not empty  | empty     |
                               
    And click the Send button 
    Then I see notifications that empty fields are required and highlighted with orange
    But non-empty fields are not highlighted with orange

Scenario Outline: 2.0.1 Negative CV invalid values Tests
    When I fill "<Name>", "<Email>", "<Attach CV>", "<I agree>" fields with foolowing combination of values:
        | Name                          | Email          | Attach CV   | I agree...|
        |2 words latin letters          | valid domain   | .doc <10Mb  | empty     |
        |2 word latin letters           | invalid domain | .rtf =10Mb  | not empty |
        |1 word cyrillic letters        | valid domain   | .docx <10Mb | not empty |
        |2 word cyrillic letters        | valid domain   | .txt        | not empty |
        |2 words latin letters          | valid domain   | .doc >10Mb  | not empty |
        |1 word latin letters           | valid domain   | .pdf <10Mb  | not empty |
        |invalid symbols (1/*%?, etc)   | valid domain   | .pdf <10Mb  | not empty |
        |2 words latin letters >70 symb | valid domain   | .doc <10Mb  | empty     |
        |2 words latin letters =70 symb | valid domain   | .doc <10Mb  | empty     |

    And click the Send button 
    Then I see notifications that one of the field have invalid format and highlighted with orange
    But the rest of fields are not highlighted with orange
       
Scenario Outline: 2.1 Positive CV Tests
    When I fill "<Name>", "<Email>", "<Attach CV>", "<I agree>", "<Message>" fields with foolowing combination of values:
        | Name                         | Email        | Attach CV   | I agree...| Message     |
        |2 word latin letters <70 symb | valid domain | .doc <10Mb  | not empty | 499 symbols |
        |2 word latin letters <70 symb | valid domain | .rtf =10Mb  | not empty | empty       |
        |2 word latin letters <70 symb | valid domain | .docx <10Mb | not empty | 500 symbols |
        |2 word latin letters <70 symb | valid domain | .pdf <10Mb  | not empty | 1 symbol    |

    And click the Send button 
    Then I should see the message that CV was submitted
