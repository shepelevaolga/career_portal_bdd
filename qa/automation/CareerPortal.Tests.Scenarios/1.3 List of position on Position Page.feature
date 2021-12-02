Feature: 1.3 List of position on Position Page
	Checking list of positions on Position page

Background:
Given There are no positions

Scenario: 1.3_01 Empty list
Given Opened main page
When User clicks top menu 'Open job positions'
Then On new opened page the list of positions is empty

Scenario: 1.3_02 List of positions is not empty
Given There are 9 positions:
		| title                                       |
		| Cloud Python Engineer                       |
		| Senior Linux Engineer                       |
		| Senior QA Automation (JavaScript) Engineer  |
		| Snowflake Data Warehouse Certified Engineer |
		| Senior Front End (React) Engineer           |
		| Senior .NET (Full Stack) Engineer           |
		| Senior AWS DevOps Engineer                  |
		| Lead Big Data Engineer                      |
		| Middle QA                                   |
And Main page is opened
When User clicks 'Open job positions' link
Then New page is opened and there are all 9 positions
And Each card contains name of position

Scenario: 1.3_03 Openning details of a position
Given There are 2 positions:
		| title                                       |
		| Cloud Python Engineer                       |
		| Senior Linux Engineer                       |
And '/positions' page is opened
When clicks on card with title 'Senior Linux Engineer'
Then New page is opened with details of the position