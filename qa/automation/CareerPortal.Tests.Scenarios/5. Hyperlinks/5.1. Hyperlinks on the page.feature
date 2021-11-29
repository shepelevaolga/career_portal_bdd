Feature: 5.1 hyperlinks on the page
Background:
	Given User opened Career Portal
	And user hovers over a hyperlink


Scenario: 5.1_01 Change cursor to pointer
	When cursor is moved to the "Quantori" hyperlink area
	Then the cursor is changed to pointer

Scenario: 5.1_02 Change cursor to pointer
	When cursor is moved to the "About" hyperlink area
	Then the cursor is changed to pointer

Scenario: 5.1_03 Change cursor to pointer
	When cursor is moved to the "Open job positions" hyperlink area
	Then the cursor is changed to pointer

Scenario: 5.1_04 Change cursor to pointer
	When cursor is moved to the "Contact" hyperlink area
	Then the cursor is changed to pointer

Scenario: 5.1_05 Change cursor to pointer
	When cursor is moved to the "Data Privacy Policy" hyperlink area
	Then the cursor is changed to pointer

Scenario: 5.1_06 Change cursor to pointer
	When cursor is moved to the "Cookies Settings" hyperlink area
	Then the cursor is changed to pointer



Scenario: 5.1_07 Go to page "About Quantori"
	When user clicked the "About" hyperlink
	Then page "About Quantori" is opened

Scenario: 5.1_08 Go to page "Quantori open job positions"
	When user clicked the "Open job positions" hyperlink
	Then page "Quantori open job positions" is opened

Scenario: 5.1_09 Go to page "Contact Us"
	When user clicked the "Contact" hyperlink
	Then page "Contact Us" is opened

Scenario: 5.1_10 Open document "Quantori Privacy Policy"
	When user clicked the "Data Privacy Policy" hyperlink
	Then document "Quantori Privacy Policy" is opened
	
Scenario: 5.1_11 Alert window about cuckies
	When user clicked the "Cookies Settings" hyperlink
	Then Alert window about cuckies is opened