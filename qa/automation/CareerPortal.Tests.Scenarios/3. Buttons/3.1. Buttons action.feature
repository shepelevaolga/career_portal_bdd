Feature: 3.1 Actions
Background:
	Given User opened Career Portal
	And user hovers over a button

Scenario: 3.1_01 Change colour of the 'Search' button
	When cursor is moved to the Search button area
	Then the button's colour changed to white

Scenario: 3.1_02 Change colour of the 'More open job positions' button
	When cursor is moved to the 'More open job positions' button area
	Then the button's colour changed to white

Scenario: 3.1_03 Change colour of the 'Learn more' button
	When cursor is moved to the 'Learn more' button area
	Then the button's colour changed to white

Scenario: 3.1_04 Colour of the 'Attach CV' button
	When cursor is moved to the 'Attach CV' button area
	Then the button's colour didn't change

Scenario: 3.1_05 Change colour of the 'Send' button
	When cursor is moved to the 'Send' button area
	Then the button's colour colour changed to white



Scenario: 3.1_06 Go to page 'Quantori open job positions'
	When user clicked the 'Search' button
	Then page 'Quantori open job positions' is opened

Scenario: 3.1_07 Go to page 'Quantori open job positions'
	When user clicked the 'More open job positions' button
	Then page 'Quantori open job positions' is opened

Scenario: 3.1_08 Go to page 'About Quantori'
	When user clicked the 'Learn more' button
	Then page 'About Quantori' is opened

Scenario: 3.1_09 Choose CV file on the PC
	When user clicked the 'Attach CV' button
	Then File Manager window is opened



Scenario: 3.1_10 Change cursor to pointer
	When cursor is moved to the 'Search' button area
	Then the cursor is changed to pointer

Scenario: 3.1_11 Change cursor to pointer
	When cursor is moved to the 'More open job positions' button area
	Then the cursor is changed to pointer

Scenario: 3.1_12 Change cursor to pointer
	When cursor is moved to the 'Send' button area
	Then the cursor is changed to pointer

Scenario: 3.1_13 Change cursor to pointer
	When cursor is moved to the 'Learn more' button area
	Then the cursor is changed to pointer

Scenario: 3.1_14 Change cursor to pointer
	When cursor is moved to the 'Attach CV' button area
	Then the cursor is changed to pointer