Feature: Send_CV

Background:
    Given user visited the site https://career.quantori.com/ru

Scenario Outline: Correct CV submission
    Given user entered a <name>, <email>, <message>, attached SV (PDF less than 10 MB), checked the checkbox
    When user clicks on a button "Send"
    Then CV should be successfully submitted

    Examples:
        | name | email                    | message     |
        | Egor | egor.berdin@quantori.com | Hello_world |



Scenario Outline: Correct CV submission without message
    Given user entered a <name>, <email>, attached SV (PDF less than 10 MB), checked the checkbox
    When user clicks on a button "Send"
    Then CV should be successfully submitted

    Examples:
        | name | email                    |
        | Egor | egor.berdin@quantori.com |
 