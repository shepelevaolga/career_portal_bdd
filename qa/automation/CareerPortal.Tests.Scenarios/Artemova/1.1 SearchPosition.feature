Feature: 1.2 CV Form

Background:
  Given user is on page https://career.quantori.com/ru/positions

Scenario Outline: 3.1.1 User can filter positions by competency
  When user clicks on 'Competence' dropdown list
  And user selects all interested points
  Then list of positions related to choosen competencies should be shown

  Examples:
  | competency | opened positions                            |
  | databases  | Data Engineer (SQL)                         |
  | databases  | Snowflate Data Warehouse Certified Engineer |

Scenario Outline: 3.1.2 User can filter positions by technologie
  When user clicks on 'Technologies' dropdown list
  And user selects all interested points
  Then list of positions related to choosen technologies should be shown

  Examples:
  | technologie | opened positions     |
  | iOS         | iOS Engineer         |
  | iOS         | Senior iOS Developer |

Scenario Outline: 3.1.3 User can filter positions by competency and technologie
	When user selects points in 'Technologies' dropdown list
  And user selects points in 'Competence' dropdown list
	Then list of positions related both to choosen competencies and technologies should be shown

Scenario Outline: 3.1.4 User can disable choosen items and the list refreshes
  Given user has selected items in dropdown lists 
  When user deselect points in dropdown list
  Then list of positions related both to choosen competencies and technologies should be shown

Scenario: 3.1.5 Open positions list without filter includes all positions
  When user doesn't choose any interested points in filters
  Then all opened positions should be shown

Scenario: 3.1.6 Click on position card opens a detail information page for position
  Given open position cards are shown 
  When user clicks on position <Card>
  Then <Page> with detailed info about position should be shown

  Examples:
  | Card                           | Page                                                                 |
  | Business Intelligence Engineer | https://career.quantori.com/positions/business-intelligence-engineer |
  | SharePoint Engineer            | https://career.quantori.com/positions/sharepoint-engineer            |
