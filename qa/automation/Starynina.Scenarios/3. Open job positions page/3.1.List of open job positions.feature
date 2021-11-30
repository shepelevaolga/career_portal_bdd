Feature: 3.1. List of open job positions

Background:
	Given user is on the https://career.quantori.com/ru/positions page
	And there is the list of open job positions

Scenario: 3.1_01 User can choose one of job positions
	When user places the cursor on one of the positions
	Then the selected line is highlighted in blue

Scenario: 3.1_02 User can open one of job positions
	When user clicks on one of the positions "QA Engineer (Life Science projects)"
	Then the page with description of this position is opened https://career.quantori.com/ru/positions/qa-engineer-life-science-project

Scenario: 3.1_03 User can scroll the list of job positions
	When user uses the scroll on the side bar
	Then the page with open job positions is being scrolled down
	And the list of all open job positions is presented