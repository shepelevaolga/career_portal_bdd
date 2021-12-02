Feature: An About page with information about the Quantori company

Scenario: User can read information about company
	Given user wanted to get information about company
	When user opens an About page
	Then user sees information about Quantori company on the page, including text description and the map with employees locations

Scenario: User can go to official Quantori site using the link
	Given user opened an About page
	And scrolled the page down
	When user clicks on the 'Quantori.com' link
	Then the official Quantori site displays in the same tab

Scenario: User can go to Contact page using the link
	Given user opened an About page
	And scrolled the page down
	When user clicks on the 'Contacts' link
	Then the Contact page of the Quantori career portal displays in the same tab