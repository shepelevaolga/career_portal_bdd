# Dear Reviewer, my version of VS2022 does not support text enlightening, so I want to provide you with a link to my Online Specflow files.
# Maybe it makes the reviewing process more comfortable. Link: https://app.specflow.org/gherkin-editor/feature/SFSID3kBlbzWHRUCEWiwxd5VcwEBCFQzxMl5Ggm-DbZCLc9A

Feature:1.2.3 Website Footer Options
Interaction with "career.quantori.com" website footer 
provides a user with Data Privacy Policy information, Cookie settings options and 
additional contact opportunities

# With "text-containing" elements I refer to elements like links and plain text, whereas "logo-containing" elements are different types of
# clickable buttons (which can be identified by their logos)

Scenario: 1.2.3_01 Footer should contain links for "Data Privacy" / "Policy Cookies Settings" and Copyright trademark 
Given user opened "career.quantori.com"  
When user scrolls to the bottom of "career.quantori.com" page
Then the following elements should be visible in Footer:
|Element| Type|
|Data privacy| link|
|Cookies Settings|Link|
|Copyright © 2021 Quantori. Custom Software Solutions. All rights reserved.| Text|
|text-containing element                                        |text                                                           | 
|link                                                           |Data Privacy Policy                                            | 
|link                                                           |Cookies Settings                                               | 
|copyright text                                                 |© 2021 Quantori. Custom Software Solutions. All rights reserved|

Scenario Outline:1.2.3_02 Footer "logo-containing" elements should be visible at the bottom of the "career.quantori.com" page
Given user opened "career.quantori.com"  
When user scrolls to the bottom of "career.quantori.com" page
Then following "<logo-containing element>" with "<logo>" logo should be displayed in the footer:
|logo-containing element|logo                  | 
|link button            |"Planet"              | 
|link button            |hh                    | 
|link button            |f                     | 
|link button            |"Camera"              |
|link button            |vk                    |
|link button            |in                    |
|scroll-to-top button   |Quantori              |
|mailto button          |"Envelope"            | 

Scenario:1.2.3_03 Footer link "Data Privacy policy" provides access to a readable and downloadable document
Given user opened "career.quantori.com"  
And user scrolled to the bottom of the "career.quantori.com" page
When user clicks a link with "Data Privacy policy" text in the footer
Then a pdf file "Quantori Privacy Policy" should be displayed in the new window
And user should be able to download a "Quantori Privacy Policy" pdf file

Scenario:1.2.3_04 Footer link "Cookies Settings" opens a pop-up window with cookie settings
Given user opened "career.quantori.com"  
And user scrolled to the bottom of the "career.quantori.com" page
When user clicks a link with "Cookies Settings" text in the footer
Then a pop-up window with the following text should be displayed in the same window:
"""
We use cookies to enhance the functionality of the website. 
Some cookies are necessary for our site to work while others are optional to aid in the user experience
For overall information about how we protect your data please review our Data Privacy Policy.
"""

Scenario:1.2.3_05 Footer link "Cookies Settings" allows a user to submit selected by default (necessary) cookies preferences
Given user opened "career.quantori.com"  
And user scrolled to the bottom of the "career.quantori.com" page
And user clicked a link with "Cookies Settings" text in the footer
When a pop-up window with selected by default "Necessary cookies" checkbox and "Other cookies" checkbox is displayed
Then user should click "Submit preferences" button

Scenario:1.2.3_06 Footer link "Cookies Settings" allows a user to choose and submit other cookies preferences
Given user opened "career.quantori.com"  
And user scrolled to the bottom of the "career.quantori.com" page
And user clicked a link with "Cookies Settings" text in the footer
When a pop-up window with selected by default "Necessary cookies" checkbox and "Other cookies" checkbox is displayed
Then user should select "Other cookies" checkbox 
And user should click "Submit preferences" button

Scenario:1.2.3_07 Pop-up window "Cookies Settings" contains a link to "Data Privacy policy" pdf file
Given user opened "career.quantori.com"  
And user scrolled to the bottom of the "career.quantori.com" page
And user clicked a link with "Cookies Settings" text in the footer
When a pop-up window with cookies settings is displayed
Then a link with "Data Privacy policy" text should be displayed

Scenario Outline:1.2.3_08 Footer link buttons redirect a user to the corresponding websites
Given user opened "career.quantori.com" 
And user scrolled to the bottom of the page
When user clicks a link button with a "<logo>" logo in the footer
Then user should be redirected to "Quantori page" on the "<full website name>" website

Examples:
|logo                   |full website name     | 
|"Planet icon"          |Quantori.com          | 
|hh                     |hh.ru                 | 
|f                      |facebook.com          | 
|"Camera icon"          |instagram.com         |
|vk                     |vk.com                |
|in                     |linkedin.com          |

Scenario:1.2.3_09 Footer link button does not redirect a user with Ukrainian IP address to Quantori page on vk.com website
Given user did not change his Ukrainian IP address with VPN services 
And user opened "career.quantori.com"
And user scrolled to the bottom of the page
When user clicks a link button with a "vk" logo in the footer
Then user is not redirected to "Quantori page" on the "vk.com" website
And message "There is no connection with the site" should be displayed 

Scenario:1.2.3_10 Footer scroll-to-top button brings a user back to the top of the "career.quantori.com" page
Given user opened "career.quantori.com"
And user scrolled to the bottom of the page
When user clicks a scroll-to-top button with a "QUANTORI" logo 
Then user returns to the top of the "career.quantori.com" page
And text "Become a part of Quantori team" should be displayed

Scenario:1.2.3_11 Footer mailto button opens a new email window for a user, who signed in to his default email client account
Given user signed in to his default email-client
And user opened "career.quantori.com" 
And user scrolled to the bottom of the page
When user clicks a mailto button with an "Envelope" logo 
Then a pop-up email window with fields "to", "cc", "subject" and "message body" is displayed
And "career@quantori.com" address should appear in the "to" field automatically

Scenario:1.2.3_12 Footer mailto button opens a new email window for a non-signed-in user
Given user did not sign in to his default email client 
And user opened "career.quantori.com" 
And user scrolled to the bottom of the page
When user clicks a mailto button with an "Envelope" logo 
Then a pop-up email window with "Add an email account" is displayed
And user should add his default email client 