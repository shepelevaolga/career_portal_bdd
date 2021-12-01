Background:
Given I open the https://career.quantori.com/ portal

Scenario 1.0: Cookie Test
When I click on "Accept and Continue" button in pop-up cookie window 
And click to the browser Settings/Privacy and Security/Cookies and other site data/See all cookies
Then I should see the new cookie file from portal was added

Scenario 1.0.1: Cookie Test
When I click on "Learn more" button in pop-up cookie window 
Then I should see the pop-up window about Cookies and Data Privacy Policy

Scenario 1.1: "Search" button
When I click on "Search" button
Then I should see open job positions for default Competence and Technology in a new tab

Scenario 1.2: Several items search 
When I set several Competencies and Technologies (>1)
And click "Search" button
Then I should see open job positions for chosen Competencies and Technologies in a new tab

Scenario 1.3: "Quantori Hot Open Job Positions" section Test
When I click on one of the hot open positions 
Then I should see the chosen position description page in a new tab

Scenario 1.4: "More open job positions" Test
When I click on the "More open job positions" button
Then I should see the list of all open positions in a new tab

Scenario 1.5: "Learn More" button Test
When I click on "Learn more" button in the "About Quantori" section
Then I should see info page About Quantori in a new tab

Scenario 1.6.0: Quantori Menu "About" button
When I click on the About button in the Menu
Then I should see info page About Quantori in a new tab

Scenario 1.6.1: Quantori Menu "Open jobs positions" button
When I click on the Open jobs positions button in the Menu
Then I should see the list of all open positions in a new tab

Scenario 1.6.2: Quantori Menu "Contact" button
When I click on the Contact button in the Menu
Then I should see the Contact Us page with offer to upload CV in a new tab

Scenario Outline 1.7: Footer links icons
	When I click on "<icon>" icon in the footer area
	
		|  link                                     | icon      | Page       |
		| https://www.quantori.com/                 | www       | Main page  |
		| career@quantori.com                       | mail      | email      |
		| https://hh.ru/employer/3343960            | hh        | Hh         |
		| https://www.facebook.com/quantoricom/     | fb        | Facebook   |
		| https://instagram.com/quantori_community  | inst      | Instagram  |
		| https://vk.com/quantori                   | vk        | Vkontakte  |
		| https://www.linkedin.com/company/quantori | in        | Linkedin   |
	Then I should be directed at corresponding <link> in a new tab

		
	


