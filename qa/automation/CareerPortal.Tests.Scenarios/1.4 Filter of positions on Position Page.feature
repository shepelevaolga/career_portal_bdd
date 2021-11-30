Feature: 1.4 Filter of positions on Position Page
	Checking filter logic of positions on Position page

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
And '/positions' page is opened

Scenario: 1.4_01 Search by Competency filter only - result exists
When User selects 'DevOps' competency
Then list of positions immediately is being updated
And There is one position 'Senior DevOps' in the result area

Scenario: 1.4_02 Search by Competency filter only - result is empty
When User selects 'Data Engineering & Analytics' competency
Then list of positions immediately is being updated
And There are no positions in the result area

Scenario: 1.4_03 Search by Technology filter only - result exists
When User selects 'Azure' technology
Then list of positions immediately is being updated
And There is 1 position 'Senior DevOps'in the result area

Scenario: 1.4_04 Filter state is restored after returning from details page
Given Competencies 'DevOps' and 'QA' are selected
And Technologies '.NET', 'AWS' and 'Angular' are selected
And User clicked on card 'Middle QA'
When User clicks 'Back to open job positions' button at the bottom of the page
Then Page with positions is opened
And Competency dropdown contains sleected items: 'DevOps' and 'QA'
And Technologies dropdown contains sleected items: '.NET', 'AWS' and 'Angular'
And The list of positions shows 3 positions:
		| title          |
		| Junior QA      |
		| Middle QA      |
		| Senior DevOps  |
