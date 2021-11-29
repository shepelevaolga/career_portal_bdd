Feature: Navigation bar in header with the same behavior on any career portal page

Scenario Outline: User can open the Main page with logo icon
	Given user opened <name of the page> page
	When user clicks on Quantori logo in the header
	Then the main page should be displayed

	Examples: 
		| name of the page   |
		| Main               |
		| About              |
		| Open job positions |
		| Contact            |
		| Position           |

Scenario Outline: User can open the About page using navigation link
	Given user opened <name of the page> page
	When user clicks on About link in the header
	Then the About page should be displayed

	Examples: 
		| name of the page   |
		| Main               |
		| About              |
		| Open job positions |
		| Contact            |
		| Position           |

Scenario Outline: User can open the Open job positions page using navigation link
	Given user opened <name of the page> page
	When user clicks on Open job positions link in the header
	Then the Open job positions page should be displayed

	Examples: 
		| name of the page   |
		| Main               |
		| About              |
		| Open job positions |
		| Contact            |
		| Position           |

Scenario Outline: User can open the Contact page using navigation link
	Given user opened <name of the page> page
	When user clicks on Contact link in the header
	Then the Contact page should be displayed

	Examples: 
		| name of the page   |
		| Main               |
		| About              |
		| Open job positions |
		| Contact            |
		| Position           |