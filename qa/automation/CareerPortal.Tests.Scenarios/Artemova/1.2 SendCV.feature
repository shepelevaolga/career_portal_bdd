Feature: 1.2 Send CV Form

Background: 
  Given user is on the <page> with position description
  And the 'Send CV' form is available
  And the 'Send CV' form doesn't contain any data
	
Example:
  | page                                                                  |
  | https://career.quantori.com/positions/senior-qa-automation-c-engineer |

Scenario Outline: 1.2.1 User enters all valid data
  When user enters valid <Name> into the 'Name' field
  And user enters valid <Email> into the 'Email' field
  And user clicks 'Attach CV' button and loads a valid <File>
  And user selects the checkbox 'I agree to the personal data processing'
  And user presses 'Send' button
  Then success message should be shown
  And CV entered data should be sent to server

  Examples: 
    | Name            | Email                       | File     |
    | Best Employee   | test@quantori.com           | PDF, 5Mb |
    |   Spaces Before |   spacesbefore@quantori.com | PDF, 5Mb |

Scenario Outline: 1.2.2 User leaves 'Name' field empty
  When user dont enter data into the 'Name' field
  And moves cursor from the field
  Then field should turn red
  And error message 'This field is required' should be shown

Scenario Outline: 1.2.3 User enters invalid data for 'Name' field
  When user enters invalid <Name> into the 'Name' field
  And moves cursor from the field
  Then field should turn red
  And error message 'Invalid name format' should be shown

  Examples:
    | Name          | comment                      |
    | Не английский | not English                  |
    | 404           | numbers                      |
    | More than two | more than two words          |
    | Jane:         | special symbols (,/*-+?^:%;) |
    | <spaces>      | only spaces                  |

Scenario Outline: 1.2.4 User enters too long data for 'Name' field
  When user enters too long <Name> into the 'Name' field
  And moves cursor from the field
  Then field should turn red
  And error message 'The maximum number of characters is 70' should be shown

Examples:
  	| Name          | comment                          |
  	| too lo(...)ng | over max 70 chars                |

Scenario Outline: 1.2.5 User leaves 'Email' field empty
  When user dont enter data into the 'Email' field
  And moves cursor from the field
  Then field should turn red
  And error message 'This field is required' should be shown

Scenario Outline: 1.2.6 User enters invalid data for 'Email' field
  When user enters invalid <Email> into the 'Email' field
  And moves cursor from the field
  Then field should turn red
  And error message 'Invalid Email format' should be shown

Examples:
  	| Email                  | comment                        |
  	| Неанглийский@gmail.com | not English                    |
  	| Mo re@gmail.com        | spaces                         |
  	| f,g@gmail.com          | special symbols (,/*"'-+?^:%;) |
  	| fg@gmail               | without domain                 |
  	| <spaces>               | only spaces                    |

Scenario Outline: 1.2.7 User enters too long data for 'Email' field
  When user enters too long <Email> into the 'Email' field
  And moves cursor from the field
  Then field should turn red
  And error message 'The maximum number of characters is 70' should be shown

  Examples:
  	| Email                   | comment           |
  	| toolo(...)ng@gmail.com  | over max 70 chars |

Scenario Outline: 1.2.8 User enters valid data for 'Message' field
  When user enter valid <Message> in 'Message' field
  And clicks 'Send' button
  Then green tick should be shown in the upper right corner of the field

  Examples:
    | Message                  | comments                                                           |
    | 1                        | 1 character                                                        |
    | In software ... project. | 500 chars, including numbers and special symbols (,.<>"'/*-+?^:%;) |

Scenario Outline: 1.2.9 User enters valid data for 'Message' field
  When user enter too long text including 501 characters in 'Message' field
  And clicks on 'Send' button
  Then field should turn red
  And the message 'The maximum number of characters is 500' should be shown
 
Scenario Outline: 1.2.10 User attaches valid CV file
  When user clicks 'Attach CV' button
  And user chooses a file in file with valid <Format>, <Size>
  Then the name of loaded file should be shown under the 'Attach CV' button
	
  Examples:
		| Format | Size   |
		| PDF    | 1 byte |
		| DOC    | 1 Kb   |
		| DOCX   | 1 Mb   |
		| RTF    | 10 Mb  |

Scenario Outline: 1.2.11 User attaches invalid CV file
  When user clicks 'Attach CV' button
  And user chooses a file in file with invalid <Format>, <Size>
  Then the error <Message> should be shown 

  Examples:
  	| Format | Size    | Message                                                  |
  	| PDF    | 10.1 Mb | 'Max file size 10 Mb'                                    |
  	| PNG    | 1 Mb    | 'Invalid file format. Please try PDF, DOC, DOCX or RTF.' |
  	| PPT    | 5 Mb    | 'Invalid file format. Please try PDF, DOC, DOCX or RTF.' |

Scenario: 1.2.12 User activates agreement checkbox
  Given the checkbox was inactive
  When user clicks on checkbox 'I agree to the personal data processing'
  Then text should turn green

Scenario: 1.2.13 User disactivates agreement checkbox
  Given the checkbox was active (marked)
  When user clicks on checkbox 'I agree to the personal data processing'
  Then text should turn red

Scenario: 1.2.14 User doesn't activate agreement checkbox 
  Given the checkbox was untouched
  When clicks on 'Send' button
  Then text 'I agree to the personal data processing' should turn red
