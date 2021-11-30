Feature: 1. Footer links
As a user, I want to have access to contacts and additional information
In order to get acquainted, contact the company

Background: 
 Given user is on a page on URL "https://career.quantori.com/ru"
 And user rewinds to the footer


Scenario: 1.1.7. Mail icon
    When user clicks on the Mail icon
	Then user is redirected to the mail application
	And user sees that a message is automatically created 
	And email is sent to career@quantori.com


Scenario: 1.1.9. Data Cookies Settings link
    When user clicks on the Data Cookies Settings link
	Then user sees Cookie Notification Messages
	And user sees automatically filled checkbox "Necessary cookies"
	And user sees checkbox "Other cookies"
	And user sees "Submit Preferences" button

Scenario Outline: 1.1.8. <Link> link
    When user clicks on the <Link> link
	Then user is redirected on a page on URL <URL>"https://career.quantori.com/static/Quantori_Web_Privacy_Policy.pdf"

	Examples: 
	| Link                      | URL                                                                  |
	| Instagram                 | "https://www.instagram.com/quantori_community/"                      |
	| Facebook                  | "https://www.facebook.com/quantoricom/"                              |
	| hh.ru                     | "https://spb.hh.ru/employer/3343960"                                 |
	| VK                        | "https://vk.com/quantori"                                            |
	| LinkedIn                  | "https://www.linkedin.com/company/quantori"                          |
	| Official Website Quantori | "https://www.quantori.com/"                                          |
	| Data Privacy Policy       | "https://career.quantori.com/static/Quantori_Web_Privacy_Policy.pdf" |
	




