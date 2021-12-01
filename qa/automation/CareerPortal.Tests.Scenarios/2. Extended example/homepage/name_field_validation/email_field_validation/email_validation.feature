Feature: 1.1.4 Email text field validation

 Background:


 Given User on https://qa-career.quantori.com/ru website
 And User scrolls to the end of page
 And User clicked on email text field

@Positive
Scenario Outline:1.1.8 Validation with valid email
	
	When User fills 'timurabdraimov4@gmail.com' in '<email>' text field
	And user navigates away from blurs the <email> text field
	Then The system displayed that <email> text field correct
	       
	
@negative
Scenario Outline: 1.1.9 Validation with invalid email
	

	When User fills in '<email>' text field
	And user navigates away from blurs the '<email>' text field
	Then The system displayed error that '<email>' text field has "Invalid email format"
	Examples:
	|email                    |
	|timurabdraimov5gmail.com |
	|@Gmail.com               |
	|timurabdraimov           |
	|123134342343243          |
	|!@#$%^&*(@#$%^&*(        |
	|                         |
	|тимурабдраимов           |
	
		


        



