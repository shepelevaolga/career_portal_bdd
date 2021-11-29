Feature: A Contact page with actual contact information

Scenario: User can send the email using the link and the email client
	Given user has already installed some email client on computer
	And user opened Contact page
	When user clicks on hyperlinked and highlighted career@quantori.com email address
	Then the user's email client should be displayed in a new window
	And the recipient's address in a just created letter will be shown as career@quantori.com

Scenario: User can send the email using the link and the webmail client
	Given user has already configured some webmail client in web browser
	And user opened Contact page
	When user clicks on hyperlinked and highlighted career@quantori.com email address
	Then the user's webmail client should be displayed in the same tab
	And the recipient's address in a just created letter will be shown as career@quantori.com

Scenario Outline: User can use the information on the Contact page to contact the company
	Given user wanted to contact the company
	When user opens a Contact page
	Then user sees all actual contact information, including <city>, <office address>, <phone number> and <time zone>

	Examples: 
		| city             | office address                     | time zone | phone number       |
		| Cambridge        | 625 Massachusetts ave, MA, 02139   | UTC-05:00 | +1 (781) 771-1978  |
		| Saint Petersburg | 28-2 B. Sampsonievskii pr., 194044 | UTC+03:00 | +7 (812) 627-13-99 |
		| Voronezh         | 4 Kirova Street, 394018            | UTC+03:00 | +7 (473) 203-06-01 |
		| Omsk             | 14 Gagarina street, 644099         | UTC+06:00 |
		| Tbilisi          | 12 Merab Aleksidze, 0193           | UTC+4:00  |

Scenario: User can use the running clocks on the Contact page
	Given user wanted to call the office
	And need to know the exact time in the office
	When user opens a Contact page
	Then user sees the exact right time on the running clocks for every office