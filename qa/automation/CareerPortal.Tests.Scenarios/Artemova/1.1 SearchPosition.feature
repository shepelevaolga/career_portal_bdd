Feature: 1.2 SearchPosition filter

Background:
  Given user opened https://qa-career.quantori.com/ru/positions

Scenario Outline: 1.2.1 User can filter positions by competency
  When user clicks on 'Competence' dropdown list
  And user selects all interested points
  Then list of positions related to choosen competencies should be shown

  Examples:
  | competency | opened positions                            |
  | databases  | Data Engineer (SQL)                         |
  | databases  | Snowflate Data Warehouse Certified Engineer |

Scenario Outline: 1.2.2 User can filter positions by technologie
  When user clicks on 'Technologies' dropdown list
  And user selects all interested points
  Then list of positions related to choosen technologies should be shown

  Examples:
  | technologie | opened positions     |
  | iOS         | iOS Engineer         |
  | iOS         | Senior iOS Developer |

Scenario Outline: 1.2.3 User can filter positions by competency and technology
  When user clicks on 'Technologies' dropdown list
  And user selects < point > in 'Technologies' dropdown list
  And user clicks on 'Competence' dropdown list
  And user selects < point > in 'Competence' dropdown list
  Then list of positions related both to choosen competencies and technologies should be shown

Scenario Outline: 1.2.4 List of opened positions refreshes after user changes filter parameters
  Given user has selected items in dropdown lists 
  When user deselects points in dropdown list
  Then list of positions related both to choosen competencies and technologies should be shown

Scenario: 1.2.5 Open positions list without filter includes all positions
  When user doesn't choose any interested points in filters
  Then all opened positions should be shown

Scenario Outline: 1.2.6 Click on position card opens a detail information page for position
  Given open position cards are shown 
  When user clicks on position <Card>
  Then <Page> with detailed info about position should be shown

  Examples:
  | Card                           | Page                                                                 |
  | Business Intelligence Engineer | https://qa-career.quantori.com/positions/business-intelligence-engineer |
  | SharePoint Engineer            | https://qa-career.quantori.com/positions/sharepoint-engineer            |
