Feature: Bar with useful links in footer with the same behavior on any career portal page

Scenario Outline: User can open the Main page with logo icon
	Given user opened <name of the page> page
	When user clicks on Quantori logo in the footer
	Then the main page should be displayed

	Examples: 
		| name of the page   |
		| Main               |
		| About              |
		| Open job positions |
		| Contact            |
		| Position           |

Scenario Outline: User can open the Data Privacy Policy document using the link
	Given user opened <name of the page> page
	When user clicks on Data Privacy Policy link in the footer
	Then the document with Quantori Privacy Policy should be displayed in a new tab

	Examples: 
		| name of the page   |
		| Main               |
		| About              |
		| Open job positions |
		| Contact            |
		| Position           |

Scenario Outline: User can open the Cookies Settings box using the link
	Given user opened <name of the page> page
	When user clicks on Cookies Settings link in the footer
	Then the message box with Cookies Settings should be displayed

	Examples: 
		| name of the page   |
		| Main               |
		| About              |
		| Open job positions |
		| Contact            |
		| Position           |

Scenario Outline: User can open the contact page using the hyperlinked icon
	Given user opened <name of the page> page
	When user clicks on '<icon name>' icon in the footer
	Then <contact page> should be displayed in a new tab

	Examples: 
		| name of the page   |
		| Main               |
		| About              |
		| Open job positions |
		| Contact            |
		| Position           |

	Examples: 
		| contact page                              | icon name |
		| https://www.quantori.com/                 | www       |
		| https://hh.ru/employer/3343960            | hh        |
		| https://www.facebook.com/quantoricom/     | fb        |
		| https://instagram.com/quantori_community  | instgm    |
		| https://vk.com/quantori                   | vk        |
		| https://www.linkedin.com/company/quantori | in        |

Scenario Outline: User can send the email using the hyperlinked icon and email client
	Given user has already installed some mail client
	And opened <name of the page> page
	When user clicks on "mail" icon in the footer
	Then the user's mail client should be displayed in a new window
	And the recipient's address in a just created letter will be shown as career@quantori.com

	Examples: 
		| name of the page   |
		| Main               |
		| About              |
		| Open job positions |
		| Contact            |
		| Position           |

Scenario Outline: User can send the email using the hyperlinked icon and webmail client
	Given user has already configured some webmail client in web browser
	And opened <name of the page> page
	When user clicks on "mail" icon in the footer
	Then the user's webmail client should be displayed in the same tab
	And the recipient's address in a just created letter will be shown as career@quantori.com

	Examples: 
		| name of the page   |
		| Main               |
		| About              |
		| Open job positions |
		| Contact            |
		| Position           |
