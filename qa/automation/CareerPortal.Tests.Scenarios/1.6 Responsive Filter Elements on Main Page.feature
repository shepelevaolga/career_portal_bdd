Feature: 1.6 Responsive Filter Elements on Main Page
	Checking adaprive behavior in different window sizes

Scenario: 1.6_01 Placement of controls and welcome text on background image - extra large width
Given Set width of your browser to 1500 px
When User slowly decreaseing width of browser to 1350 px
Then Dropdowns 'Competency', 'Technologies' and button are large and centered
And Welcome text 'Become a part of Quantori team' is large, written in 2 lines

Scenario: 1.6_02 Placement of controls - large width
Given Set width of your browser to 1210 px
When User slowly decreaseing width of browser to 1150 px
Then Dropdowns 'Competency', 'Technologies' and button are became smaller, its width is decreased, elements are centered

Scenario: 1.6_03 Welcome text and background image - large width
Given Set width of your browser to 1150 px
When User slowly decreaseing width of browser to 1050 px
Then Welcome text is smaller, in the second line only one word 'team'
And Background image is decreased, height is smaller

Scenario: 1.6_04 Welcome text and controls - middle width
Given Set width of your browser to 1050 px
When User slowly decreaseing width of browser to 950 px
Then Welcome text is broken in 2 lines, second lines contains 'Quantori team', text is centered
And Controls (both dropdowns and Search button) became smaller (width and height) and centered

Scenario: 1.6_05 Welcome text and controls - small width
Given Set width of your browser to 800 px
When User slowly decreaseing width of browser to 750 px
Then Welcome text is broken in 3 lines:
		| text          |
		| Become a part |
		| of Quantori   |
		| team          |
And both dropdowns are kept in one line and centered
And Search button moved to the next line and centered

Scenario: 1.6_06 Dropdowns and Search button - extra small width
Given Set width of your browser to 750 px
When User slowly decreaseing width of browser to 650 px
Then Each control (2 dropdowns and Search button) is placed in its own line and centered