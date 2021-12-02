Feature: 1.2 Hot Positions
	Checking items in the Hot Positions area

Background:
Given There are no hot positions

Scenario: 1.2_01 Empty hot positions
Given Opened main page
When User scrolls to area after search button
Then Hot position are is now shown, right after search area user sees About Quantori area

Scenario: 1.2_02 There is only 1 hot position and 2 not hot positions
Given Created 1 hot position 'Senior QA'
And Created 2 not hot positions `Junior QA` and 'Junior Engineer'
When User opens main page
Then User sees hot positions and there is 1 item 'Senior QA'

Scenario: 1.2_03 There are more than 8 hot positions
Given Created positions:
		| title                                       | is hot |
		| Cloud Python Engineer                       | true   |
		| Senior Linux Engineer                       | true   |
		| Senior QA Automation (JavaScript) Engineer  | true   |
		| Snowflake Data Warehouse Certified Engineer | true   |
		| Senior Front End (React) Engineer           | true   |
		| Senior .NET (Full Stack) Engineer           | true   |
		| Senior AWS DevOps Engineer                  | true   |
		| Lead Big Data Engineer                      | true   |
		| Middle QA                                   | false  |
When User opens main page
Then In the area after search button user sees only 8 hot positions and button 'More open job positions'

Scenario: 1.2_04 Check 'More open job positions' button
Given Created 8 hot positions and 2 not hot
And User opened main page
When User clicks 'More open job positions' button
Then new page is opened with list of all 10 positions

Scenario: 1.2_05 Openning a position
Given Created 2 hot and 1 not hot positions:
		| title                                       | is hot |
		| Cloud Python Engineer                       | true   |
		| Senior Linux Engineer                       | true   |
		| Senior QA Automation (JavaScript) Engineer  | false  |
And User opened main page
When User clicks on card with name 'Cloud Python Engineer'
Then new page is opened with details about position 'Cloud Python Engineer'