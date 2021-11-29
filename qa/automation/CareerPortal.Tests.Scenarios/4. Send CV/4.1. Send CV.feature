Feature: 4.1 send CV
Background:
	Given User opened Career Portal
	

Scenario Outline: 4.1_1 Send CV
    When user fills necessary fields
    |Field Name|Field Value|
    |Name      |<Name>     |
    |EMail     |<Email>    |
    |Message   |<Message>  |
    |Attach CV |<Attach CV>|
    And user set checkbox value for 'I agree to the personal data processing' <CheckBox>
    And user clicked on 'Send' button
    Then CV is <result>

    Examples:
    |Name |Email                  |Message         |Attach CV|CheckBox   |result  |
    |Anna |anna.sivak@quantori.com|I'm a specialist|file.pdf |checked    |sent    |
    |empty|anna.sivak@quantori.com|I'm a specialist|file.pdf |checked    |not sent|
    |Anna |empty                  |I'm a specialist|file.pdf |checked    |not sent|
    |Anna |anna.sivak@quantori.com|empty           |file.pdf |checked    |not sent|
    |Anna |anna.sivak@quantori.com|I'm a specialist|empty    |checked    |not sent|
    |Anna |anna.sivak@quantori.com|I'm a specialist|file.pdf |not checked|not sent|




