Feature: 1.7 Hot positions - Responsive UI cards
	Checking adaprive behavior in different window sizes

Background:
Given There are 4 hot positions:
		| title                                       |
		| Cloud Python Engineer                       |
		| Senior Linux Engineer                       |
		| Senior QA Automation (JavaScript) Engineer  |
		| Snowflake Data Warehouse Certified Engineer |

Scenario: 1.7_01 Placement of UI cards - extra large width
Given Set width of your browser to 1500 px
When User slowly decreaseing width of browser to 1250 px
Then UI cards are large, placed in 2 columns and centered

Scenario: 1.7_02 Placement of UI cards - large width
Given Set width of your browser to 1250 px
When User slowly decreaseing width of browser to 1050 px
Then width of cards became smaller (middle size), placed in 2 columns and centered

Scenario: 1.7_03 Placement of UI cards - middle width
Given Set width of your browser to 1250 px
When User slowly decreaseing width of browser to 800 px
Then width of cards became bigger (extra large size), 
And each card is placed in its own line

Scenario: 1.7_04 Placement of UI cards - small width
Given Set width of your browser to 800 px
When User slowly decreaseing width of browser to 600 px
Then width of cards became smaller (middle size), 
And each card is placed in its own line