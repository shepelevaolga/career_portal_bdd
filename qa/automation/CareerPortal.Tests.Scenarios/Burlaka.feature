# Dear Reviewer, my version of VS2022 does not support text enlightening, so I want to provide you with a link to my Online Specflow files.
# Maybe it makes the reviewing process more comfortable. Link: https://app.specflow.org/gherkin-editor/feature/SFSID3kBlbzWHRUCEWiwxd5VcwEBCFQzxMl5Ggm-DbZCLc9A

Feature:1.2.3 Website Footer Options
Interaction with "career.quantori.com" website footer 
provides a user with Data Privacy Policy information, Cookie settings options and 
additional contact opportunities

Background:
Given user opened "qa.career.quantori.com" page

# With "text-containing" elements I refer to elements like links and plain text, whereas "logo-containing" elements are different types of
# clickable buttons (which can be identified by their logos)

Scenario:1.2.3_01 Visibility of footer "text-containing" elements on the "qa.career.quantori.com" page 
When user scrolls to the bottom of "qa.career.quantori.com" page 
Then following text-containing elements should be displayed in the footer: 
|text-containing element                                            |text                                                                    | 
|link                                                               |Data Privacy Policy                                                     | 
|link                                                               |Cookies Settings                                                        | 
|copyright text                                                     |Copyright© 2021 Quantori. Custom Software Solutions. All rights reserved|

Scenario: 1.2.3_02 Visibility of "logo-containing" elements on the "qa.career.quantori.com" page 
When user scrolls to the bottom of the "qa.career.quantori.com" page
Then following logo-containing elements with links should be displayed in the footer:
|logo-containing element|Links to              | 
|link button            |Quantori.com          | 
|link button            |hh.ru                 | 
|link button            |facebook.com          | 
|link button            |Instagram.com         |
|link button            |vk.com                |
|link button            |Linkedin.com          |
|scroll-to-top button   |qa.career.quantori.com|
|mailto button          |default email-client  | 

Scenario:1.2.3_03 "Data Privacy policy" link should be opened in a separate window as a PDF-document
Given user scrolled to the bottom of the "qa.career.quantori.com" page
When user clicks a link with "Data Privacy policy" text
Then a pdf file "Quantori Privacy Policy" should be displayed in the new window

Scenario:1.2.3_04 Default states of checkboxes for the "Cookies Settings" window  
Given user scrolled to the bottom of the "qa.career.quantori.com" page
When user clicks on the link with "Cookies Settings"in the footer
Then a pop-up window "Cookies Settings" should be opened
And "Cookies Settings" pop-up window should contain the following checkboxes:
|Checkbox               |State                 | 
|Necessary cookies      |selected              |
|Other cookies          |not selected          |

Scenario:1.2.3_05 Pop-up window "Cookies Settings" contains a "Submit" button
Given user scrolled to the bottom of the "qa.career.quantori.com" page
And user clicked a link with "Cookies Settings" text in the footer
When a "Cookies Settings" pop-up window with following checkboxes appears:
|Checkbox               |State                 | 
|Necessary cookies      |selected              |
|Other cookies          |not selected          |
Then a "Submit Preferences" button should be displayed

Scenario:1.2.3_06 Pop-up window "Cookies Settings" redirects a user to "Data Privacy policy" pdf file
Given user scrolled to the bottom of the "qa.career.quantori.com" page
And user clicked a link with "Cookies Settings" text in the footer
When a pop-up window with cookies settings appears
And user clicks the "Data Privacy policy" link
Then a pdf file "Quantori Privacy Policy" should be displayed in the new window

Scenario Outline:1.2.3_07 Footer link buttons redirect a user to the corresponding websites
Given user opened "qa.career.quantori.com" 
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

Scenario:1.2.3_8 Footer scroll-to-top button brings a user back to the top of the "qa.career.quantori.com" page
Given user scrolled to the bottom of the "qa.career.quantori.com" page
When user clicks a scroll-to-top button with a "QUANTORI" logo 
Then user returns to the top of the "career.quantori.com" page
And text "Become a part of Quantori team" should be displayed

Scenario:1.2.3_9 Footer mailto button opens a new email window for a user
Given user scrolled to the bottom of the "qa.career.quantori.com" page
When user clicks a mailto button with an "Envelope" logo 
Then a default mail client should be opened
