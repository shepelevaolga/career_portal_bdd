Background: User went to the "Send us your CV" form at the down of the page 

Feature: Send CV for not open job position  

@Happy_pass
Scenario: Send CV happy pass
Given User entered valid Name
And User entered valid e-mail
And User checked the checkbox
And User attached CV in .pdf file 10 Mb
When User press send button
Then the CV should be received by recruiters

Scenario: Send CV with message happy pass
Given User entered valid Name
And User entered valid e-mail
And User entered 500 symbols in message field
And User checked the checkbox
And User attached CV in .docx file 10 Mb
When User press send button
Then the CV should be received by recruiters

@negative_tests

Scenario: Send CV with too large message 
Given User entered valid Name
And User entered valid e-mail
And User entered 501 symbols in message field
And User checked the checkbox
And User attached CV in .docx file 10 Mb
When User press send button
Then CV should be unsend, mistake message about lenght message no more than 500 symbol

Scenario: Empty forms, correct attached file
Given User tipped no symbols in the name
And User tipped no symbols in the e-mail
And User attached CV in .pdf file
And User checked the checkbox
When User press send button
Then CV should be unsend, all empty field should be highlighted in red

Scenario: No CV attached
Given User entered valid Name
And User entered valid e-mail
And User checked the checkbox
When User press send button
Then CV should be unsend, attached CV button should be highlighted in red

Scenario: Unchecked checkbox 
Given User entered valid Name
And User entered valid e-mail
And User attached CV in .pdf file
When User press send button
Then CV should be unsent, checkbox should be highlighted in red

@specific_tests_for_some_forms
Scenario Outline: format file testing
Given User entered valid Name
And User entered valid e-mail
And User checked the checkbox 
And User attached CV in <Format>
And User attached CV <> Mb
When User press send
Then the CV should be <Result> 

Examples:
  | Format | Mb |  Result |
  | .pdf   | 10 | received |
  | .doc   | 10 | received |
  | .docx  | 10 | received |
  | .rtf   | 10 | received |
  | .doc   | 11 | unsent, attached CV button highlighted|
  | .jpg   | 10 | unsent, attached CV button highlighted|
  | .exe   | 10 | unsent, attached CV button highlighted|
  | .zip   | 10 | unsent, attached CV button highlighted|
  | .fb2   | 10 | unsent, attached CV button highlighted|
  | .txt   | 10 | unsent, attached CV button highlighted|

Scenario Outline: Name form testing
Given User entered valid e-mail 
And User entered <Name> in Name field
And User attached CV .pdf 10 Mb
And User checked the checkbox
When User press send button
Then the CV should be <Result> 

Examples:
  | Name                                                                    |  Result |
  | Funny O'Lyry                                                            |  received |
  | Nickita Petrov                                                          |  received |
  | J J                                                                     | received |
  | J_J J                                                                   | unsent, Name highlighted, invalid format mistake message |
  | len--k@yandex.ru                                                        |  unsent, Name highlighted, invalid format mistake message |
  | Ûûûûûûûûûûûûûûûûûûûûûûûûûûûûûûûûûûûûûûû ûûûûûûûûûûûûûûûûûûûûûûûûûûûûûûû |  unsent, Name highlighted, mistake message about 70 symbol limit   |
  | Ûûûûûûûûûûûûûûûûûûûûûûûûûûûûûûûûûûûûûûû ûûûûûûûûûûûûûûûûûûûûûûûûûûûûû   |  received |
  | J. Jungle                                                               |  received |
  | Petr 173                                                                |  unsent, Name highlighted, invalid format mistake message |
  | Piggle-pig Piggy                                                        |  received |
  | Lasse, Yanson                                                           |  received |
  | John Jonson&Jonson                                                      |  unsent, Name highlighted, invalid format mistake message |

Scenario Outline: e-mail form testing
Given User entered valid Name 
And User entered <e-mail> in e-mail form
And User attached CV .pdf 10 Mb
And User checked the checkbox
When User press send button
Then the CV should be <Result> 

Examples:
| e-mail                                                                      |  Result |
  | len--k@yandex.ru                                                          |  received |
  | len--k@yandex                                                             |  unsent,  e-mail highlighted, message about incorrect format |
  | len--k@@yandex.ru                                                         |  unsent,  e-mail highlighted, message about incorrect format |
  | Petrova-Ivanova-Fockina-Unated-Statete-Gorsheneva-Pichacu-UpI@yandex.ru   |  unsent, e-mail highlighted, mistake message about 70 symbol limit |
  | Petrova-Ivanova-Fockina-Unated-Statete-Gorsheneva-Pichacu-Up@yandex.ru    | received |
  | len--k@yandex.ru.ru                                                       | received  |
  | len- -k@yandex.ru                                                         | unsent, e-mail highlighted, mistake message about incorrect format |
  | 123.yandex.ru                                                             | received |
  | Jonson&Jonson@gmail.com                                                   | received |
  |Jonson'Jonson@gmail.com                                                    | received |
  | "Lasse"@mail.ru                                                           | received |
