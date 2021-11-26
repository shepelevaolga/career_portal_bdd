Feature: 2.4.2.3. Toggle on - toggle off features

Background:
    Given user created experiment using "test.gb" file from "for scenarios/2.4.2/2.4.2.3" subdirectory

@tc:6611
@Smoke
@Automated
@BasicAuth
@CloseTabs
Scenario Outline: 2.4.2.3_01 All features should be visible by default in all views of maps
    Given user clicked on "<name of map> map" button
    When user opens Sidebar
    Then all items in the "Features" table should be turned on
    And following features should be displayed on scene:
        | Feature  | Name     |
        | source   | source   |
        | Feature1 | Feature1 |
        | Feature2 | Feature2 |
        | Feature3 | Feature3 |
        | Feature4 | Feature4 |

    Examples:
        | name of map |
        | Linear      |
        | Sequence    |
        | Circular    |
