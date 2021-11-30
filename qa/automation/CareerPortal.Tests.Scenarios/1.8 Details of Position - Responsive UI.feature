Feature: 1.8 Details of Position - Responsive UI
	Checking adaprive behavior in different window sizes

Background:
Given There is position 'Senior QA'
And The position 'Senior QA' is opened

Scenario: 1.8_01 Placement of UI elements - extra large width
Given Set width of your browser to 1500 px
When User slowly decreaseing width of browser to 1250 px
Then Content is centered
And Name and Email input in one line
And Attach CV button, its lable and Send button are in one line

Scenario: 1.8_02 Placement of UI elements - large width
Given Set width of your browser to 1250 px
When User slowly decreaseing width of browser to 1050 px
Then Width of the content in the middle became smaller, text takes more space vertically

Scenario: 1.8_03 Placement of UI elements - middle width
Given Set width of your browser to 1050 px
When User slowly decreaseing width of browser to 900 px
Then Title became smaller
And Content has more width

Scenario: 1.8_04 Placement of UI elements - small width
Given Set width of your browser to 900 px
When User slowly decreaseing width of browser to 700 px
Then Each control: Name, Email, Message, Attach CV, label of attach, checkbox and Send button takes its own line
And Sned button is the last after checkbox