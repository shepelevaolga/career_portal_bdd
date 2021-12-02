Feature: Cookies settings on any career portal page

Background: 'Necessary cookies' is a required option in Cookies Settings box

Scenario Outline: User sees cookies pop-up on any portal page
	Given user previously didn't accept cookies for career portal
	When user opens <name of the page> page
	Then user sees a cookie pop-up at the bottom of the screen

	Examples: 
		| name of the page   |
		| Main               |
		| About              |
		| Open job positions |
		| Contact            |
		| Position           |

Scenario: User can accept cookies using cookie pop-up
	Given user saw a cookie pop-up at the bottom of the screen
	When user clicks on 'Accept and Continue' button
	Then cookie pop-up disappears

Scenario: User can learn more about cookies using cookie pop-up
	Given user saw a cookie pop-up at the bottom of the screen
	When user clicks on 'Learn more' button
	Then the message box with Cookies Settings should be displayed

Scenario: User can accept cookies using cookie pop-up and Cookies Settings box
	Given user saw a cookie pop-up at the bottom of the screen
	And clicked on 'Learn more' button
	And chose the cookies options using checkboxes in Cookies Settings box
	When user clicks on 'Submit Preferences' button
	Then Cookies Setting box disappears
	And cookie pop-up disappears

Scenario: User can not accept cookies using cookie pop-up and Cookies Settings box
	Given user saw a cookie pop-up at the bottom of the screen
	And clicked on 'Learn more' button
	And saw Cookies Settings message box
	When user clicks on any place around Cookies Setting box
	Then Cookies Setting box disappears
	But cookie pop-up still displays on the screen

Scenario Outline: User can configure cookies using Cookies Settings box on any portal page
	Given user previously accepted cookies for career portal
	And clicked on Cookies Settings link in <name of the page> page footer
	And chose the cookies options using checkboxes in Cookies Settings message box
	When user clicks on 'Submit Preferences' button
	Then Cookies Settings message box disappears

	Examples: 
		| name of the page   |
		| Main               |
		| About              |
		| Open job positions |
		| Contact            |
		| Position           |

Scenario: User can open Data Privacy Policy document using cookie pop-up and Cookies Settings box
	Given user saw a cookie pop-up at the bottom of the screen
	And clicked on 'Learn more' button
	And saw Cookies Settings message box
	When user clicks on 'Data Privacy Policy' link
	Then the document with Quantori Privacy Policy should be displayed in a new tab

Scenario Outline: User can open Data Privacy Policy document using Cookies Settings box on any portal page
	Given user previously accepted cookies for career portal
	And clicked on Cookies Settings link in <name of the page> page footer
	And saw Cookies Settings message box
	When user clicks on 'Data Privacy Policy' link
	Then the document with Quantori Privacy Policy should be displayed in a new tab

	Examples: 
		| name of the page   |
		| Main               |
		| About              |
		| Open job positions |
		| Contact            |
		| Position           |

Scenario Outline: User can close the Cookies Settings box without submit
	Given user previously accepted cookies for career portal
	And clicked on Cookies Settings link in <name of the page> page footer
	And saw Cookies Settings message box
	When user clicks on any place around Cookies Setting box
	Then Cookies Setting box disappears

	Examples: 
		| name of the page   |
		| Main               |
		| About              |
		| Open job positions |
		| Contact            |
		| Position           |
