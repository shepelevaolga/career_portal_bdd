Feature: 1.1 Filters of positions on Main Page
	Checking search result depending on filters, 2 dropdowns: Competency and Technologies

Background:
Given Deafult list of competencies is created:
		| name                         |
		| QA                           |
		| Data Engineering & Analytics |
		| Databases                    |
		| DevOps                       |
And Deafult list of Technologies is created:
		| name        |
		| .NET        |
		| Android     |
		| Angular     |
		| C#          |
		| AWS         |
		| Azure       |
		| Python      |
And Positions are created:
		| title          | competency | technology1 | technology2 | technology3 |
		| Junior QA      | QA         | .NET        | C#          |             |
		| Middle QA      | QA         | .NET        | C#          |             |
		| Data Engineer  | Databases  |             |             |             |
		| Senior DevOps  | DevOps     | AWS         | Azure       | Python      |
And Main page is opened

Scenario: 1.1_01 Search with empty filters
When User clicks Search button
Then New page is opened with empty selection of Competency and Technology dropdowns
And There are all 4 positions in the list result area

Scenario: 1.1_02 Search by Competency filter only - single select - result exists
Given User selected 'DevOps' competency
When User clicks Search button
Then New page is opened with 'DevOps' competency selected in its drowdown
And There is one position 'Senior DevOps' in the result area

Scenario: 1.1_03 Search by Competency filter only - single select - result is empty
Given User selected 'Data Engineering & Analytics' competency
When User clicks Search button
Then New page is opened with 'Data Engineering & Analytics' competency selected in its drowdown
And There are no positions in the result area

Scenario: 1.1_04 Search by Competency filter only - multi select
Given User selected 'QA' and 'DevOps' competencies
When User clicks Search button
Then New page is opened with the same selected items as we selected in Competency drowdown
And There are 3 positions in the result area:
		| title          |
		| Junior QA      |
		| Middle QA      |
		| Senior DevOps  |

Scenario: 1.1_05 Search by Technology filter only - single select - result exists
Given User selected 'Azure' technology
When User clicks Search button
Then New page is opened with 'Azure' item selected in Technologies dropdown
And There is 1 position 'Senior DevOps'in the result area

Scenario: 1.1_06 Search by Technology filter only - single select - result is empty
Given User selected 'Android' technology
When User clicks Search button
Then New page is opened with 'Android' item selected in Technologies dropdown
And There are no positions in the result area

Scenario: 1.1_07 Search by Technology filter only - multi select
Given User selected 'AWS' and 'C#' technologies
When User clicks Search button
Then New page is opened with the same items selected as we selected in Technologies dropdown
And There are 3 positions in the result area:
		| title          |
		| Junior QA      |
		| Middle QA      |
		| Senior DevOps  |

Scenario: 1.1_08 Search by both filters - result exists
Given User selected 'AWS' and 'C#' technologies
And User selected 'QA' competency
When User clicks Search button
Then New page is opened with the same items selected as we selected in Technologies and Competency dropdowns
And There are 2 positions in the result area:
		| title          |
		| Junior QA      |
		| Middle QA      |

Scenario: 1.1_09 Search by both filters - result is empty
Given User selected '.NET' and 'C#' technologies
And User selected 'DevOps' competency
When User clicks Search button
Then New page is opened with the same items selected as we selected in Technologies and Competency dropdowns
And There are no positions in the result area