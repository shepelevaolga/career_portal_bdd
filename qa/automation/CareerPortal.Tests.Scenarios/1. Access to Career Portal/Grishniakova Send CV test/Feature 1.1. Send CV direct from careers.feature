Feature 1.1. Send CV directly from the careers main page careers.quantori.com

Scenario User sent CV 
Given User filled in valid alphabetic name and surname
And User filled in valid e-mail
And User attached one file .RTF less than 10 mb
And User put a tick in the checkbox
When User pressed Send
Then User's CV was sent and Thank you message displayed

Scenario User did not fill in name
Given User filled in valid surname with no name
And User filled in valid e-mail
And User attached one file .PDF less than 10 mb
And User put a tick in the checkbox
When User pressed Send
Then the CV was not sent to Quantori and "Name" field higllighted with red with message "Invalid name format"

Scenario User filled in name and surname in wrong format
Given User filled invalid numeric name and surname
And User filled in valid e-mail
And User attached one file .PDF less than 10 mb
And User put a tick in the checkbox
When User pressed Send
Then the CV was not sent to Quantori and "Name" field higllighted with red with message "Invalid name format"

Scenario User filled in wrong email 
Given User filled in valid alphabetic name and surname
And User filled in invalid e-mail with no @
And User attached one file .PDF less than 10 mb
And User put a tick in the checkbox
When User pressed Send
Then the CV was not sent to Quantori and "E-mail" field higllighted with red with message "Invalid name format"

Scenario User filled in email address with wrong format
Given User filled in valid alphabetic name and surname
And User filled in invalid e-mail without dot in .com
And User attached one file .DOC less than 10 mb
And User put a tick in the checkbox
When User pressed Send
Then the CV was not sent to Quantori and "E-mail" field higllighted with red with message "Invalid name format"

Scenario User attached large CV file 
Given User filled in valid alphabetic name and surname
And User filled in valid e-mail
And User attached one file .PDF more than 10 mb
And User put a tick in the checkbox
When User pressed Send
Then the CV was not sent to Quantori and message "Something went wrong" displayed

Scenario User did not accept Personal data agreement
Given User filled in valid alphabetic name and surname
And User filled in valid e-mail
And User attached one file .PDF more than 10 mb
And User did not put a tick in the checkbox
When User pressed Send
Then User can not press "Send" button and "I agree to the personal data processing" checkbox higllighted with red

Scenario User attached large CV file and put only name without surname
Given User filled in invalid alphabetic name and surname
And User filled in valid e-mail
And User attached one file .PDF more than 10 mb
And User put a tick in the checkbox
When User pressed Send
Then User can not press "Send" button and no message displayed

Scenario User attached large CV file and wrote a long message 
Given User filled in valid alphabetic name and surname
And User filled in valid e-mail
And User attached one file .PDF more than 10 mb
And User put a tick in the checkbox
And User wrote a long message above 500 characters
When User pressed Send
Then the CV was not sent to Quantori and message "Something went wrong" displayed

Scenario User wrote a long message 
Given User filled in valid alphabetic name and surname
And User filled in valid e-mail
And User attached one file .PDF less than 10 mb
And User put a tick in the checkbox
When User pressed Send
Then the CV was not sent to Quantori and message "Something went wrong...Check the message field" displayed