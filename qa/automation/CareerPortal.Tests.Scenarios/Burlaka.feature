# Dear Reviewer, my version of VS2022 does not support text enlightening, so I want to provide you with a link to my Online Specflow files.
# Maybe it makes the reviewing process more comfortable. Link: https://app.specflow.org/gherkin-editor/feature/SFSID3kBlbzWHRUCEWiwxd5VcwEBCFQzxMl5Ggm-DbZCLc9A

Feature: Website Footer Options
Interaction with "career.quantori.com" website footer 
provides a user with Data Privacy Policy information, Cookie settings options and 
additional contact opportunities

# With "text-containing" elements I refer to elements like links and plain text, whereas "logo-containing" elements are different types of
# clickable buttons (which can be identified by their logos)

Scenario Outline: Footer "text-containing" elements should be visible at the bottom of the "career.quantori.com" page
Given user opened "career.quantori.com"  
When user scrolls to the bottom of "career.quantori.com" page
Then following "<text-containing element>" with "<text>" text should be displayed in the footer: 
|text-containing element                                        |text                                                           | 
|link                                                           |Data Privacy Policy                                            | 
|link                                                           |Cookies Settings                                               | 
|copyright text                                                 |© 2021 Quantori. Custom Software Solutions. All rights reserved|

Scenario Outline: Footer "logo-containing" elements should be visible at the bottom of the "career.quantori.com" page
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

Scenario: Footer link "Data Privacy policy" provides access to a readable and downloadable document
Given user opened "career.quantori.com"  
And user scrolled to the bottom of the "career.quantori.com" page
When user clicks a link with "Data Privacy policy" text in the footer
Then a pdf file "Quantori Privacy Policy" should be displayed in the new window
And user should be able to download a "Quantori Privacy Policy" pdf file

Scenario: Footer link "Cookies Settings" opens a pop-up window with cookie settings
Given user opened "career.quantori.com"  
And user scrolled to the bottom of the "career.quantori.com" page
When user clicks a link with "Cookies Settings" text in the footer
Then a pop-up window with the following text should be displayed in the same window:
"""
We use cookies to enhance the functionality of the website. 
Some cookies are necessary for our site to work while others are optional to aid in the user experience
For overall information about how we protect your data please review our Data Privacy Policy.
"""

Scenario: Footer link "Cookies Settings" allows a user to submit selected by default (necessary) cookies preferences
Given user opened "career.quantori.com"  
And user scrolled to the bottom of the "career.quantori.com" page
And user clicked a link with "Cookies Settings" text in the footer
When a pop-up window with selected by default "Necessary cookies" checkbox and "Other cookies" checkbox is displayed
Then user clicks "Submit preferences" button

Scenario: Footer link "Cookies Settings" allows a user to choose and submit other cookies preferences
Given user opened "career.quantori.com"  
And user scrolled to the bottom of the "career.quantori.com" page
And user clicked a link with "Cookies Settings" text in the footer
When a pop-up window with selected by default "Necessary cookies" checkbox and "Other cookies" checkbox is displayed
Then user selects "Other cookies" checkbox 
And user clicks "Submit preferences" button

Scenario: Pop-up window "Cookies Settings" contains a link to "Data Privacy policy" pdf file
Given user opened "career.quantori.com"  
And user scrolled to the bottom of the "career.quantori.com" page
And user clicked a link with "Cookies Settings" text in the footer
When a pop-up window with cookies settings is displayed
Then a link with "Data Privacy policy" text should be shown

Scenario Outline: Footer link buttons redirect a user to the corresponding websites
Given user opened "career.quantori.com" 
And user scrolled to the bottom of the page
When user clicks a link button with a "<logo>" logo in the footer
Then user is redirected to "Quantori page" on the "<full website name>" website

Examples:
|logo                   |full website name     | 
|"Planet icon"          |Quantori.com          | 
|hh                     |hh.ru                 | 
|f                      |facebook.com          | 
|"Camera icon"          |instagram.com         |
|vk                     |vk.com                |
|in                     |linkedin.com          |

Scenario: Footer link button does not redirect a user with Ukrainian IP address to Quantori page on vk.com website
Given user did not change his Ukrainian IP address with VPN services 
And user opened "career.quantori.com"
And user scrolled to the bottom of the page
When user clicks a link button with a "vk" logo in the footer
Then user is not redirected to "Quantori page" on the "vk.com" website
And message "There is no connection with the site" is displayed 

Scenario: Footer scroll-to-top button brings a user back to the top of the "career.quantori.com" page
Given user opened "career.quantori.com"
And user scrolled to the bottom of the page
When user clicks a scroll-to-top button with a "QUANTORI" logo 
Then user returns to the top of the "career.quantori.com" page
And text "Become a part of Quantori team" is displayed

Scenario: Footer mailto button opens a new email window for a user, who signed in to his default email client account
Given user signed in to his default email-client
And user opened "career.quantori.com" 
And user scrolled to the bottom of the page
When user clicks a mailto button with an "Envelope" logo 
Then a pop-up email window with fields "to", "cc", "subject" and "message body" is displayed
And "career@quantori.com" address appears in the "to" field automatically

Scenario: Footer mailto button opens a new email window for a non-signed-in user
Given user did not sign in to his default email client 
And user opened "career.quantori.com" 
And user scrolled to the bottom of the page
When user clicks a mailto button with an "Envelope" logo 
Then a pop-up email window with "Add an email account" is displayed
And user should add his default email client 