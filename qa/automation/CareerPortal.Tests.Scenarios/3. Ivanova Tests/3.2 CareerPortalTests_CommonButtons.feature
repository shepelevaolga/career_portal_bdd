Feature: 3.2 User clicked on common buttons and links

Background: 
	Given user opened "https://career.quantori.com"

Scenario: 3.2.1 User moved to new page after clicking button "Learn more"
	When user clicks on the button "Learn more"
	Then user should be moved to page "https://career.quantori.com/ru/about"

Scenario: 3.2.2 User moved to new page after clicking button "More open job positions"
	When user clicks on the button "More open job positions"
	Then user should be moved to page "https://career.quantori.com/ru/positions"

Scenario: 3.2.3 User moved to new page after clicking link "About"
	When user clicks on the link "About"
	Then user should be moved to page "https://career.quantori.com/ru/about"

Scenario: 3.2.4 User moved to new page after clicking link "Open job positions"
	When user clicks on the link "Open job positions"
	Then user should be moved to page "https://career.quantori.com/ru/positions"

Scenario: 3.2.5 User moved to new page after clicking link "Contact"
	When user clicks on the link "Contact"
	Then user should be moved to page "https://career.quantori.com/ru/contact"